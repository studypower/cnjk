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
	border: 0px solid silver;
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
			<div class="osx-modal-title">您现在所在的位置：OA系统->值班管理->
				值班
					<#if dutyType?if_exists== "1" >领导</#if>
					<#if dutyType?if_exists== "2" >小分队</#if>
					<#if dutyType?if_exists== "3" >总</#if>
				排班</div>
		</div>
		<div class='title' style="font-size:20px;width:100%;text-align:center;color:#3399FF;font-family: '微软雅黑 Bold', '微软雅黑';">
			值班
					<#if dutyType?if_exists== "1" >领导</#if>
					<#if dutyType?if_exists== "2" >小分队</#if>
					<#if dutyType?if_exists== "3" >总</#if>
				排班
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<table id="searchTable" cellpadding="0" cellspacing="0">
				<tr style="display:none">
					<td style="text-align:right;width:80px">状态：</td>
					<td style="text-align:left;width:150px">
						<select name="is_Enable" id="is_Enable" >
							<option value="-1">----全部----</option>
							<option value="1">已启用</option>
							<option value="0">已禁用</option>
						<select>
					</td>
				</tr>
				<tr>
					<td style="text-align:left;" colspan="2" >
						<button id="addNewBtn" style="wdith:100px;" onclick="addNewAndEditShow()">排班设置</button>
						<button id="previewBtn" style="wdith:120px;" onclick="open('${gzUrl('oagl/glgn/zbrlwh.do?preview=true')}','','height=600,width=1100,top=0,left=0,boolbar=no,location=no,status=no')" >值班预览</button>
					</td>
				</tr>
				<tr>
					<td colspan="2" style='font-size:12px;color:green'>如果新增排班时间和原有排班时间重叠，则排班内容将会覆盖重叠时间部分的排班人员。<br/>
						排班设置时系统会自动生成未来的值班记录，工作量巨大，比较耗时，请尽量不要设置超过2年的时间跨度！</td>
				</tr>
			</table>
		</div>
		<table id="dataGrid"></table>
		<div id="pager"></div>
	</div>
	<div id="selectTpl" style="display:none">
	<select>
		<option value="">--请选择--</option>
		<#if departmentList?exists>
		<#list departmentList as department>
			<#if department.userList?size != 0>
				<optgroup label="${department.name}">
					<#list department.userList as user>
						<option value="${user.staff_id}">${user.username}</option>
					</#list>
				</optgroup>
			</#if>
		</#list>
		</#if>
	</select>
	</div>
	<div id="htmlTpl" style="display:none">
		<table>
			<tr>
				<td style="text-align:right;">开始时间:</td>
				<td><input type='text' id='start_time' style='width:105px;' value="${minDate}"  onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'end_time\')}',minDate:'${minDate}'})" class="Wdate text ui-widget-content ui-corner-all" /></td>
				<td style="text-align:right;">结束时间:</td>
				<td><input type='text' id='end_time' style='width:105px;' onFocus="WdatePicker({minDate:'#F{$dp.$D(\'start_time\')}',maxDate:'${maxDate}'})" class="Wdate text ui-widget-content ui-corner-all" /></td>
			</tr>
			<tr>
				<td style="text-align:right;">排班类型:</td>
				<td >
						<select name="rule_type_" id="rule_type_" disabled=disabled>
							<option value="-1">----请选择----</option>
							<option value="1">领导值班</option>
							<option value="2">小分队听班</option>
							<option value="3">总值班</option>
						<select>
				</td>
				<td style="text-align:right;">值班开始名单:</td>
				<td >
						<select name="start_teamorder_no_id" id="start_teamorder_no_id" >
							<#if zbTeamBizList?exists>
								<#list zbTeamBizList as team>
									<option value="${team.onduty_order}-${team.id}">
										${team.staff_name1?if_exists}<#if team.onduty_staff_type != 1> — </#if>${team.staff_name2?if_exists}
									</option>
								</#list>
							</#if>
						<select>
				</td>
			</tr>
			<tr style="display:none">
				<td style="text-align:right;" >是否启用:</td>
				<td colspan="3"><input name="is_Enable" id="is_Enable" value="1" disabled="disabled" type="hidden" checked /></td>
			</tr>
		</table>
	</div>
</body>
<script type="text/javascript">
$(function(){
	//----------------------------------------------------------------grid start
	var rule_typeMap={1:'领导值班',2:'小分队听班',3:'总值班'};
	var dataObjs={};
	$("#dataGrid").jqGrid({
			colNames : [ "编号","开始时间","结束时间","类型","值班开始名单","排班日期","操作人"],
			colModel : [ 
						{index:"id",name : "id",width : 45,sortable : false,align : "center"},
						{index:"start_time",name : "start_time",width : 100,sortable : false,align : "center"},
						{index:"end_time",name : "end_time",width : 100,sortable : false,align : "center",formatter:function(key, options, rowObject){return  rowObject["end_time"]?rowObject["end_time"]:"无限延长";}},
						{index:"rule_type",name : "rule_type",width : 100,sortable : false,align : "center",formatter:function(key, options, rowObject){return rule_typeMap[rowObject["rule_type"]];}},
						{index:"staff_name",name:"staff_name",width : 150,sortable : false,align : "center",
							formatter:function(key, options, rowObject){
								var staff_name = rowObject["staff_name1"];
								if(rowObject["staff_name2"]){
									staff_name += " — "+rowObject["staff_name2"]
								}
								return staff_name;
							}
						},
						{index:"create_time",name : "create_time",width : 125,sortable : false,align : "center"},
						{index:"create_user",name : "create_user",width : 100,sortable : false,align : "center"}
				 ],
			datatype : "json", //将这里改为使用JSON数据
			url : "${gzUrl('oagl/glgn/zbTeamBizRuleList.do')}", //这是Action的请求地址
			mtype : 'POST',
			postData : {
				'duty_name' : $("#duty_name").val(),
				'is_Enable': $("#is_Enable").val(),
				'rule_type':"${dutyType?if_exists}"
			},
			pager : $("#pager"),
			rowNum : 20,
			shrinkToFit : false,
			rownumbers : false,
			hidegrid : false,
			multiselect : false,
			viewrecords : true,
			height : "100%",
			rowList : [ 20, 40, 60 ],
			loadComplete : function() {
				var rowNum = $("#dataGrid").getGridParam("rowNum");
			},
			caption : "排班记录列表"
		});
	//----------------------------------------------------------------grid end
	
	//---------------------------------------------------------------- 启用禁用删除 start
	window.zbteamDelete = function(id){
		if(confirm("确定要删除该数据吗？")){
			$.post("${gzUrl('oagl/glgn/zbTeamRuleEnableAndDelete.do')}",{is_Delete:1,id:id},function(resp){
				if(resp&&resp=="true"){
					$("#searchBtn").click();
				}else{
					alert("删除失败，请联系管理员处理。");
				}
			});
		}
	}
	window.zbteamEnable = function(id,isEnable,rule_type){
		var msg="";
		if(isEnable=="0"){
			msg="禁用该排版后，未生效的排班人员将会移除值班列表";
		}else{
			msg="启用该排版后，原有的排班人员将会被覆盖";
		}
		if(confirm(msg +"确定"+(isEnable==1?"启用":"禁用")+"该排班数据吗？")){
			$.post("${gzUrl('oagl/glgn/zbTeamRuleEnableAndDelete.do')}",{is_Enable:isEnable,id:id,rule_type:rule_type},function(resp){
				if(resp&&resp=="true"){
					$("#searchBtn").click();
				}else{
					alert("状态修改失败，请联系管理员处理。");
				}
			});
		}
	}
	//---------------------------------------------------------------- 启用禁用删除 end
	
	//----------------------------------------------------------------修改和保存 start
		var selectTpl =  $("#selectTpl").html();
		$("#htmlTpl #leaderZB,#htmlTpl #teamZB1,#htmlTpl #teamZB2,#htmlTpl #totalZB1,#htmlTpl #totalZB2").html(selectTpl);
		var htmlTpl = $("#htmlTpl").html();
		
		window.addNewAndEditShow = function(id){
			var data;
			if(id)data = dataObjs[id];
			var mydialog = art.dialog({
					id : "dialog"+id,
					content : "<div id='dialog_content_html'>"+htmlTpl+"<div>",
					title:'排班设置',
					padding : "0px",
					width : 430,
					lock : true,
					init:function(){
						$("#dialog_content_html #rule_type_").val("${dutyType?if_exists}");
					},
					ok : function(){
						//验证表单
						var start_time = $("#dialog_content_html #start_time").val();
						var end_time = $("#dialog_content_html #end_time").val();
						var is_Enable = $("#dialog_content_html #is_Enable")[0].checked==true?"1":"0";
						var rule_type  = $("#dialog_content_html #rule_type_").val();
						if($.trim(start_time)==''||$.trim(end_time)==''){
							alert("开始时间或结束时间不能为空！");
							return false;
						}
						if(rule_type=='-1'){
							alert("类型不能为空!");
							return false;
						}
						if(is_Enable=="1"&&!confirm("保存后将会覆盖原有的排班人员，确定执行排班吗？")){
							return false;
						}
						if(valDatas_isEmpty(start_time,"开始时间")){
							$("#pageloading").show();
							$.post("${gzUrl('oagl/glgn/zbTeamBizRuleSave.do')}",{
								start_time:start_time,
								end_time:end_time,
								is_Enable:is_Enable,
								rule_type:rule_type,
								orderno_teamid:$("#dialog_content_html #start_teamorder_no_id").val()
							},function(resp){
								if(resp&&resp=="true"){
									jQuery("#dataGrid").jqGrid('setGridParam', {
										postData : {}
									}).trigger('reloadGrid');
									mydialog.close();
								}else{
									alert("保存失败，请联系管理员处理。");
								}
								$("#pageloading").hide();
							});
						}
						return false;
					},
					okVal:'执行排班',
					cancel : true
				});
		}
		
	 var valDatas_isEmpty = function(value,title){
	 	if($.trim(value)==""){
	 		alert(title+"不能为空！");
	 		return false;
	 	}
	 	return true;
	 }
	 
	//----------------------------------------------------------------修改和保存 end
	
	$("#searchBtn").button().click(function(){
		jQuery("#dataGrid").jqGrid('setGridParam', {
				postData : {
					'duty_name' : $("#duty_name").val(),
					'is_Enable': $("#is_Enable").val(),
					'rule_type': "${dutyType?if_exists}"
				}
		 }).trigger('reloadGrid');
	});
	$("#addNewBtn,#previewBtn").button();
	$("#is_Enable,#rule_type").combobox();
	$("#pageloading").hide();
});
</script>
<#include "../../foot.ftl" />