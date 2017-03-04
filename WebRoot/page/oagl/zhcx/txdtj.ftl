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
			<div class="osx-modal-title">您现在所在的位置：OA系统->值班管理-->调休单统计</div>
		</div>
		<div class='title' style="font-size:20px;width:100%;text-align:center;color:#3399FF;font-family: '微软雅黑 Bold', '微软雅黑';">调休单统计</div>
		<div class="osx-modal-content" id="osx-modal-content" >
			<table id="searchTable" cellpadding="0" cellspacing="0" >
				<tr>
					<!-- <td style="text-align:right;width:70px;"><select id="selectDay" style="width:70px;height:25px;"></select></td>
					<td style="text-align:left;width:25px">年</td>
					<td style="text-align:right;width:45px"><select id="selectMoh" style="width:45px;height:25px;"></select></td>
					<td style="text-align:left;width:25px">月</td>
					<td style="text-align:right"></td>-->
					<td style="text-align:left"><input id="status" type="hidden" value="2"/></td> 
					<td style="text-align:right;width:80px">开始日期：</td>
					<td style="text-align:left;width:100px"><input type="text" id="riqi_s" style="width:90px;" value="${prevMoh?if_exists}" class="Wdate text ui-widget-content ui-corner-all"onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'riqi_e\')}'})"/></td>
					<td style="text-align:right;width:80px">结束日期：</td>
					<td style="text-align:left;width:100px"><input type="text" id="riqi_e" style="width:90px;" value="${toDay?if_exists}" class="Wdate text ui-widget-content ui-corner-all"  onfocus="WdatePicker({minDate:'#F{$dp.$D(\'riqi_s\')}'})"/></td>
					<td style="text-align:left;width:70px"><button id="searchBtn">搜索</button></td>
					<td style="text-align:left;width:100px"><button id="printBtn">批量打印</button></td>
					<td style="text-align:left;width:70px"><button id="exportBtn">导出</button></td>
					<td style="text-align:left;width:250px">&nbsp;</td>
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
		
		var jqg = $("#dataGrid").jqGrid({
			colNames : [ "部门","姓名","日期","结算方式","调休天数","备注" ],
			colModel : [ {
				name : "department_name",
				width : 100,
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
				name : "on_duty_time",
				width : 120,
				sortable : false,
				align : "center",
				formatter : function(key, options, rowObject) {
					return rowObject["on_duty_time"];
				}
			},{
				name : "dalance_status",
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
			},{
				name : "zhibantianshu",
				width : 80,
				sortable : false,
				align : "center",
				formatter : function(key, options, rowObject) {
					return rowObject["jiesuantianshu"];
				}
			},{
				name : "remarks",
				width : 300,
				sortable : false,
				align : "center",
				formatter : function(key, options, rowObject) {
					return rowObject["remarks"];
				}
			}],
			datatype : "json", //将这里改为使用JSON数据
			url : "${gzUrl('oagl/zhcx/zbList.do')}", //这是Action的请求地址
			mtype : 'POST',
			postData : {
				 status:"2",
				 riqi_s:$("#riqi_s").val(),
				 riqi_e:$("#riqi_e").val()
			},
			pager : $("#pager"),
			rowNum : 20,
			shrinkToFit : false,
			rownumbers : false,
			hidegrid : false,
			multiselect : true,
			multiselectWidth:35,
			viewrecords : true,
			height : "100%",
			width : '100%',
			rowList : [ 20, 40, 60 ],
			loadComplete : function() {
				var rowNum = $("#dataGrid").getGridParam("rowNum");
			},gridComplete: function() {
                var rowIds = jQuery("#dataGrid").jqGrid('getDataIDs');
                for(var k=0; k<rowIds.length; k++) {
                   var curRowData = jQuery("#dataGrid").jqGrid('getRowData', rowIds[k]);
                   var curChk = $("#"+rowIds[k]+"").find(":checkbox");
                   curChk.attr('name', 'checkbox_assetsId');   //给每一个checkbox赋名字
                   curChk.attr('value', rowIds[k]);   		   //给checkbox赋值
               }
            },caption : "调休单统计列表"
		});
		
		$("#searchBtn").button().click(function(){
			event.preventDefault();
			var staffid = $("#userList option[value="+$("#userList").val()+"]").attr("staffid");
			if(!staffid){
				staffid="-1";
			}
			jQuery("#dataGrid").jqGrid('setGridParam', {
				postData : {
				 	status:"2",
				 	riqi_s:$("#riqi_s").val(),
				 	riqi_e:$("#riqi_e").val()
				}
			}).trigger('reloadGrid');
		});
		$("#exportBtn").button().click(function(){
			var staffid = $("#userList option[value="+$("#userList").val()+"]").attr("staffid");
			if(!staffid)staffid="-1";
			var url="${gzUrl('oagl/zhcx/zbList.do')}?methodType=exportData";
			var params= new Array();
			params.push(url);
			params.push("status=2");
			params.push("title=1");
			params.push("riqi_s="+$("#riqi_s").val());
			params.push("riqi_e="+$("#riqi_e").val());
			window.open(params.join("&"));
		});
		$("#printBtn").button().click(function(){
			var checkbox = jQuery("#dataGrid .cbox");
			var selected_staff_names = new Array();
			var selected_days = new Array();
			for(var i in checkbox){
				var c = checkbox[i];
				if(c.tagName&&c.checked){
				 	var curRowData = jQuery("#dataGrid").jqGrid('getRowData', c.value);
					selected_days.push(curRowData.on_duty_time);
					selected_staff_names.push(curRowData.staff_name);
				}
			}
			if(selected_staff_names.length>0){
				var html = new Array();
				html.push("<form style='display:none' action='${gzUrl('oagl/zhcx/zbList.do')}?methodType=exportDataPiliang' target='_blank' method='post' >");
				html.push("<input name='staff_names' type='hidden' value='"+ selected_staff_names.join(";") +"' />");
				html.push("<input name='days' type='hidden' value='"+ selected_days.join(";") +"' />");
				html.push("</form>");
				var htmlObj = $(html.join(""));
				$("body").append(htmlObj);
				htmlObj.submit();
				htmlObj.remove();
			}else{
				alert("请选择要批量打印的对象！");
			}
		});
		$("#pageloading").hide();
	});
</script>
<#include "../../foot.ftl" />