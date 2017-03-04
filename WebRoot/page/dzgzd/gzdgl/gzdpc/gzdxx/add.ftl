<#include "../../../../head.ftl" />
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
	    	if($("#file").val()==""){
			     alert("请上传工资单文件");
			     return false;
			}
			$("#saveBtn").val("处理中，稍后");
			$('#saveBtn').attr('disabled',"true");
	    	$("#form1").submit();
	    });
	    $("#tableId").combobox({
		});
		$("#file").customFileInput();
	    $("#pageloading").hide();
	});
	
	<#if result?exists>
	   <#if result==0>
	     alert("添加失败");
	   <#elseif result==-1>
	     alert("版本不正确,添加失败");
	   <#elseif result==-2>
	     alert("读取文件错误，添加失败");
	   </#if>    
	</#if>
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：电子工资单->工资单管理->工资单明细</div>
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
						<li><a href="#main_content" style="font-size: ;font-family: 'yakov_wryh';">批量上传工资单</a></li>
					</ul>
					<div id="main_content" style="overflow:auto;">
						<form id="form1" name="form1" action="${gzUrl('dzgzd/gzdgl/gzdpc/gzdxx/add.do')}"  method="post" enctype="multipart/form-data">
							<table border="0" width="800" style="overflow: hidden;">
								<tr>
									<td width="120px">
										<label for="name" class="edit_lbl">工资单批次名称:</label>
									</td>
									<td colspan="3">
										<input type="text" id="name" name="name" class="text ui-widget-content ui-corner-all" value="${payrollBatch.name}" readonly/>
									</td>
								</tr>
								<tr>
									<td>
										<label for="tableName" class="edit_lbl">工资单模板:</label>
									</td>
									<td colspan="3">
						                <input type="text" id="tableName" name="tableName" class="text ui-widget-content ui-corner-all" value="${payrollBatch.table_name}" readonly/>
									</td>
								</tr>
								<tr>
									<td>
										<label for="file" class="edit_lbl">工资单文件:</label>
									</td>
									<td colspan="3">
						                <input type="file" name="file" id="file"/>
									</td>
								</tr>
								<tr>
									<td colspan="4">
										<input type="hidden" id="batchId" name="batchId" class="text ui-widget-content ui-corner-all" value="${payrollBatch.id}"/>
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
<#include "../../../../foot.ftl" />
