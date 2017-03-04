<#include "../../../head.ftl" />
<script type="text/javascript">
	$(function(){
		$("#tabs" ).tabs();
		$("#tabs").height($(window).height()-35);
		$("#tabs > div").height($(window).height()-102);
		$(window).resize(function(){
			var height=$(window).height();
			$("#tabs").height(height-35);
			$("#tabs > div").height(height-102);
		});
		$("#saveBtn").button().click(function( event ) {
	    	event.preventDefault();
	    	 if($("#name").val()==""){
			     alert("请填写工资单批次名称");
			     return false;
			 }
			  if($("#tableId").val()==0){
			     alert("请填选择工资单模板");
			     return false;
			 }
	    	$("#form1").submit();
	    });
	    $("#tableId").combobox({
		});
	    $("#pageloading").hide();
	});
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：电子工资单->工资单管理->工资单批次</div>
		</div>
		<div class="osx-modal-close" style="display: block;cursor: pointer;">
			<div class="osx-modal-icon-back">
				<div class="osx-modal-title" style="text-align: right;line-height: 13px;">
				  <a href="javascript:history.go(-1);"><img src="${gzUrl('images/a_back.png')}" width="14" height="14" />返回</a>
				</div>  
			</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form_content">
				<div id="tabs">
					<ul>
						<li><a href="#main_content" style="font-size: ;font-family: 'yakov_wryh';">增加</a></li>
					</ul>
					<div id="main_content" style="overflow:auto;">
						<form id="form1" name="form1" action="${gzUrl('dzgzd/gzdgl/gzdpc/add.do')}" method="post">
							<table border="0" width="800" style="overflow: hidden;">
								<tr>
									<td width="120px">
										<label for="name" class="edit_lbl">工资单批次名称:</label>
									</td>
									<td colspan="3">
										<input type="text" id="name" name="name" class="text ui-widget-content ui-corner-all"/>
									</td>
								</tr>
								<tr>
									<td>
										<label for="tableId" class="edit_lbl">工资单模板:</label>
									</td>
									<td colspan="3">
						                <select id="tableId" name="tableId" class="select01">
						                        <option value="0"></option>
				                    		<#list payrollTableInfoList as payrollTableInfo>
				                    			<option value="${payrollTableInfo.id}">${payrollTableInfo.name}</option>
				                    		</#list>
				                       	</select> 
									</td>
								</tr>
								<tr>
									<td colspan="4">
										<input type="button" id="saveBtn" value="保存" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<#include "../../../foot.ftl" />
