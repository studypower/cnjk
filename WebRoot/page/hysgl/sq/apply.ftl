<#include "../../head.ftl" />
<script type="text/javascript">
	$(function(){
		$("#tabs" ).tabs();
		$("#tabs").height($(window).height());
		$("#tabs > div").height($(window).height());
		$(document.body).css({"overflow-x":"auto","overflow-y":"auto"});
	    $("#pageloading").hide();
	});
	
	function apply(){
	    var startTime = $("#startTime_ymd").val() + " " + $("#startTime_hm").val() + ":00";
    	$("#meetingStartTime").val(startTime);
    	var endTime = $("#endTime_ymd").val() + " " + $("#endTime_hm").val() + ":00";
    	$("#meetingEndTime").val(endTime);
    	if($("#meetingStartTime").val()==""){
    	   alert("请填写会议开始时间");
    	   return false;
    	}
        if($("#meetingEndTime").val()==""){
    	   alert("请填写会议结束时间");
    	   return false;
    	}
        if($("#meetingStartTime").val()>=$("#meetingEndTime").val()){
    		alert("会议开始时间不能晚于等于会议结束时间!");
    		return;
        }
    	if($("#meetingTheme").val()==""){
    	   alert("请填写会议主题");
    	   return false;
    	}
        if($("#meetingStaffCount").val()==""){
    	   $("#meetingStaffCount").val(0);
    	}
    	if(isNaN($("#meetingStaffCount").val())){
    	   $("#meetingStaffCount").val(0);
    	}
    	if($("#meetingStaffNames").val()==""){
    	   $("#meetingStaffNames").val(" ");
    	}
		$("#form1").submit();
	}
	
	 function changeSelectedTags(){
	   var checkBoxEle = document.getElementsByName("meetingRoomDeviceId");
	   var selectTagIdsStr = "";
	   for(var i = 0 ;i<checkBoxEle.length;i++) {
	       if(checkBoxEle[i].checked) {
		      if(selectTagIdsStr!=""){
		        selectTagIdsStr += ",";
		       }
		      selectTagIdsStr += checkBoxEle[i].value;
	       }
	  }
	  document.getElementById("meetingDeviceIds").value = selectTagIdsStr;
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
						<table border="0" style="overflow: hidden;">
							<tr>
								<td width="80px">
									<label for="idNum" class="edit_lbl">会议室:</label>
								</td>
								<td>
									<input type="text"  class="text ui-widget-content ui-corner-all" value="${meetingRoomInfo.name?if_exists}" readonly/>
								</td>
								<td width="80px">
									<label for="meetingStaffCount" class="edit_lbl">容纳人数:</label>
								</td>
								<td>
									<input type="text" class="text ui-widget-content ui-corner-all"  value="${meetingRoomInfo.max_count_use}" readOnly/>
								</td>
							</tr>
							<tr>
								<td>
									<label class="edit_lbl">申请部门:</label>
								</td>
								<td>
									<input type="text" class="text ui-widget-content ui-corner-all" value="${Session.currentUser.departmentName}" readonly/>
								</td>
								<td>
									<label class="edit_lbl">申请人:</label>
								</td>
								<td>
									<input type="text" class="text ui-widget-content ui-corner-all" value="${Session.currentUser.staffName}" readonly/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="" class="edit_lbl">会议时间:</label>
								</td>
								<td colspan="3">
									<input type="hidden" id="meetingStartTime" name="meetingStartTime" class="text ui-widget-content ui-corner-all" readonly/>
									<input type="text" id="startTime_ymd" name="startTime_ymd" style="width:110px;" class="text ui-widget-content ui-corner-all" value="${meetingStartTime?date?if_exists}" readonly/>
									<select id="startTime_hm" name="startTime_hm">
										<#if 600 gte meetingStartTime?datetime?string('HHmm')?number>
										<option>06:00</option>
										</#if>
										<#if 630 gte meetingStartTime?datetime?string('HHmm')?number>
										<option>06:30</option>
										</#if>
										<#if 700 gte meetingStartTime?datetime?string('HHmm')?number>
										<option>07:00</option>
										</#if>
										<#if 730 gte meetingStartTime?datetime?string('HHmm')?number>
										<option>07:30</option>
										</#if>
										<#if 800 gte meetingStartTime?datetime?string('HHmm')?number>
										<option>08:00</option>
										</#if>
										<#if 830 gte meetingStartTime?datetime?string('HHmm')?number>
										<option>08:30</option>
										</#if>
										<#if 900 gte meetingStartTime?datetime?string('HHmm')?number>
										<option>09:00</option>
										</#if>
										<#if 930 gte meetingStartTime?datetime?string('HHmm')?number>
										<option>09:30</option>
										</#if>
										<#if 1000 gte meetingStartTime?datetime?string('HHmm')?number>
										<option>10:00</option>
										</#if>
										<#if 1030 gte meetingStartTime?datetime?string('HHmm')?number>
										<option>10:30</option>
										</#if>
										<#if 1100 gte meetingStartTime?datetime?string('HHmm')?number>
										<option>11:00</option>
										</#if>
										<#if 1130 gte meetingStartTime?datetime?string('HHmm')?number>
										<option>11:30</option>
										</#if>
										<#if 1200 gte meetingStartTime?datetime?string('HHmm')?number>
										<option>12:00</option>
										</#if>
										<#if 1230 gte meetingStartTime?datetime?string('HHmm')?number>
										<option>12:30</option>
										</#if>
										<#if 1300 gte meetingStartTime?datetime?string('HHmm')?number>
										<option>13:00</option>
										</#if>
										<#if 1330 gte meetingStartTime?datetime?string('HHmm')?number>
										<option>13:30</option>
										</#if>
										<#if 1400 gte meetingStartTime?datetime?string('HHmm')?number>
										<option>14:00</option>
										</#if>
										<#if 1430 gte meetingStartTime?datetime?string('HHmm')?number>
										<option>14:30</option>
										</#if>
										<#if 1500 gte meetingStartTime?datetime?string('HHmm')?number>
										<option>15:00</option>
										</#if>
										<#if 1530 gte meetingStartTime?datetime?string('HHmm')?number>
										<option>15:30</option>
										</#if>
										<#if 1600 gte meetingStartTime?datetime?string('HHmm')?number>
										<option>16:00</option>
										</#if>
										<#if 1630 gte meetingStartTime?datetime?string('HHmm')?number>
										<option>16:30</option>
										</#if>
										<#if 1700 gte meetingStartTime?datetime?string('HHmm')?number>
										<option>17:00</option>
										</#if>
										<#if 1730 gte meetingStartTime?datetime?string('HHmm')?number>
										<option>17:30</option>
										</#if>
										<#if 1800 gte meetingStartTime?datetime?string('HHmm')?number>
										<option>18:00</option>
										</#if>
										<#if 1830 gte meetingStartTime?datetime?string('HHmm')?number>
										<option>18:30</option>
										</#if>
										<#if 1900 gte meetingStartTime?datetime?string('HHmm')?number>
										<option>19:00</option>
										</#if>
									</select>
									~~
									<input type="hidden" id="meetingEndTime" name="meetingEndTime" class="text ui-widget-content ui-corner-all" readonly/>
									<input type="text" id="endTime_ymd" name="endTime_ymd" style="width:110px;" class="text ui-widget-content ui-corner-all" value="${meetingEndTime?date?if_exists}" readonly/>
									<select id="endTime_hm" name="endTime_hm">
										<#if 600 gt meetingStartTime?datetime?string('HHmm')?number>
										<option>06:00</option>
										</#if>
										<#if 630 gt meetingStartTime?datetime?string('HHmm')?number>
										<option>06:30</option>
										</#if>
										<#if 700 gt meetingStartTime?datetime?string('HHmm')?number>
										<option>07:00</option>
										</#if>
										<#if 730 gt meetingStartTime?datetime?string('HHmm')?number>
										<option>07:30</option>
										</#if>
										<#if 800 gt meetingStartTime?datetime?string('HHmm')?number>
										<option>08:00</option>
										</#if>
										<#if 830 gt meetingStartTime?datetime?string('HHmm')?number>
										<option>08:30</option>
										</#if>
										<#if 900 gt meetingStartTime?datetime?string('HHmm')?number>
										<option>09:00</option>
										</#if>
										<#if 930 gt meetingStartTime?datetime?string('HHmm')?number>
										<option>09:30</option>
										</#if>
										<#if 1000 gt meetingStartTime?datetime?string('HHmm')?number>
										<option>10:00</option>
										</#if>
										<#if 1030 gt meetingStartTime?datetime?string('HHmm')?number>
										<option>10:30</option>
										</#if>
										<#if 1100 gt meetingStartTime?datetime?string('HHmm')?number>
										<option>11:00</option>
										</#if>
										<#if 1130 gt meetingStartTime?datetime?string('HHmm')?number>
										<option>11:30</option>
										</#if>
										<#if 1200 gt meetingStartTime?datetime?string('HHmm')?number>
										<option>12:00</option>
										</#if>
										<#if 1230 gt meetingStartTime?datetime?string('HHmm')?number>
										<option>12:30</option>
										</#if>
										<#if 1300 gt meetingStartTime?datetime?string('HHmm')?number>
										<option>13:00</option>
										</#if>
										<#if 1330 gt meetingStartTime?datetime?string('HHmm')?number>
										<option>13:30</option>
										</#if>
										<#if 1400 gt meetingStartTime?datetime?string('HHmm')?number>
										<option>14:00</option>
										</#if>
										<#if 1430 gt meetingStartTime?datetime?string('HHmm')?number>
										<option>14:30</option>
										</#if>
										<#if 1500 gt meetingStartTime?datetime?string('HHmm')?number>
										<option>15:00</option>
										</#if>
										<#if 1530 gt meetingStartTime?datetime?string('HHmm')?number>
										<option>15:30</option>
										</#if>
										<#if 1600 gt meetingStartTime?datetime?string('HHmm')?number>
										<option>16:00</option>
										</#if>
										<#if 1630 gt meetingStartTime?datetime?string('HHmm')?number>
										<option>16:30</option>
										</#if>
										<#if 1700 gt meetingStartTime?datetime?string('HHmm')?number>
										<option>17:00</option>
										</#if>
										<#if 1730 gt meetingStartTime?datetime?string('HHmm')?number>
										<option>17:30</option>
										</#if>
										<#if 1800 gt meetingStartTime?datetime?string('HHmm')?number>
										<option>18:00</option>
										</#if>
										<#if 1830 gt meetingStartTime?datetime?string('HHmm')?number>
										<option>18:30</option>
										</#if>
										<#if 1900 gt meetingStartTime?datetime?string('HHmm')?number>
										<option>19:00</option>
										</#if>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<label for="meetingTheme" class="edit_lbl">会议主题:</label>
								</td>
								<td colspan="3">
									<input type="text" id="meetingTheme" name="meetingTheme" class="text ui-widget-content ui-corner-all" style="width:458px"/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="meetingStaffCount" class="edit_lbl">与会人数:</label>
								</td>
								<td colspan="3">
									<input type="text" id="meetingStaffCount" name="meetingStaffCount" class="text ui-widget-content ui-corner-all"/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="meetingContent" class="edit_lbl">会议内容:</label>
								</td>
								<td colspan="3">
									<textarea class="text ui-widget-content ui-corner-all" name="meetingContent" id="meetingContent" style="width: 458px;"></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="meetingStaffNames" class="edit_lbl">与会人员:</label>
								</td>
								<td colspan="3">
									<textarea class="text ui-widget-content ui-corner-all" name="meetingStaffNames" id="meetingStaffNames" style="width: 458px;"></textarea>
								</td>
							</tr>
							<tr>
									<td>
										<label for="stime" class="edit_lbl">配置要求:</label>
									</td>
									<input type="hidden" id="meetingDeviceIds" name="meetingDeviceIds" class="text ui-widget-content ui-corner-all"/>
									<td colspan="3">
										<table>
											<#assign _index=0/>
											<#if meetingRoomInfo.meetingDeviceList?exists>
									       	<#list meetingRoomInfo.meetingDeviceList as meetingDevice>
									       	<#if _index==0><tr></#if>
												<td>
													<input type="checkbox" name="meetingRoomDeviceId" value="${meetingDevice.id}" onClick="changeSelectedTags()">&nbsp;&nbsp;${meetingDevice.device_name}&nbsp;&nbsp;&nbsp;&nbsp;
												</td>
											<#if _index==4></tr></#if>
											<#assign _index=_index+1/>
											<#if _index==5><#assign _index=0/></#if>
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
									<textarea class="text ui-widget-content ui-corner-all" name="remark" id="remark" style="width: 458px;"></textarea>
								</td>
							</tr>
						</table>
						<input type="hidden" id="meetingRoomId" name="meetingRoomId" value="${meetingRoomInfo.id?if_exists}" />
						<#if isDisplay('8_1_3')>	
							<input type="hidden" id="status" name="status" value="1" />
						</#if>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<#include "../../foot.ftl" />
