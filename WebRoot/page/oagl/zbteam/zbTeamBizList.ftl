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
.td {
	height:25px;
	text-align: center;
	border-right: 1px solid #5C9CCC;
	border-bottom: 1px solid #5C9CCC;
}
.teamTable tr:FIRST-CHILD td{
	border-top: 1px solid #5C9CCC;
}
.teamTable{
	margin-right: 10px;
}
.teamTable tr td:FIRST-CHILD{
	border-left: 1px solid #5C9CCC;
}
.teamTable tr:HOVER{
	background-color: #FFF4C1
}
</style>
</head>
<body>
	<div id="pageloading"></div>
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：OA系统->值班管理-->
				<#if dutyType?if_exists== "1" >领导</#if>
				<#if dutyType?if_exists== "2" >小分队</#if>
				<#if dutyType?if_exists== "3" >总</#if>
				值班小组维护</div>
		</div>
		<div class='title' style="font-size:20px;width:100%;text-align:center;color:#3399FF;font-family: '微软雅黑 Bold', '微软雅黑';">
		<#if dutyType?if_exists== "1" >领导</#if>
		<#if dutyType?if_exists== "2" >小分队</#if>
		<#if dutyType?if_exists== "3" >总</#if>
		值班小组维护</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<table id="searchTable" cellpadding="0" cellspacing="0">
				<tr>
					<#if dutyType?if_exists== "1" >
						<td style="text-align:left;width:130px"><button id="addNewBtn1" style="wdith:130px;" onclick="zbTeamAddNewAndUpd(undefined,undefined,undefined,undefined,'1')">新增领导值班</button></td>
					</#if>
					<#if dutyType?if_exists== "2" >
						<td style="text-align:left;width:130px"><button id="addNewBtn2" style="wdith:130px;" onclick="zbTeamAddNewAndUpd(undefined,undefined,undefined,undefined,'2')">新增分队值班</button></td>
					</#if>
					<#if dutyType?if_exists== "3" >
						<td style="text-align:left;width:130px"><button id="addNewBtn3" style="wdith:130px;" onclick="zbTeamAddNewAndUpd(undefined,undefined,undefined,undefined,'3')">新增总值班</button></td>
					</#if>
					<td style="text-align:left;width:120px">&nbsp;</td>
				</tr>
			</table>
		</div>
	</div>
	<div style="height:1px;border-bottom:1px solid silver;margin-left: 10px;"></div>
	<table style="margin-left: 15px;margin-top: 5px;" cellpadding="0" cellspacing="0">
		<tr>
			<#if dutyType?if_exists== "1" >
				<td style="vertical-align: top;">
					<button class="btnx updOrder">调整序号</button><button class="btnx" onclick="{location.reload();}" style='display:none'>取消</button>
					<table cellpadding="0" cellspacing="0" class="teamTable leadTeam">
						<tr class="ui-widget-header">
							<td class="td" style="width:35px">序号</td>
							<td class="td" style="width:90px">领导值班</td>
							<td class="td" style="width:90px">操作</td>
						</tr>
						<#if ondutyLeaderList?exists>
							<#list ondutyLeaderList as onduty>
								<tr>
										<td class="td" ondutyId="${onduty.id}">${onduty.onduty_order}</td>
										<td class="td">${onduty.staff_name1}</td>
										<td class="td">
											<a href="###" onclick="zbTeamAddNewAndUpd('${onduty.id}','${onduty.onduty_staff1?if_exists}','${onduty.onduty_staff2?if_exists}','${onduty.onduty_order?if_exists}','${onduty.onduty_staff_type?if_exists}')">修改</a>
											<a href="###" onclick="zbTeamDelete('${onduty.id}',1)">删除</a>
										</td>
								</tr>
							</#list>
						</#if>
					</table>
				</td>
			</#if>
			<#if dutyType?if_exists== "2" >
				<td style="vertical-align: top;">
					<button class="btnx updOrder">调整序号</button><button class="btnx" onclick="{location.reload();}" style='display:none'>取消</button>
					<table cellpadding="0" cellspacing="0" class="teamTable teamTeam">
						<tr  class="ui-widget-header">
							<td class="td" style="width:35px">序号</td>
							<td class="td" style="width:90px">分队值班1</td>
							<td class="td" style="width:90px">分队值班2</td>
							<td class="td" style="width:90px">操作</td>
						</tr>
						<#if ondutyTeamList?exists>
							<#list ondutyTeamList as onduty>
								<tr>
										<td class="td" ondutyId="${onduty.id}">${onduty.onduty_order}</td>
										<td class="td">${onduty.staff_name1}</td>
										<td class="td">${onduty.staff_name2}</td>
										<td class="td">
											<a href="###" onclick="zbTeamAddNewAndUpd('${onduty.id}','${onduty.onduty_staff1?if_exists}','${onduty.onduty_staff2?if_exists}','${onduty.onduty_order?if_exists}','${onduty.onduty_staff_type?if_exists}')">修改</a>
											<a href="###" onclick="zbTeamDelete('${onduty.id}',1)">删除</a>
										</td>
								</tr>
							</#list>
						</#if>
					</table>
				</td>
			</#if>
			<#if dutyType?if_exists== "3" >
			<td style="vertical-align: top;">
				<button class="btnx updOrder">调整序号</button><button class="btnx" onclick="{location.reload();}" style='display:none'>取消</button>
				<table cellpadding="0" cellspacing="0" class="teamTable totalTeam">
					<tr  class="ui-widget-header">
						<td class="td" style="width:35px">序号</td>
						<td class="td" style="width:90px">总值班1</td>
						<td class="td" style="width:90px">总值班2</td>
						<td class="td" style="width:90px">操作</td>
					</tr>
					<#if ondutyTotalList?exists>
						<#list ondutyTotalList as onduty>
							<tr>
									<td class="td" ondutyId="${onduty.id}">${onduty.onduty_order}</td>
									<td class="td">${onduty.staff_name1}</td>
									<td class="td">${onduty.staff_name2}</td>
									<td class="td">
										<a href="###" onclick="zbTeamAddNewAndUpd('${onduty.id}','${onduty.onduty_staff1?if_exists}','${onduty.onduty_staff2?if_exists}','${onduty.onduty_order?if_exists}','${onduty.onduty_staff_type?if_exists}')">修改</a>
										<a href="###" onclick="zbTeamDelete('${onduty.id}',1)">删除</a>
									</td>
							</tr>
						</#list>
					</#if>
				</table>
			</td>
			</#if>
		</tr>
	</table>
	<div id="formTpl" style="display:none">
		<table>
			<tr>
				<td style="width:25px;text-align: right;">一、</td>
				<td style="width:35px;text-align: right;">部门</td>
				<td style="width:90px;text-align: left;">
					<select style="width:120px" id="deptSelect1">
						<option value="-1">--请选择--</option>
						<#if departmentList?exists>
							<#list departmentList as dept>
								<option value="${dept.id}">${dept.name}</option>
							</#list>
						</#if>
					</select>
				</td>
				<td style="width:100px;text-align: right;">值班人员</td>
				<td style="width:90px;text-align: left;">
					<select style="width:90px" id="userSelect1">
						<option value="-1">--请选择--</option>
					</select>
				</td>
			</tr>
			<tr id="trD1">
				<td style="text-align: right;">二、</td>
				<td style="text-align: right;">部门</td>
				<td style="text-align: left;">
				<select style="width:120px"  id="deptSelect2">
					<option value="-1">--请选择--</option>
					<#if departmentList?exists>
						<#list departmentList as dept>
							<option value="${dept.id}">${dept.name}</option>
						</#list>
					</#if>
				</select>
				</td>
				<td style="text-align: right;">值班人员</td>
				<td style="text-align: left;">
					<select style="width:90px" id="userSelect2">
						<option value="-1">--请选择--</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan='2' style="text-align: right;">顺序号</td>
				<td colspan='3' style="text-align: left;"><input  style="width:25px" id="order" value="0"/>作为轮巡值班的顺序依据</td>
			</tr>
		</table>
	</div>
	<div style="display:none" id="optionUsersTpl">
		<select style="width:90px">
			<#if departmentList?exists>
				<#list departmentList as dept>
					<#if dept.userList?exists>
						<#list dept.userList as user>
							<option dept="${dept.id}" value="${user.staff_id}">${user.username}</option>
						</#list>
					</#if>
				</#list>
			</#if>
		</select>
	</div>
</body>
<script type="text/javascript">
$(function(){
	window.zbTeamDelete = function(id,isDelete){
		if(confirm("确定要删除该数据吗？")){
			$.post("${gzUrl('oagl/glgn/zbTeamDelete.do')}",{is_Delete:isDelete,id:id},function(resp){
				if(resp&&resp=="true"){
					location.reload();
				}else{
					alert("删除失败，请联系管理员处理。");
				}
			});
		}
	}
	
	window.zbTeamAddNewAndUpd = function(id,staffid1,staffid2,order,ondutyType){
		var htmlTpl = $("#formTpl").html();
		var title="值班小组名单维护";
		var orderNo=0;
		if(ondutyType=='1'){
			title="领导值班小组名单维护";
			orderNo = $(".leadTeam tr").length;
		}else if(ondutyType=='2'){
			title="小分队听班小组名单维护";
			orderNo = $(".teamTeam tr").length;
		}else if(ondutyType=='3'){
			title="总值班小组名单维护";
			orderNo = $(".totalTeam tr").length;
		}
		var mydialog = art.dialog({
				id : "dialog"+id,
				content : "<div id='dialog_content_html'>"+htmlTpl+"<div>",
				title:title,
				padding : "0px",
				width : 400,
				lock : true,
				init:function(){
					$("#dialog_content_html #deptSelect1,#dialog_content_html #deptSelect2").change(function(){
						var deptId = this.value;
						var eleId = this.id;
						var optionUsers = $("#optionUsersTpl option[dept="+deptId+"]").clone();
						if(eleId=="deptSelect1"){
							$("#dialog_content_html #userSelect1").html("<option value='-1'>--请选择--</option>").append(optionUsers);
						}else{
							$("#dialog_content_html #userSelect2").html("<option value='-1'>--请选择--</option>").append(optionUsers);
						}
					});
					if(id&&staffid1){
						var dept1 = $("#optionUsersTpl option[value="+staffid1+"]").attr("dept");
						$("#dialog_content_html #deptSelect1").val(dept1).change();
						$("#dialog_content_html #userSelect1").val(staffid1);
					}
					if(id&&staffid2&&ondutyType!='1'){//领导值班不显示
						var dept2= $("#optionUsersTpl option[value="+staffid2+"]").attr("dept");
						$("#dialog_content_html #deptSelect2").val(dept2).change();
						$("#dialog_content_html #userSelect2").val(staffid2);
					}
					if(ondutyType=='1'){
						$("#dialog_content_html #trD1").hide();
					}
					if(order){
						$("#dialog_content_html #order").val(order);
					}
					if(id){//新增校验功能
						$("#dialog_content_html").append("<input id='id' value='"+id+"' type='hidden' />");
					}
					
					if(!id){
						$("#dialog_content_html #order").val(orderNo);
					}
					$("#dialog_content_html").append("<input id='ondutyType' value='"+ondutyType+"' type='hidden' />");
				},
				ok : function(){
					var id_ = $("#dialog_content_html #id").val();
					var staffid1_ = $("#dialog_content_html #userSelect1").val();
					var staffid2_ = $("#dialog_content_html #userSelect2").val();
					var order_ = $("#dialog_content_html #order").val();
					var ondutyType_= $("#dialog_content_html #ondutyType").val();
					if(staffid1_=='-1'||(ondutyType_!='1'&&staffid2_=='-1')){
						alert("请选择值班人员。");
						return false;
					}else if(staffid1_==staffid2_){
						alert("值班人员不能选择同一个人。");
						return false;
					}
					var reg = new RegExp("^[0-9]*$");
				    if(order_==""||!reg.test(order_)||!/^[0-9]*$/.test(order_)){
				        alert("顺序号请输入数字!");
				    	return false;
				    }

				    $.post("${gzUrl('oagl/glgn/zbTeamSave.do')}",{
				    	id:id_,
				    	staffid1:staffid1_,
				    	staffid2:staffid2_,
				    	order:order_,
				    	ondutyType:ondutyType_
				    },function(resp){
				    	if(resp=='true'){
				    		alert("操作成功。");
				    		location.reload();
				    	}else{
				    		alert("操作失败，请联系管理员。");
				    	}
				    });
					return false;
				},
				okVal:'保存',
				cancel : true
			});
	}
	$("#addNewBtn1,#addNewBtn2,#addNewBtn3,.btnx").button();
	
	//批量调整顺序号
	$(".updOrder").click(function(){
		var toggle = $(this).attr("toggle");
		if(!toggle){
			$(".ui-button-text",this).text("保存序号");
			$(this).next("button").show();
			$(this).parent("td").find("table tr").each(function(i){
				if(i>0){
					var td0 = $("td:eq(0)",this);
					var order = td0.text();
					td0.html("<input style='width:20px;' name='ondutyOrder_' value='"+order+"'/>");
				}
			});
			$(this).attr("toggle","1");
		}else if(toggle=="1"){
				var dataArray = new Array();
				var isVal = true;
				$(this).parent("td").find("table tr").each(function(i){
					if(i>0){
						var td0 = $("td:eq(0)",this);
						var order = $("input",td0).val();
						var ondutyId = td0.attr("ondutyId");
						dataArray.push(ondutyId+"-"+order);
						var reg = new RegExp("^[0-9]*$");
					    if(order==""||!reg.test(order)||!/^[0-9]*$/.test(order)){
					        alert("请输入数字!");
					     	isVal = false;
					     	return isVal;
					    }
					}
				});
				if(isVal){
					$(".ui-button-text",this).text("保存中...");
					$(this).attr("disabled","disabled");
					$.post("${gzUrl('oagl/glgn/batchUpdZbonDutyOrder.do')}",{data:dataArray.join(";")	},
					function(resq){
						if(resq=="true"){
							location.reload();
						}else{
							alert("保存数据失败，请联系管理员。");
						}
					});
				}
		}
	});
	
	$("#pageloading").hide();
});
</script>
<#include "../../foot.ftl" />