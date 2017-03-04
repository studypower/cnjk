<#include "../../head.ftl" />
<link href="${gzUrl('script/artDialog4.1.7/skins/blue.css')}" type="text/css" rel="stylesheet" />
<script src="${gzUrl('script/artDialog4.1.7/jquery.artDialog.js')}" charset="utf-8"></script>
<script src="${gzUrl('script/My97DatePicker/WdatePicker.js')}" ></script>
<style>
*{
	font-size:14px;
}
body{
	overflow: overlay;
		overflow:scroll;
}
#searchTable{
	margin: 3px;
	border: 1px solid silver;
}

.ui-jqgrid tr.ui-row-ltr td {
font-size: 14px;
}
.ui-jqgrid .ui-jqgrid-htable th div {
font-size: 14px;
}
</style>
</head>
<body>
	<div id="pageloading"></div>
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：OA系统->值班管理->值班综合查询</div>
		</div>
		<div class='title' style="font-size:20px;width:100%;text-align:center;color:#3399FF;font-family: '微软雅黑 Bold', '微软雅黑';">值班综合查询</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<table id="searchTable" cellpadding="0" cellspacing="0" style="width:975px">
				<tr>
					<td style="text-align:right;width:60px;">部门：</td>
					<td style="text-align:left">
						<select id="deptList" style="width:100px;height:25px">
							<option value="-1">请选择</option>
							<#if deptList?exists>
								<#list deptList as department>
									<option value="${department.id}">${department.name}</option>
								</#list>
							</#if>
						</select>
					</td>
					<td style="text-align:right;width:60px;">姓名：</td>
					<td style="text-align:left;width:180px">
						<select id="userList" style="width:70px">
							<option value="-1">请选择</option>
						</select>
					</td>
					<td style="text-align:right;width:120px;">结算方式：</td>
					<td style="text-align:left">
						<select id="status" style="height:25px">
							<option value="-1">请选择</option>
							<!-- <option value="1">待处理</option> -->
							<option value="2">调休</option>
							<option value="3">值班费</option>
						</select>
					</td>
					<td style="text-align:right;width:120px;">开始日期：</td>
					<td style="text-align:left"><input type="text" id="riqi_s" style="width:90px;" class="Wdate text ui-widget-content ui-corner-all" value="${prevMoh?if_exists}" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'riqi_e\')}'})"/></td>
					<td style="text-align:right;width:120px;">结束日期：</td>
					<td style="text-align:left"><input type="text" id="riqi_e" style="width:90px;" class="Wdate text ui-widget-content ui-corner-all" value="${toDay?if_exists}" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'riqi_s\')}',maxDate:'%y-%M-%d'})"/></td>
					<td style="text-align:left;width:80px;"><button id="searchBtn">搜索</button></td>
					<td style="text-align:left;width:80px;"><button id="exportBtn">导出</button></td>
					<td style="width:90px;">&nbsp;</td>
				</tr>
			</table>
		</div>
		<table id="dataGrid"></table>
		<div id="pager"></div>
	</div>
	<br/>
	<div style="padding-left:10px;display:none">
			值班调休算法：工作日值班一天可调休0.5天，双休日、三薪日值班一天可调休1.5天；<br/>
			值班费算法：基数*天数*系数+饭贴。基数可在系统内设定。工作日值班一天系数为1，饭贴10；双休日值班一天系数为3，饭贴20；三薪日值班一天系数为4.5，饭贴20。目前基数为84。
	</div>
	<div id="optionUsers" style="display:none">
		<#if deptList?exists>
			<#list deptList as department>
				<#if department.userList?exists>
					<#list department.userList as user>
						<option value="${user.id}" n="${user.name }" d="${department.id}" staffid="${user.staff_id}" t="ud" >${user.username}</option>
					</#list>
				</#if>
			</#list>
		</#if>
	</div>
</body>
<script type="text/javascript">
	var curYear = new Date().getYear() + 1900;
	var curMoh = new Date().getMonth() + 1;
	var curDay = new Date().getDate();
	var curD = curYear+ "-"+ (curMoh<10?"0":"") + curMoh + "-" + (curDay<10?"0":"") + curDay;
	
	$(function() {
		var selectDay = $("#selectDay");
		for(var initYear = 2014;initYear<=2020;initYear++){
			if(initYear==curYear){
				selectDay.append("<option selected>"+initYear+"</option>");
			}else{
				selectDay.append("<option >"+initYear+"</option>");
			}
		}
		var selectMoh = $("#selectMoh");
		for(var initMoh = 1;initMoh<=12;initMoh++){
			if(initMoh==curMoh-1){
				selectMoh.append("<option selected>"+initMoh+"</option>");
			}else{
				selectMoh.append("<option >"+initMoh+"</option>");
			}
		}
		
		$("#selectDay,#selectMoh").change(function(){
			var year = selectDay.val();
			var moh  = selectMoh.val();
			var day = "01";
			$("#riqi_s").val(year + "-" +(moh<10?"0":"")+ moh + "-" + day);
		});
		
		var options = $("#optionUsers option");
		var userList = $("#userList");
		$("#deptList").change(function(){
			var value = $(this).val();
			userList.find("option[t=ud]").remove();
			if(value != -1){
				options.each(function(){
					if($(this).attr("d")==value){
						userList.append($(this).clone());
					}
				});
			}else{
				options.each(function(){
					userList.append($(this).clone());
				});
			}
		}).change();
		
		var jqg =$("#dataGrid").jqGrid({
			colNames : [ "部门","姓名","日期","结算方式","调休天数","值班费","备注" ],
			colModel : [ 
				{name : "department_name",width : 140,sortable : false,align : "center"},
				{name : "staff_name",width : 100,sortable : false,align : "center"},
				{name : "on_duty_time",width : 120,sortable : false,align : "center"},
				{name : "dalance_status",
					width : 100,
					sortable : false,
					align : "center",
					formatter : function(key, options, rowObject) {
						var dalance_status = rowObject["dalance_status"];
						if(dalance_status){
							var m = {1:'待确认',2:'调休',3:'值班费'};
							return m[dalance_status];
						}
						return "";
					}
			},
			{name : "jiesuantianshu",width:100,sortable:false,align : "center"},
			{name : "feiyong",width : 100,sortable : false,	align : "center"},
			{name : "remarks",width : 300,sortable : false, align : "center"}
			],
			datatype : "json", //将这里改为使用JSON数据
			url : "${gzUrl('oagl/zhcx/zbList.do')}", //这是Action的请求地址
			mtype : 'POST',
			postData : {
				 deptid:$("#deptList").val(),
				 userid:$("#userList").val(),
				 staffid:$("#userList option[value="+$("#userList").val()+"]").attr("staffid"),
				 status:$("#status").val(),
				 riqi_s:$("#riqi_s").val(),
				 riqi_e:$("#riqi_e").val()
			},
			pager : $("#pager"),
			rowNum : 20,
			shrinkToFit : false,
			rownumbers : false,
			hidegrid : false,
			multiselect : true,
			multiselectWidth:30,
			viewrecords : true,
			height : "100%",
			width : '100%',
			rowList : [ 20, 40, 60 ],
			loadComplete : function() {
				var rowNum = $("#dataGrid").getGridParam("rowNum");
			},
			caption : "值班综合查询列表"
		});
		
		$("#searchBtn").button().click(function(){
			//event.preventDefault();
			var staffid = $("#userList option[value="+$("#userList").val()+"]").attr("staffid");
			if(!staffid){
				staffid="-1";
			}
			var status = $("#status").val();
			if(status=="2"){
				jqg.hideCol(["feiyong"]);
				jqg.showCol(["jiesuantianshu"]);
			}else if(status=="3"){
				jqg.hideCol(["jiesuantianshu"]);
				jqg.showCol(["feiyong"]);
			}else if(status=="1"){
				jqg.hideCol(["feiyong","jiesuantianshu"]);
			}else{
				jqg.showCol(["feiyong","jiesuantianshu"]);
			}
			jQuery("#dataGrid").jqGrid('setGridParam', {
				postData : {
					deptid:$("#deptList").val(),
					userid:$("#userList").val(),
				 	staffid:staffid,
				 	status:status,
				 	riqi_s:$("#riqi_s").val(),
				 	riqi_e:$("#riqi_e").val()
				}
			}).trigger('reloadGrid');
		});
		$("#exportBtn").button().click(function(){
			//event.preventDefault();
			var staffid = $("#userList option[value="+$("#userList").val()+"]").attr("staffid");
			if(!staffid)staffid="-1";
			
			var url="${gzUrl('oagl/zhcx/zbList.do')}?methodType=exportData";
			var params= new Array();
			params.push(url);
			params.push("deptid="+$("#deptList").val());
			params.push("userid="+$("#userList").val());
			params.push("staffid="+staffid);
			params.push("status="+$("#status").val());
			params.push("riqi_s="+$("#riqi_s").val());
			params.push("riqi_e="+$("#riqi_e").val());
			window.open(params.join("&"));
		});
		$("#userList").combobox();
		$("#pageloading").hide();
	});
</script>
<#include "../../foot.ftl" />