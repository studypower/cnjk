<#include "../head.ftl" />
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
	    $("#file").customFileInput();
		$("#pageloading").hide();
	});

</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form_content">
				<div id="tabs">
					<div id="project" style="overflow:auto;">
							<table border="0" width="800" style="overflow: hidden;">
							   <tr>
									<td>
										<label for="departmentName" class="edit_lbl">申请科室:</label>
									</td>
									<td>
										<input type="text"  class="text ui-widget-content ui-corner-all"  value="${fundsApplyInfoLog.applyDepartmentName?if_exists}" readOnly/>
									</td>
									<td>
										<label for="staffName" class="edit_lbl">经办人（申请人）:</label>
									</td>
									<td>
										<input type="text" class="text ui-widget-content ui-corner-all"  value="${fundsApplyInfoLog.applyStaffName?if_exists}" readOnly/>
									</td>
								</tr>
								<tr>
			                        <td>
										<label for="applyTime" class="edit_lbl">申请时间:</label>
									</td>
									<td colspan="3">
						                <input type="text" id="applyTime" name="applyTime" class="text ui-widget-content ui-corner-all"  value="${fundsApplyInfoLog.apply_time?if_exists}" readOnly/>
									</td>
								</tr>
								<tr>
								   	<td>
										<label for="name" class="edit_lbl">经费名称:</label>
									</td>
									<td>
										<input type="text" id="name" name="name" class="text ui-widget-content ui-corner-all" value="${fundsApplyInfoLog.name?if_exists}"/>
									</td>
									<td>
										<label for="num" class="edit_lbl">编号:</label>
									</td>
									<td>
										<input type="text" id="num" name="num" class="text ui-widget-content ui-corner-all" value="${fundsApplyInfoLog.num?if_exists}" readOnly/>
									</td>
								</tr>
								<tr>
			                        <td>
										<label for="typeId" class="edit_lbl">经费类别:</label>
									</td>
									<td>
										<input type="text" id="typeName" name="typeName" class="text ui-widget-content ui-corner-all" value="${fundsApplyInfoLog.type_name?if_exists}" readOnly/>
									</td>
									<td>
										<label for="money" class="edit_lbl">申请金额:</label>
									</td>
									<td>
										<input type="text" id="money" name="money" class="text ui-widget-content ui-corner-all" value="${fundsApplyInfoLog.money?if_exists?c}"/>元
									</td>
								</tr>
							    <tr>
                                     <td><label class="edit_lbl" for="workContent">工作内容:</label></td>
                                        <td colspan="3">
                                              <textarea id="workContent" class="text ui-widget-content ui-corner-all" style="width: 494px;" name="workContent">${fundsApplyInfoLog.work_content?if_exists}</textarea>
                                        </td>
                                </tr>
								 <tr>
                                     <td><label class="edit_lbl" for="remark">申请原因:</label></td>
                                        <td colspan="3">
                                              <textarea id="remark" name="remark" class="text ui-widget-content ui-corner-all" style="width: 494px;">${fundsApplyInfoLog.remark?if_exists}</textarea>
                                        </td>
                                </tr>
                                <tr>
                                	<td><label class="edit_lbl" for="payDetails">支出明细:</label></td>
                                    <td colspan="3">
                                    	<textarea id="payDetails" class="text ui-widget-content ui-corner-all" style="width: 494px;" name="payDetails">${fundsApplyInfoLog.pay_details?if_exists}</textarea>
                                    </td>
                                </tr>
							</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<#include "../foot.ftl" />
