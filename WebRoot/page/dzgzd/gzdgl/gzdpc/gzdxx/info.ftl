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
		$("#saveBtn").button().click(function( event ) {
	    	event.preventDefault();
	    	$("#form1").submit();
	    });
	    $("#tableId").combobox({
		});
		$("#csv").customFileInput();
	    $("#pageloading").hide();
	});
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form_content">
				<div id="tabs">
					<div id="main_content" style="overflow:auto;">
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
								</td>
							<#elseif payrollColumnInfo.column_name=="read_status">
								<td width="100px">
									<label for="read_status" class="edit_lbl">阅读状态:</label>
								</td>
								<td>
									<input type="text" id="read_status" name="read_status" class="text ui-widget-content ui-corner-all" value="<#if payrollEntry.get(payrollColumnInfo.column_name)==0>未阅读<#else>已阅读</#if>" readonly/>
								</td>
							<#elseif payrollColumnInfo.column_name=="release_status">
								<td width="100px">
									<label for="read_status" class="edit_lbl">发布状态:</label>
								</td>
								<td>
									<input type="text" id="read_status" name="read_status" class="text ui-widget-content ui-corner-all" value="<#if payrollEntry.get(payrollColumnInfo.column_name)==0>未发布<#else>已发布</#if>" readonly/>
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
									<label for="${payrollEntry.get(payrollColumnInfo.column_name)}" class="edit_lbl">${payrollColumnInfo.name}:</label>
								</td>
								<td>
									<input type="text" id="${payrollEntry.get(payrollColumnInfo.column_name)}" name="${payrollEntry.get(payrollColumnInfo.column_name)}" class="text ui-widget-content ui-corner-all" value="${payrollEntry.get(payrollColumnInfo.column_name)}" readonly/>
								</td>
							</#if>
							<#if payrollColumnInfo_index%2==1>
							</tr>
							</#if>
							</#list>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<#include "../../../../foot.ftl" />
