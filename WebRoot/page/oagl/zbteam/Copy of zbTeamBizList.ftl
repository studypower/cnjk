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
			<div class="osx-modal-title">您现在所在的位置：OA系统->值班管理-->值班小组维护</div>
		</div>
		<div class='title' style="font-size:20px;width:100%;text-align:center;color:#3399FF;font-family: '微软雅黑 Bold', '微软雅黑';">值班小组维护</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<table id="searchTable" cellpadding="0" cellspacing="0">
				<tr>
					<td style="text-align:right;width:80px">小组名称：</td>
					<td style="text-align:left;width:80px">
						<input name="duty_name" id="duty_name" type="text" class="text ui-widget-content ui-corner-all" maxlength="25"/>
					</td>
					<td style="text-align:right;width:80px">状态：</td>
					<td style="text-align:left;width:150px">
						<select name="is_Enable" id="is_Enable" >
							<option value="-1">----全部----</option>
							<option value="1">启用</option>
							<option value="0">禁用</option>
						<select>
					</td>
					<td style="text-align:left;width:70px"><button id="searchBtn" style="wdith:100px;">搜索</button></td>
					<td style="text-align:left;width:70px"><button id="addNewBtn" style="wdith:100px;" onclick="addNewAndEditShow()">新增</button></td>
					<td style="text-align:left;width:100px">&nbsp;</td>
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
				<td style="text-align:right;">小组名称：</td>
				<td colspan="3"><input name="onDuty_Name" id="onDuty_Name" type="text" class="text ui-widget-content ui-corner-all" maxlength="25" style="width:220px"/></td>
			</tr>
			<tr>
				<td style="text-align:right;">领导值班：</td>
				<td colspan="3" id="leaderZB"></td>
			</tr>
			<tr>
				<td style="text-align:right;">小分队听班一:</td>
				<td id="teamZB1"></td>
				<td style="text-align:right;">小分队听班二:</td>
				<td id="teamZB2"></td>
			</tr>
			<tr>
				<td style="text-align:right;">总值班一:</td>
				<td id="totalZB1"></td>
				<td style="text-align:right;">总值班二:</td>
				<td id="totalZB2"></td>
			</tr>
			<tr>
				<td style="text-align:right;">是否启用:</td>
				<td ><input name="is_Enable_" id="is_Enable_"  value="1" type="checkbox" checked /></td>
				<td style="text-align:right;">排序号:</td>
				<td ><input name="onDuty_Order" id="onDuty_Order" type="text" class="text ui-widget-content ui-corner-all" maxlength="4" value="0" style="width:28px"/></td>
			</tr>
		</table>
	</div>
</body>
<script type="text/javascript">
$(function(){
	//----------------------------------------------------------------grid start
	var dataObjs={};
	$("#dataGrid").jqGrid({
			colNames : [ "编号","小组名称","领导值班","分队值班一","分队值班二","总值班一","总值班二","排序号","状态","操作"],
			colModel : [ 
						{index:"id",name : "id",width : 45,sortable : false,align : "center"},
						{index:"onDuty_Name",name : "onDuty_Name",width : 100,sortable : false,align : "center"},
						{index:"leaderName",name : "leaderName",width : 100,sortable : false,align : "center"},
						{index:"team1Name",name : "team1Name",width : 100,sortable : false,align : "center"},
						{index:"team2Name",name : "team2Name",width : 100,sortable : false,align : "center"},
						{index:"total1Name",name : "total1Name",width : 100,sortable : false,align : "center"},
						{index:"total2Name",name : "total2Name",width : 100,sortable : false,align : "center"},
						{index:"onDuty_Order",name : "onDuty_Order",width : 50,sortable : false,align : "center"},
						{index:"is_Enable",name : "is_Enable",width : 80,sortable : false,align : "center",
							formatter:function(key, options, rowObject){return rowObject["is_Enable"]=="1"?"启用":"禁用";}
						},
						{name : "",   width : 120,sortable : false,align : "center",formatter:function(key, options, rowObject){
							dataObjs[rowObject["id"]]=rowObject;
							var html   = "";
								  if(rowObject["is_Enable"]=="1"){
								  	html += "&nbsp;<a href='###' onclick='zbteamEnable("+rowObject["id"]+",\"0\")' >禁用</a>";
								  }else{
								  	html += "&nbsp;<a href='###' onclick='zbteamEnable("+rowObject["id"]+",\"1\")' >启用</a>";
								  }
								  html += "&nbsp;<a href='###' onclick='addNewAndEditShow("+rowObject["id"]+")' >修改</a>";
								  if(rowObject["is_Enable"]=="0"){
								  	 html += "&nbsp;<a href='###' onclick='zbteamDelete("+rowObject["id"]+")'>删除</a>";
								  }
							return html;
						}}
				 ],
			datatype : "json", //将这里改为使用JSON数据
			url : "${gzUrl('oagl/glgn/zbTeamBizList.do')}", //这是Action的请求地址
			mtype : 'POST',
			postData : {
				'duty_name' : $("#duty_name").val(),
				'is_Enable': $("#is_Enable").val()
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
			caption : "值班小组名单"
		});
	//----------------------------------------------------------------grid end
	//---------------------------------------------------------------- 启用禁用删除 start
	window.zbteamDelete = function(id){
		if(confirm("确定要删除该数据吗？")){
			$.post("${gzUrl('oagl/glgn/zbTeamEnableAndDelete.do')}",{is_Delete:1,id:id},function(resp){
				if(resp&&resp=="true"){
					$("#searchBtn").click();
				}else{
					alert("删除失败，请联系管理员处理。");
				}
			});
		}
	}
	window.zbteamEnable = function(id,isEnable){
		if(confirm("确定"+(isEnable==1?"启用":"禁用")+"要该数据吗？")){
			$.post("${gzUrl('oagl/glgn/zbTeamEnableAndDelete.do')}",{is_Enable:isEnable,id:id},function(resp){
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
					title:'值班小组名单维护',
					padding : "0px",
					width : 400,
					lock : true,
					init:function(){
						if(data){
							$("#dialog_content_html #onDuty_Name").val(data.onDuty_Name);
							$("#dialog_content_html #leaderZB select").val(data.onDuty_Leader);
							$("#dialog_content_html #teamZB1 select").val(data.onDuty_Team1);
							$("#dialog_content_html #teamZB2 select").val(data.onDuty_Team2);
							$("#dialog_content_html #totalZB1 select").val(data.onDuty_Total1);
							$("#dialog_content_html #totalZB2 select").val(data.onDuty_Total2);
							$("#dialog_content_html #onDuty_Order").val(data.onDuty_Order);
							$("#dialog_content_html #is_Enable_")[0].checked=(data.is_Enable=="1");
							$("#dialog_content_html").append("<input type='hidden' value='"+data.id+"' name='id'/>");
						}
					},
					ok : function(){
						//验证表单
						var onDuty_Name = $("#dialog_content_html #onDuty_Name").val();
						var leaderZB = $("#dialog_content_html #leaderZB select").val();
						var teamZB1 = $("#dialog_content_html #teamZB1 select").val();
						var teamZB2 = $("#dialog_content_html #teamZB2 select").val();
						var totalZB1 = $("#dialog_content_html #totalZB1 select").val();
						var totalZB2 = $("#dialog_content_html #totalZB2 select").val();
						var onDuty_Order = $("#dialog_content_html #onDuty_Order").val();
						var id = $("#dialog_content_html input[name=id]").val();
						var keys={	};
						keys[leaderZB]=1;
						keys[teamZB1]=1;
						keys[teamZB2]=1;
						keys[totalZB1]=1;
						keys[totalZB2]=1;
						if(valDatas_isEmpty(onDuty_Name,"小组名称")&&
							valDatas_isEmpty(leaderZB,"领导值班")&&
							valDatas_isEmpty(teamZB1,"小分队听班一")&&
							valDatas_isEmpty(teamZB2,"小分队听班二")&&
							valDatas_isEmpty(totalZB1,"总值班一")&&
							valDatas_isEmpty(totalZB2,"总值班二")&&
							valDatas_isEmpty(onDuty_Order,"排序号")&&
							valDatas_isNumber(onDuty_Order,"排序号")&&valDatas_isRepeat_ZbName(keys,5)){
							var is_Enable = $("#dialog_content_html #is_Enable_")[0].checked==true?"1":"0";
							$.post("${gzUrl('oagl/glgn/zbTeamSave.do')}",{
								 id:id, 
								 onDuty_Name:onDuty_Name,  
								 onduty_Leader:leaderZB,  
								 onDuty_Team1:teamZB1,  
								 onDuty_Team2:teamZB2,  
								 onDuty_Total1:totalZB1,  
								 onDuty_Total2:totalZB2,  
								 onDuty_Order:onDuty_Order,
			 					 is_Enable:is_Enable
							},function(reps){
								if(reps&&reps=='true'){
									jQuery("#dataGrid").jqGrid('setGridParam', {
										postData : {}
									}).trigger('reloadGrid');
									mydialog.close();
								}else{
									alert("保存失败，请联系管理员处理。");
								}
							});
						}
						return false;
					},
					okVal:'保存',
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
	 var valDatas_isNumber = function(value,title){
	 	var reg = new RegExp("^[0-9]*$");  
	    if(value==""){
	        alert(title+",请输入数字!");
	    	return false;
	    }
	    if(!reg.test(value)){  
	        alert(title+",请输入数字!");
	     	return false;
	    }  
	    if(!/^[0-9]*$/.test(value)){  
	        alert(title+",请输入数字!");
	        return false;
	    }
	    return true;
	 }
	 
	 var valDatas_isRepeat_ZbName = function(keys,length){
	 		var i=0;
	 		for(var j in keys){
	 			i++;
	 		}
	 		if(i!=length){
	 			alert("同一组值班人员不能重复！");
	 			return false;
	 		}
	 		return true;
	 }
	//----------------------------------------------------------------修改和保存 end
	$("#searchBtn").button().click(function(){
		jQuery("#dataGrid").jqGrid('setGridParam', {
				postData : {
					'duty_name' : $("#duty_name").val(),
					'is_Enable': $("#is_Enable").val()
				}
		 }).trigger('reloadGrid');
	});
	$("#addNewBtn").button();
	$("#is_Enable").combobox();
	$("#pageloading").hide();
});
</script>
<#include "../../foot.ftl" />