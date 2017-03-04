<#include "../../head.ftl" />
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
		$("#startTime").datepicker({
			dateFormat: "yy-mm-dd"
		});
		$("#endTime").datepicker({
			dateFormat: "yy-mm-dd"
		});
		$("#save").button().click(function( event ) {
	    	event.preventDefault();
	    	$("#staffInfoForm").submit();
	    });
	    $("#addCustomer").button().click(function( event ) {
	    	event.preventDefault();
	    	$("#registerDialog").dialog({
	    		 height: 300,
	    		 width: 460,
	    		 modal: true,
	    		 resizable: false,
	    		 buttons:[{
	    			 text:"保存",
	    			 click:function(){
	    				 $("#customer").css("display","none");
	    				 $(this).dialog("close");
	    				 alert("保存");
	    			 }
	    		 },{
	    			 text:"取消",
	    			 click:function(){
	    				 $(this).dialog("close");
	    			 }
	    		 }]
	    	});
	    });
	    $("#form_content select").combobox();
	    $("#clientType").combobox();
		$("#pageloading").hide();
	});
</script>
<body>
<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：会议室申请->会议室管理</div>
		</div>
		<div class="osx-modal-close" style="display: block;cursor: pointer;">
			<div class="osx-modal-icon-back">
				<div class="osx-modal-title" style="text-align: right;line-height: 13px;"><a href="javascript:history.go(-1);"><img src="${gzUrl('images/a_back.png')}" width="14" height="14" />返回</a></div>
			</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form_content">
				<div id="tabs">
				     <ul>
						<li><a href="#add" style="font-size: ;font-family: 'yakov_wryh';">详情</a></li>
					</ul>
					<div id="project" style="overflow:auto;">
							<table border="0" width="800" style="overflow: hidden;">
								<tr>
									<td>
										<label for="name" class="edit_lbl">会议室名称:</label>
									</td>
									<td>
										<input type="text" id="name" name="name" class="text ui-widget-content ui-corner-all" value="${meetingRoomInfo.name?if_exists}" readOnly/>
									</td>
									<td>
										<label for="maxCountUse" class="edit_lbl">人数:</label>
									</td>
									<td>
										<input type="text" id="maxCountUse" name="maxCountUse" class="text ui-widget-content ui-corner-all" value="${meetingRoomInfo.max_count_use?if_exists}" readOnly/>
									</td>
								</tr>
								<tr>
									<td>
										<label for="active" class="edit_lbl">状态:</label>
									</td>
									<td>
							           <#if meetingRoomInfo.active?exists>
							               <#if meetingRoomInfo.active==1>
							                  <input type="text" id="maxCountUse" name="maxCountUse" class="text ui-widget-content ui-corner-all" value="在用" readOnly/>
							               <#elseif meetingRoomInfo.active==-1> 
							                  <input type="text" id="maxCountUse" name="maxCountUse" class="text ui-widget-content ui-corner-all" value="不可用" readOnly/>
							               </#if>
							           </#if>         
									</td>
								<#--
									<td>
										<label for="address" class="edit_lbl">会议室地址:</label>
									</td>
									<td>
										<input type="text" id="address" name="address" class="text ui-widget-content ui-corner-all" value="${meetingRoomInfo.address?if_exists}" readOnly/>
									</td>-->
								</tr>
							<#--
								<tr>
									<td>
										<label for="time" class="edit_lbl">装修时间:</label>
									</td>
									<td colspan="3">
										<input type="text" id="startTime" name="startTime" class="text ui-widget-content ui-corner-all" value="${meetingRoomInfo.start_time?if_exists}" readOnly/>-
										<input type="text" id="endTime" name="endTime" class="text ui-widget-content ui-corner-all" value="${meetingRoomInfo.end_time?if_exists}" readOnly/>
									</td>
								</tr>-->
								<tr>
									<td>
										<label for="stime" class="edit_lbl">基本设备:</label>
									</td>
									<td colspan="3">
									   	<table>
											<#assign _index=0/>
											<#if meetingRoomInfo.meetingDeviceList?exists>
									       	<#list meetingRoomInfo.meetingDeviceList as meetingDevice>
									       	<#if _index==0><tr></#if>
												<td>
													<input type="checkbox" name="meetingRoomDeviceId" value="${meetingDevice.id}"  checked disabled>&nbsp;&nbsp;${meetingDevice.device_name}&nbsp;&nbsp;&nbsp;&nbsp;
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
                                     <td><label class="edit_lbl" for="remark">备注:</label></td>
                                        <td colspan="3">
                                              <textarea id="remark" class="text ui-widget-content ui-corner-all" style="width: 494px;" name="remark" readOnly>${meetingRoomInfo.remark?if_exists}</textarea>
                                        </td>
                                </tr>
							</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="registerDialog" title="客户登记" style="padding: 0px;">
		<iframe id="customer" src="客户登记增加.html" frameborder="0" width="100%" height="100%" style="overflow: hidden;display: none;"></iframe>
	</div>
</body>
<#include "../../foot.ftl" />
