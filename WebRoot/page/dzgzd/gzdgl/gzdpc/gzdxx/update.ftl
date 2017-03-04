<#include "../../../../head.ftl" />
<script type="text/javascript">
	$(function(){
		$("#tabs" ).tabs();
		$("#tabs").height($(window).height());
		$("#tabs > div").height($(window).height());
		$(window).resize(function(){
			var height=$(window).height();
			$("#tabs").height(height);
			$("#tabs > div").height(height);
		});
	    $("#tableId").combobox({
		});
		$("#csv").customFileInput();
	    $("#pageloading").hide();
	});
	
	  function checkSubmit(){
		 $("#form1").submit();
	  }
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form_content">
				<div id="tabs">
					<div id="main_content" style="overflow:auto;">
					<form id="form1" name="form1" action="${gzUrl('dzgzd/gzdgl/gzdpc/gzdxx/update.do')}"  method="post" enctype="multipart/form-data">
						<table border="0" width="650" style="overflow: hidden;">
							<#list payrollColumnInfoList as payrollColumnInfo>
							<#if payrollColumnInfo_index%2==0>
							<tr>
							</#if>
							<#if payrollColumnInfo.column_name=="batch_id">
								<td width="100px">
									<label for="batchName" class="edit_lbl">工资单批次:</label>
								</td>
								<td>
									<input type="text" id="batchName" name="batchName" class="text ui-widget-content ui-corner-all" value="${payrollBatch.name}" readonly/>
									<input type="hidden" id="batch_id" name="batch_id" class="text ui-widget-content ui-corner-all" value="${payrollBatch.id}" readonly/>
									<input type="hidden" id="batchId" name="batchId" class="text ui-widget-content ui-corner-all" value="${payrollBatch.id}" readonly/>
								</td>
							<#elseif payrollColumnInfo.column_name=="read_status">
								<td width="100px">
									<label for="read_status" class="edit_lbl">阅读状态:</label>
								</td>
								<td>
									<input type="text" class="text ui-widget-content ui-corner-all" value="<#if payrollEntry.get(payrollColumnInfo.column_name)==0>未阅读<#else>已阅读</#if>" readonly/>
									<input type="hidden" id="read_status" name="read_status" class="text ui-widget-content ui-corner-all" value="${payrollEntry.get(payrollColumnInfo.column_name)}" readonly/>
								</td>
							<#elseif payrollColumnInfo.column_name=="release_status">
								<td width="100px">
									<label for="read_status" class="edit_lbl">发布状态:</label>
								</td>
								<td>
									<input type="text" class="text ui-widget-content ui-corner-all" value="<#if payrollEntry.get(payrollColumnInfo.column_name)==0>未发布<#else>已发布</#if>" readonly/>
									<input type="hidden" id="read_status" name="read_status" class="text ui-widget-content ui-corner-all" value="${payrollEntry.get(payrollColumnInfo.column_name)}" readonly/>
								</td>
							<#elseif payrollColumnInfo.column_name=="staff_id">
								<td width="100px">
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
							<#elseif payrollColumnInfo.column_name=="id">
							   <input type="hidden" id="id" name="id" class="text ui-widget-content ui-corner-all" value="${payrollEntry.get(payrollColumnInfo.column_name)}" readonly/>	
							<#else>
								<td width="100px">
									<label for="${payrollColumnInfo.column_name}" class="edit_lbl">${payrollColumnInfo.name}:</label>
								</td>
								<td>
									<input type="text" id="${payrollColumnInfo.column_name}" name="${payrollColumnInfo.column_name}" class="text ui-widget-content ui-corner-all" value="${payrollEntry.get(payrollColumnInfo.column_name)}"/>
								</td>
							</#if>
							<#if payrollColumnInfo_index%2==1>
							</tr>
							</#if>
							</#list>
						</table>
					</form>	
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<#include "../../../../foot.ftl" />
