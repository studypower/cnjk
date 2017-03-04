<#include "../../head.ftl" />
<link href="${gzUrl('script/artDialog4.1.7/skins/blue.css')}" type="text/css" rel="stylesheet" />
<script src="${gzUrl('script/artDialog4.1.7/jquery.artDialog.js')}" charset="utf-8"></script>
<script src="${gzUrl('script/My97DatePicker/WdatePicker.js')}" ></script>
<style>
*{
  font-size:14px;
}
.ui-jqgrid tr.ui-row-ltr td {
font-size: 14px;
}
.ui-jqgrid .ui-jqgrid-htable th div {
font-size: 14px;
}
body{
	overflow: overlay;
	overflow:scroll;
}
.ddtable th{
	padding:3px;
	height:22px;
	border: 1px solid silver;
	border-left:0px;
}
.ddtable td{
	padding:2px;
	border: 1px solid silver;
	border-left:0px;
	border-top:0px;
}
.ddtable tr td:FIRST-CHILD,.ddtable tr th:FIRST-CHILD{
	border-left: 1px solid silver;
}

</style>
</head>
<body>
	<div id="pageloading"></div>
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：OA系统->系统设置->薪水基数维护</div>
		</div>
		<button>新增基数</button>
		<table id="dataGrid"></table>
		<div id="pager"></div>
	</div>
	<iframe name="_biframe" id="_biframe" src="" style="display:none" ></iframe>
	<div id="div_tpl" style="display:none">
		<table cellpadding="0" cellspacing="3" style="width:320px;">
			<tr>
				<td style="text-align: right;width:90px;"><b>基数：</b></td>
				<td><input id="baseMoney" name="baseMoney" type="text" maxlength="10" style="width:150px;" class="text ui-widget-content ui-corner-all " /></td>
			</tr>
			<tr>
				<td style="text-align: right;"><b>开始日期：</b></td>
				<td><input type="text" id="startTime" name="startTime" maxlength="10" class="Wdate text ui-widget-content ui-corner-all" style="width:150px" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endTime\')}'})"/></td>
			</tr>
			<tr>
				<td style="text-align: right;"><b>结束日期：</b></td>
				<td><input type="text" id="endTime" name="endTime" maxlength="10" class="Wdate text ui-widget-content ui-corner-all" style="width:150px" onClick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'startTime\')}'})"/></td>
			</tr>
		</table>
	</div>
</body>
<script type="text/javascript">
	//设置删除信息	
	var baseMoneyDelete = function(id){
		if(confirm("确定要删除该时间段吗?")){
			$.post("${gzUrl('oagl/baseMoney/delete.do')}",{id:id},function(j){
				if(j=='true'){
					jQuery("#dataGrid").jqGrid('setGridParam', {
						postData : {}
					}).trigger('reloadGrid');
				}
			});
		}
	}
	
	var  baseMoneySaveOrUpdate = function(id){
		var html ="<form method='post' id='addNewForm' target='_biframe' action='${gzUrl('oagl/baseMoney/saveOrUpdate.do')}' >"+$("#div_tpl").html()+"</form>";
		var djlog = art.dialog({
					id : "dialog",
					content : html,
					title:(id?'维护':'新增')+'薪水基数',
					padding : "0px",
					width : 300,
					init:function(){
						if(id){
							$.ajax({
								url:"${gzUrl('oagl/baseMoney/get.do')}",
								data:{id:id},
								type:"POST",
								async:false,
								dataType:"json",
								success:function(j){
									$("#addNewForm #baseMoney").val(j.BASE_MONEY);
									$("#addNewForm #startTime").val(j.START_TIME);
									$("#addNewForm #endTime").val(j.END_TIME);
								}
							});
						}
					},
					lock : true,
					ok : function(){
						var baseMoney = $("#addNewForm #baseMoney").val();
						var startTime = $("#addNewForm #startTime").val();
						var endTime = $("#addNewForm #endTime").val();
						if(!isNumber(baseMoney)){
							alert("基数不能为空，且必须为数字");
							return false;
						}
						if(startTime==""){
							alert("开始日期不能为空");
							return false;
						}
						if(endTime==""){
							alert("结束日期不能为空");
							return false;
						}
						if(id){
							$("#addNewForm").append("<input name='id' type='hidden' value='"+id+"'/>");
						}
						$("#addNewForm").submit();
						var interval = setInterval(function(){
							if($("#_biframe").contents()[0].body.innerText=="true"){
								 jQuery("#dataGrid").jqGrid('setGridParam', {
									 postData : {}
								 }).trigger('reloadGrid');
								clearInterval(interval);
								 djlog.close();
							}
						},300);
						return false;
					},
					okVal:'保存',
					cancel : true
				});
	}
	var isNumber = function(value){
		var reg = new RegExp("^[0-9]*$");  
	    if(value==""){
	    	return false;
	    }
	    if(!reg.test(value)){  
	        return false;
	    } 
	    if(!/^[0-9]*$/.test(value)){  
	        return false;
	    }
	    return true;
	}
	$(function(){
	var jqg =$("#dataGrid").jqGrid({
			colNames : [ "开始日期","结束日期","基数(元)","操作" ],
			colModel : [ 
				{name : "START_TIME",width : 140,sortable : false,align : "center"},
				{name : "END_TIME",width : 140,sortable : false,align : "center"},
				{name : "BASE_MONEY",width : 140,sortable : false,align : "center"},
				{name : "",width:100,sortable:false,align : "center",
					formatter : function(key, options, rowObject) {
						var id = rowObject["ID"];
						var html=new Array();
						html.push("<a href=\"javascript:baseMoneySaveOrUpdate('"+id+"');\">修改</a>");
						html.push("<a href=\"javascript:baseMoneyDelete('"+id+"');\">删除</a>");
						return html.join(" ");
					}
				}
			],
			datatype : "json", //将这里改为使用JSON数据
			url : "${gzUrl('oagl/baseMoney/list.do')}", //这是Action的请求地址
			mtype : 'POST',
			postData : {},
			pager : $("#pager"),
			rowNum : 20,
			shrinkToFit : false,
			rownumbers : false,
			hidegrid : false,
			multiselect : false,
			multiselectWidth:30,
			viewrecords : true,
			height : "100%",
			width : '100%',
			rowList : [ 20, 40, 60 ],
			loadComplete : function() {
				var rowNum = $("#dataGrid").getGridParam("rowNum");
			},
			caption : "薪水基数维护列表"
		});
		$("button").button().click(function(){
			baseMoneySaveOrUpdate();
		});
		$("#pageloading").hide();
	});
</script>
<#include "../../foot.ftl" />