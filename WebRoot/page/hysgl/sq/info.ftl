<#include "../../head.ftl" />
<script type="text/javascript">
	$(function(){
		$("#tabs" ).tabs();
		$("#tabs").height($(window).height());
		$("#tabs > div").height($(window).height());
		$(document.body).css({"overflow-x":"auto","overflow-y":"auto"});
		
		$("#saveBtn").button().click(function( event ) {
	    	event.preventDefault();
	    	$("#form1").submit();
	    });
	    $("#pageloading").hide();
	    checked();
	});
	
	function apply(){
		$("#form1").submit();
	}
	
	var test=new Array();
	<#if meetingRoomApply.deviceIds?exists>
	   <#list meetingRoomApply.deviceIds as deviceIds>
			  test.push({"id":${deviceIds.id?if_exists}});
	   </#list>
	</#if>
	
   function checked(){
	   var checkBoxEle = document.getElementsByName("meetingRoomDeviceId");
	   for(var i = 0 ;i<checkBoxEle.length;i++) {
	      for(var j=0;j<test.length;j++){
	         if(checkBoxEle[i].value==test[j].id){
	            checkBoxEle[i].checked=true;
	         }
	      }
	  }
	}
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form_content">
				<div id="tabs">
					<div id="main_content" style="overflow:auto;">
						<form id="form1" name="form1" action="${gzUrl('hysgl/sq/apply.do')}" method="post">
						<table border="0" width="600" style="overflow: hidden;">
							<tr>
								<td width="80px">
									<label for="idNum" class="edit_lbl">会议室名:</label>
								</td>
								<td>
									<input type="text"  class="text ui-widget-content ui-corner-all" value="${meetingRoomInfo.name?if_exists}" readonly/>
								</td>
								<td width="80px">
									<label for="brandModel" class="edit_lbl">容纳人数:</label>
								</td>
								<td>
									<input type="text"  class="text ui-widget-content ui-corner-all" value="${meetingRoomInfo.max_count_use?if_exists}" readonly/>
								</td>
							</tr>
							<tr>
								<td>
									<label class="edit_lbl">申请部门:</label>
								</td>
								<td>
									<input type="text" class="text ui-widget-content ui-corner-all" value="${meetingRoomApply.departmentName}" readonly/>
								</td>
								<td>
									<label class="edit_lbl">申请人:</label>
								</td>
								<td>
									<input type="text" class="text ui-widget-content ui-corner-all" value="${meetingRoomApply.applyStaffName}" readonly/>
								</td>
							</tr>				
							<tr>
								<td>
									<label for="meetingStartTime" class="edit_lbl">会议时间:</label>
								</td>
								<td colspan="3">
									<input type="text" id="meetingStartTime" name="meetingStartTime" class="text ui-widget-content ui-corner-all" value="${meetingRoomApply.meeting_start_time?if_exists}" readonly/>
									~~
									<input type="text" id="meetingEndTime" name="meetingEndTime" class="text ui-widget-content ui-corner-all" value="${meetingRoomApply.meeting_end_time?if_exists}" readonly/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="meetingTheme" class="edit_lbl">会议主题:</label>
								</td>
								<td colspan="3">
									<input type="text" id="meetingTheme" name="meetingTheme" class="text ui-widget-content ui-corner-all" value="${meetingRoomApply.meeting_theme?if_exists}" style="width:458px;"/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="meetingStaffCount" class="edit_lbl">与会人数:</label>
								</td>
								<td colspan="3">
									<input type="text" id="meetingStaffCount" name="meetingStaffCount" class="text ui-widget-content ui-corner-all" value="${meetingRoomApply.meeting_staff_count?if_exists}" readonly/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="meetingContent" class="edit_lbl">会议内容:</label>
								</td>
								<td colspan="3">
									<textarea class="text ui-widget-content ui-corner-all" name="meetingContent" id="meetingContent" style="width: 458px;" readonly>${meetingRoomApply.meeting_content?if_exists}</textarea>
								</td>
							</tr>
								<tr>
								<td>
									<label for="meetingStaffNames" class="edit_lbl">与会人员:</label>
								</td>
								<td colspan="3">
									<textarea class="text ui-widget-content ui-corner-all" name="meetingStaffNames" id="meetingStaffNames" style="width: 458px;" readonly>${meetingRoomApply.meeting_staff_names?if_exists}</textarea>
								</td>
							</tr>

							<tr>
									<td>
										<label for="stime" class="edit_lbl">配置要求:</label>
									</td>
									<td colspan="3">
									   	<table>
										   <#assign _index=0/>
											<#if meetingRoomInfo.meetingDeviceList?exists>
									       	<#list meetingRoomInfo.meetingDeviceList as meetingDevice>
									       	<#if _index==0><tr></#if>
												<td>
													<input type="checkbox" name="meetingRoomDeviceId" value="${meetingDevice.id}" disabled>&nbsp;&nbsp;${meetingDevice.device_name}&nbsp;&nbsp;&nbsp;&nbsp;
												</td>
											<#if _index==4></tr><#assign _index=0/></#if>
											<#assign _index=_index+1/>
											</#list>
									   		</#if>
									   		<#if _index!=0>
										   		<#list _index .. 4 as i>
										   			<td></td>
										   		</#list>
										   		</tr>
									   		</#if>
										</table>	 
									</td>
						    </tr>
							<tr>
								<td>
									<label for="remark" class="edit_lbl">备注:</label>
								</td>
								<td colspan="3">
									<textarea class="text ui-widget-content ui-corner-all" name="remark" id="remark" style="width: 458px;" readonly>${meetingRoomApply.remark?if_exists}</textarea>
								</td>
							</tr>
						</table>
						<input type="hidden" id="meetingRoomId" name="meetingRoomId" value="${meetingRoomApply.id}" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<#include "../../foot.ftl" />
