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
	    	if($("#name").val()==""){
	    	   alert("请填写会议室名称");
	    	   return false;
	    	}
	        if($("#maxCountUse").val()==""){
	    	   alert("请填写人数");
	    	   return false;
	    	}
	    	 if(isNaN($("#maxCountUse").val())){
	    	   alert("人数必须为数字");
	    	   return false;
	    	}
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
	  document.getElementById("deviceIds").value = selectTagIdsStr;
	}
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
						<li><a href="#add" style="font-size: ;font-family: 'yakov_wryh';">增加</a></li>
					</ul>
					<div id="project" style="overflow:auto;">
						<form id="staffInfoForm" name="staffInfoForm" action="${gzUrl('hysgl/xxwh/add.do')}" method="post">
							<table border="0" width="800" style="overflow: hidden;">
								<tr>
									<td>
										<label for="name" class="edit_lbl">会议室名称:</label>
									</td>
									<td>
										<input type="text" id="name" name="name" class="text ui-widget-content ui-corner-all"/>
									</td>
									<td>
										<label for="maxCountUse" class="edit_lbl">人数:</label>
									</td>
									<td>
										<input type="text" id="maxCountUse" name="maxCountUse" class="text ui-widget-content ui-corner-all"/>
									</td>
								</tr>
								<tr>
									<td>
										<label for="active" class="edit_lbl">状态:</label>
									</td>
									<td>
										<select name="active" id="active" class="text ui-widget-content" style="width:151px;">
							   		              <option value="1">在用</option>
							   		              <option value="-1">不可用</option>
							           </select>
									</td>
								<#--
									<td>
										<label for="address" class="edit_lbl">会议室地址:</label>
									</td>
									<td>
										<input type="text" id="address" name="address" class="text ui-widget-content ui-corner-all" />
									</td>-->
								</tr>
								<#--
								<tr>
									<td>
										<label for="time" class="edit_lbl">装修时间:</label>
									</td>
									<td colspan="3">
										<input type="text" id="startTime" name="startTime" class="text ui-widget-content ui-corner-all" />-
										<input type="text" id="endTime" name="endTime" class="text ui-widget-content ui-corner-all" />
									</td>
								</tr>-->
								<tr>
									<td>
										<label for="stime" class="edit_lbl">基本设备:</label>
									</td>
									<input type="hidden" id="deviceIds" name="deviceIds" class="text ui-widget-content ui-corner-all"/>
									<td colspan="3">
									   	<table>
											<#assign _index=0/>
											<#if meetingRoomDeviceList?exists>
									       	<#list meetingRoomDeviceList as meetingDevice>
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
                                     <td><label class="edit_lbl" for="remark">备注:</label></td>
                                        <td colspan="3">
                                              <textarea id="remark" class="text ui-widget-content ui-corner-all" style="width: 494px;" name="remark"></textarea>
                                        </td>
                                </tr>
								<tr>
									<td colspan="4">
										<input type="button" id="save" value="保存" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
									</td>
								</tr>
							</table>
						</form>
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
