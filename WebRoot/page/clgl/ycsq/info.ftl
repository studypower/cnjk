<#include "../../head.ftl" />
<script type="text/javascript">
	$(function(){
		$("#tabs" ).tabs();
		$("#tabs").height(300);
		$("#tabs > div").height(300);
		$(window).resize(function(){
			var height=$(window).height();
			$("#tabs").height(height);
			$("#tabs > div").height(height);
		});
		$("#saveBtn").button().click(function( event ) {
	    	event.preventDefault();
	    	$("#form1").submit();
	    });
	    $("#pageloading").hide();
	});
	
	function apply(){
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
						<table border="0" width="650" style="overflow: hidden;">
							<tr>
								<td width="80px">
									<label for="brandName" class="edit_lbl">车辆名称:</label>
								</td>
								<td colspan="3">
									<input type="text" id="brandName" name="brandName" class="text ui-widget-content ui-corner-all" value="${carUseApply.brand_name}" readonly/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="" class="edit_lbl">申请部门:</label>
								</td>
								<td>
									<input type="text" class="text ui-widget-content ui-corner-all" value="${carUseApply.department_name}" readonly/>
								</td>
								<td width="80px">
									<label for="" class="edit_lbl">申请人:</label>
								</td>
								<td>
									<input type="text" class="text ui-widget-content ui-corner-all" value="${carUseApply.staff_name}" readonly/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="seatsNum" class="edit_lbl">使用人数:</label>
								</td>
								<td>
									<input type="text" id="seatsNum" name="seatsNum" class="text ui-widget-content ui-corner-all" value="${carUseApply.seats_num?if_exists}" readonly/>
								</td>
								<td>
									<label for="destination" class="edit_lbl">目的地:</label>
								</td>
								<td>
									<input type="text" id="destination" name="destination" class="text ui-widget-content ui-corner-all" value="${carUseApply.destination?if_exists}" readonly/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="freight" class="edit_lbl">携带货物:</label>
								</td>
								<td>
									<input type="radio" name="freight" value="0" <#if carUseApply.freight==0>checked</#if>/><span class="edit_lbl">否</span>
									<input type="radio" name="freight" value="1" <#if carUseApply.freight==1>checked</#if>/><span class="edit_lbl">是</span>
								</td>
								<td>
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
							</tr>
							<tr>
								<td>
									<label for="startTime" class="edit_lbl">用车时间:</label>
								</td>
								<td colspan="3">
									<input type="text" id="startTime" name="startTime" class="text ui-widget-content ui-corner-all" value="${carUseApply.start_time?datetime}" readonly/>
									~~
									<input type="text" id="endTime" name="endTime" class="text ui-widget-content ui-corner-all" value="${carUseApply.end_time?datetime}" readonly/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="remark" class="edit_lbl">备注:</label>
								</td>
								<td colspan="3">
									<textarea class="text ui-widget-content ui-corner-all" name="remark" id="remark" style="width: 494px;" readonly>${carUseApply.remark?if_exists}</textarea>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<#include "../../foot.ftl" />