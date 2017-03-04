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
.ui-jqgrid tr.ui-row-ltr td {
font-size: 14px;
}
.ui-jqgrid .ui-jqgrid-htable th div {
font-size: 14px;
}
#searchTable{
	margin: 3px;
	border: 1px solid silver;
}
</style>
</head>
<body>
	<div id="pageloading"></div>
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：OA系统->考勤管理->状态综合查询</div>
		</div>
		<div class='title' style="font-size:20px;width:100%;text-align:center;color:#3399FF;font-family: '微软雅黑 Bold', '微软雅黑';">状态综合查询</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<table id="searchTable" cellpadding="0" cellspacing="0" style="width:1050px">
				<tr>
					<td style="text-align:right;width:50px">部门：</td>
					<td style="text-align:left;">
						<select id="deptList" style="width:100px;height: 25px;">
							<option value="-1">请选择</option>
							<#if deptList?exists>
								<#list deptList as department>
									<option value="${department.id}">${department.name}</option>
								</#list>
							</#if>
						</select>
					</td>
					<td style="text-align:right;width:50px">姓名：</td>
					<td style="text-align:left;width: 150px;">
						<select id="userList" style="width:70px">
							<option value="-1">请选择</option>
						</select>
					</td>
					<td style="text-align:right;width:50px">状态：</td>
					<td style="text-align:left">
						<select id="status" style="height: 25px;">
							<option value="-1">所有</option>
							<#if dictList?exists>
								<#list dictList as dict>
									<option value='${dict.code}'>${dict.name}</option>
								</#list>
							</#if>
						</select>
					</td>
					<td style="text-align:right"><select id="selectDay" style="width:70px;height: 25px;"></select></td>
					<td style="text-align:left">年</td>
					<td style="text-align:right"><select id="selectMoh" style="width:45px;height: 25px;"></select></td>
					<td style="text-align:left">月</td>
					<td style="text-align:right;width:80px">开始日期：</td>
					<td style="text-align:left"><input type="text" id="riqi_s" style="width:90px;" class="Wdate text ui-widget-content ui-corner-all" value="${prevMoh?if_exists}" onfocus="WdatePicker()"/></td>
					<td style="text-align:right;width:80px">结束日期：</td>
					<td style="text-align:left"><input type="text" id="riqi_e" style="width:90px;" class="Wdate text ui-widget-content ui-corner-all" value="${toDay?if_exists}"onfocus="WdatePicker()"/></td>
					<td style="text-align:left;width:75px"><button id="searchBtn">搜索</button></td>
					<td style="text-align:left;width:75px"><button id="exportBtn">导出</button></td>
				</tr>
			</table>
		</div>
		<table id="dataGrid"></table>
		<div id="pager"></div>
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
		
		$("#dataGrid").jqGrid({
			colNames : [ "部门","姓名","日期","时间","状态","备注" ],
			colModel : [ {
				name : "department_name",
				width : 150,
				sortable : false,
				align : "center",
				formatter : function(key, options, rowObject) {
					return rowObject["department_name"];
				}
			},{
				name : "staff_name",
				width : 100,
				sortable : false,
				align : "center",
				formatter : function(key, options, rowObject) {
					return rowObject["staff_name"];
				}
			},{
				name : "attendance_time",
				width : 120,
				sortable : false,
				align : "center",
				formatter : function(key, options, rowObject) {
					return rowObject["attendance_time"];
				}
			},{
				name : "time_detail_name",
				width : 100,
				sortable : false,
				align : "center",
				formatter : function(key, options, rowObject) {
					return rowObject["time_detail_name"];
				}
			},{
				name : "attendance_name",
				width : 80,
				sortable : false,
				align : "center",
				formatter : function(key, options, rowObject) {
					return rowObject["attendance_name"];
				}
			},{
				name : "remarks",
				width : 400,
				sortable : false,
				align : "center",
				formatter : function(key, options, rowObject) {
					return rowObject["remarks"];
				}
			}],
			datatype : "json", //将这里改为使用JSON数据
			url : "${gzUrl('oagl/zhcx/list.do')}", //这是Action的请求地址
			mtype : 'POST',
			postData : {
				 deptid:$("#deptList").val(),
				 userid:$("#userList").val(),
				 staffid:$("#userList option[value="+$("#userList").val()+"]").attr("staffid"),
				 status:$("#status").val(),
				 selectDay:$("#selectDay").val(),
				 selectMoh:$("#selectMoh").val(),
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
			caption : "状态综合查询列表"
		});
		
		$("#searchBtn").button().click(function(){
			var staffid = $("#userList option[value="+$("#userList").val()+"]").attr("staffid");
			if(!staffid){
				staffid="-1";
			}
			jQuery("#dataGrid").jqGrid('setGridParam', {
				postData : {
					deptid:$("#deptList").val(),
					userid:$("#userList").val(),
				 	staffid:staffid,
				 	status:$("#status").val(),
				 	selectDay:$("#selectDay").val(),
				 	selectMoh:$("#selectMoh").val(),
				 	riqi_s:$("#riqi_s").val(),
				 	riqi_e:$("#riqi_e").val()
				}
			}).trigger('reloadGrid');
		});
		$("#exportBtn").button().click(function(){
			event.preventDefault();
			var staffid = $("#userList option[value="+$("#userList").val()+"]").attr("staffid");
			if(!staffid)staffid="-1";
			var url="${gzUrl('oagl/zhcx/list.do')}?methodType=exportData";
			var params= new Array();
			params.push(url);
			params.push("deptid="+$("#deptList").val());
			params.push("userid="+$("#userList").val());
			params.push("staffid="+staffid);
			params.push("status="+$("#status").val());
			params.push("selectDay="+$("#selectDay").val());
			params.push("selectMoh="+$("#selectMoh").val());
			params.push("riqi_s="+$("#riqi_s").val());
			params.push("riqi_e="+$("#riqi_e").val());
			window.open(params.join("&"));
		});
		
		$("#userList").combobox();
		$("#pageloading").hide();
	});
</script>
<#include "../../foot.ftl" />