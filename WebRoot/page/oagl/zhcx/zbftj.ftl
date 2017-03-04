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
			<div class="osx-modal-title">您现在所在的位置：OA系统->值班管理->值班费统计</div>
		</div>
		<div class='title' style="font-size:20px;width:100%;text-align:center;color:#3399FF;font-family: '微软雅黑 Bold', '微软雅黑';">值班费统计</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<table id="searchTable" style="width:967px" cellpadding="0" cellspacing="0">
				<tr>
					<!-- <td style="text-align:right">&nbsp;<select id="selectDay" style="width:70px;height:25px;"></select></td>
					<td style="text-align:left">年</td>
					<td style="text-align:right">&nbsp;<select id="selectMoh" style="width:45px;height:25px;"></select></td>
					<td style="text-align:left">月</td>-->
					<td style="text-align:left"><input id="status" type="hidden" value="2"/></td> 
					<td style="text-align:right">&nbsp;开始日期：</td>
					<td style="text-align:left"><input type="text" id="riqi_s" style="width:90px;" value="${prevMoh?if_exists}" class="Wdate text ui-widget-content ui-corner-all" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'riqi_e\')}'})"/></td>
					<td style="text-align:right">&nbsp;结束日期：</td>
					<td style="text-align:left"><input type="text" id="riqi_e" style="width:90px;" value="${toDay?if_exists}"  class="Wdate text ui-widget-content ui-corner-all" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'riqi_s\')}',maxDate:'%y-%M-%d'})"/></td>
					<td style="text-align:left">&nbsp;<button id="searchBtn">搜索</button></td>
					<td style="text-align:left"><button id="exportBtn">导出</button></td>
					<td style="width:335px">&nbsp;</td>
				</tr>
			</table>
		</div>
		<table id="dataGrid"></table>
		<div id="pager"></div>
	</div>
	<br/>
	<div style="padding-left:10px;display:none">
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
		
		var jqg = $("#dataGrid").jqGrid({
			colNames : [ "编号","姓名","工作日天数","双休日天数","三薪日天数","合计系数","基数","合计饭贴","小计" ],
			colModel : [ {
				name : "user_code",
				width : 100,
				sortable : false,
				align : "center",
				formatter : function(key, options, rowObject) {
					return rowObject["user_code"];
				}
			}, {
				name : "user_name",
				width : 100,
				sortable : false,
				align : "center",
				formatter : function(key, options, rowObject) {
					return rowObject["user_name"];
				}
			}, {
				name : "status2",
				width : 100,
				sortable : false,
				align : "center",
				formatter : function(key, options, rowObject) {
					return rowObject["status2"];
				}
			}, {
				name : "status1",
				width : 100,
				sortable : false,
				align : "center",
				formatter : function(key, options, rowObject) {
					return rowObject["status1"];
				}
			}, {
				name : "status3",
				width : 100,
				sortable : false,
				align : "center",
				formatter : function(key, options, rowObject) {
					return rowObject["status3"];
				}
			}, {
				name : "sumXiShu",
				width : 100,
				sortable : false,
				align : "center",
				formatter : function(key, options, rowObject) {
					return rowObject["sumXiShu"];
				}
			}, {
				name : "baseShu",
				width : 100,
				sortable : false,
				align : "center",
				formatter : function(key, options, rowObject) {
					return rowObject["baseShu"];
				}
			}, {
				name : "sumFanTie",
				width : 100,
				sortable : false,
				align : "center",
				formatter : function(key, options, rowObject) {
					return rowObject["sumFanTie"];
				}
			}, {
				name : "sum",
				width : 100,
				sortable : false,
				align : "center",
				formatter : function(key, options, rowObject) {
					return rowObject["sum"];
				}
			}],
			datatype : "json", //将这里改为使用JSON数据
			url : "${gzUrl('oagl/zhcx/zbftj.do')}", //这是Action的请求地址
			mtype : 'POST',
			postData : {
				 status:"3",
				 riqi_s:$("#riqi_s").val(),
				 riqi_e:$("#riqi_e").val()
			},
			pager : $("#pager"),
			rowNum : 20,
			shrinkToFit : false,
			rownumbers : false,
			hidegrid : false,
			multiselect : true,
			multiselectWidth : 35,
			viewrecords : true,
			height : "100%",
			width : '100%',
			rowList : [ 20, 40, 60 ],
			loadComplete : function() {
				var rowNum = $("#dataGrid").getGridParam("rowNum");
			},
			caption : "值班统计列表"
		});
		
		$("#searchBtn").button().click(function(){
			var staffid = $("#userList option[value="+$("#userList").val()+"]").attr("staffid");
			if(!staffid){
				staffid="-1";
			}
			jQuery("#dataGrid").jqGrid('setGridParam', {
				postData : {
				 	status:"3",
				 	riqi_s:$("#riqi_s").val(),
				 	riqi_e:$("#riqi_e").val()
				}
			}).trigger('reloadGrid');
		});
		$("#exportBtn").button().click(function(){
			var staffid = $("#userList option[value="+$("#userList").val()+"]").attr("staffid");
			if(!staffid)staffid="-1";
			var url="${gzUrl('oagl/zhcx/zbftj.do')}?methodType=exportData";
			var params= new Array();
			params.push(url);
			params.push("status=3");
			params.push("riqi_s="+$("#riqi_s").val());
			params.push("riqi_e="+$("#riqi_e").val());
			open(params.join("&"));
		});
		$("#pageloading").hide();
	});
</script>
<#include "../../foot.ftl" />