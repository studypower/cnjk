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
		$("#save").button().click(function( event ) {
	    	event.preventDefault();
	    	if($("#name").val()==""){
	    	   alert("请填写供应商名称");
	    	   return false;
	    	}
	        if($("#address").val()==""){
	    	   alert("请填写供应商地址");
	    	   return false;
	    	}
	        if($("#contactName").val()==""){
	    	   alert("请填写联系人姓名");
	    	   return false;
	    	}
	    	if($("#contactPhone").val()==""){
	    	   alert("请填写联系人电话");
	    	   return false;
	    	}
	    	$("#form1").submit();
	    });
	    $("#form_content select").combobox();
	    $("#deviceTypeId").combobox({
			change:changeDeviceType(),
			select:function(){
				changeDeviceType();
			}
		});
		$("#buyTime").datepicker({
			dateFormat: "yy-mm-dd"
		});
		$("#signTime").datepicker({
			dateFormat: "yy-mm-dd"
		});
		$("#depotTime").datepicker({
			dateFormat: "yy-mm-dd"
		});
		$("#pageloading").hide();
	});
	
	function changeDeviceType() {
		if($("#deviceTypeId").val()!="" && $("#deviceTypeId").val()!=0){
			$.get("${gzUrl('xtsz/sjzd/sb/ajaxList.do?typeId=')}" + $("#deviceTypeId").val() + "&timestamp=" + Date.parse(new Date()), null, function(data){
				var deviceList = eval("("+data+")");
			    var deviceSelect = document.getElementById("deviceId");
			    var deviceCount = deviceSelect.options.length;
			    for(var i = 0; i<deviceCount; i++){
			      	deviceSelect.options.remove(0);//每次删除下标都是0
			   	} 
		 		for(var i=0; i<deviceList.length; i++){
				    var option = document.createElement("OPTION"); 
				    option.value = deviceList[i].id;  
				    option.innerHTML = deviceList[i].name;
				    deviceSelect.appendChild(option);
				    if(i==0){
			   			$("#deviceId" +" option[value='" + deviceList[i].id + "']").attr("selected", "selected");
			   		}
		   		}
			   	$("#deviceId").combobox("destroy");
		   		$("#deviceId").combobox({
		   			change:changeDevice(),
		   			select:function(){
		   				changeDevice();
		   			}
		   		});
			});
		}
	}
	
	function changeDevice() {
		if($("#deviceId").val()!="" && $("#deviceId").val()!=0){
			$.get("${gzUrl('xtsz/sjzd/sbpp/ajaxList.do?deviceId=')}" + $("#deviceId").val() + "&timestamp=" + Date.parse(new Date()), null, function(data){
				var brandList = eval("("+data+")");
			    var brandSelect = document.getElementById("brandId");
			    var brandCount = brandSelect.options.length;
			    for(var i = 0; i<brandCount; i++){
			      	brandSelect.options.remove(0);//每次删除下标都是0
			   	}
		 		for(var i=0; i<brandList.length; i++){
				    var option = document.createElement("OPTION"); 
				    option.value = brandList[i].id;  
				    option.innerHTML = brandList[i].name;
				    brandSelect.appendChild(option);
				    if(i==0){
			   			$("#brandId" +" option[value='" + brandList[i].id + "']").attr("selected", "selected");
			   		}
		   		}
			   	$("#brandId").combobox("destroy");
		   		$("#brandId").combobox({
			   		change:changeBrand(),
		   			select:function(){
		   				select:changeBrand();
		   			}
		   		});
			});
		}
	}
	
	function changeBrand() {
		if($("#brandId").val()!="" && $("#brandId").val()!=0){
			$.get("${gzUrl('xtsz/sjzd/ppxh/ajaxList.do?brandId=')}" + $("#brandId").val() + "&timestamp=" + Date.parse(new Date()), null, function(data){
				var brandFormatList = eval("("+data+")");
			    var brandFormatSelect = document.getElementById("brandFormatId");
			    var brandFormatCount = brandFormatSelect.options.length;
			    for(var i = 0; i<brandFormatCount; i++){
			      	brandFormatSelect.options.remove(0);//每次删除下标都是0
			   	} 
		 		for(var i=0; i<brandFormatList.length; i++){
				    var option = document.createElement("OPTION"); 
				    option.value = brandFormatList[i].id;  
				    option.innerHTML = brandFormatList[i].name;
				    brandFormatSelect.appendChild(option);
				    if(i==0){
			   			$("#brandFormatId" +" option[value='" + brandFormatList[i].id + "']").attr("selected", "selected");
			   		}
		   		}
			   	$("#brandFormatId").combobox("destroy");
		   		$("#brandFormatId").combobox(
		   		);
			});
		}
	}
	
</script>
<body>
<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：固定资产管理->资产信息</div>
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
						<form id="form1" name="form1" action="${gzUrl('gdzcgl/zcxx/add.do')}" method="post">
							<table border="0" width="850" style="overflow: hidden;">
								<tr>
									<td width="90">
										<label for="num" class="edit_lbl">资产编号:</label>
									</td>
									<td>
										<input type="text" id="num" name="num" class="text ui-widget-content ui-corner-all" />
									</td>
									<td  width="90">
										<label for="name" class="edit_lbl">资产名称:</label>
									</td>
									<td>
										<input type="text" id="name" name="name" class="text ui-widget-content ui-corner-all" />
									</td>
									<td width="90">
										<label for="deviceTypeId" class="edit_lbl">设备类别:</label>
									</td>
								    <td>
                                        <select id="deviceTypeId" name="deviceTypeId" class="select01">
        	                                <#if dataDeviceTypeList?exists>
        	                                  <#list dataDeviceTypeList as dataDeviceType>
                                                 <option value="${dataDeviceType.id}">${dataDeviceType.name}</option>
                                              </#list>
                                            </#if>
                                       	</select>
									</td>
								</tr>
								<tr>
									<td>
										<label for="deviceId" class="edit_lbl">设备名称:</label>
									</td>
								    <td>
                                        <select id="deviceId" name="deviceId" class="select01">
                                       	</select>
									</td>
									 <td>
										<label for="brandId" class="edit_lbl">设备类别:</label>
									</td>
								    <td>
                                        <select id="brandId" name="brandId" class="select01">
                                       	</select>
									</td>
									<td>
										<label for="brandFormatId" class="edit_lbl">设备类别:</label>
									</td>
								    <td>
                                        <select id="brandFormatId" name="brandFormatId" class="select01">
                                       	</select>
									</td>
								</tr>
								<tr>
									<td>
										<label for="serialNumber" class="edit_lbl">序列号:</label>
									</td>
									<td>
										<input type="text" id="serialNumber" name="serialNumber" class="text ui-widget-content ui-corner-all" />
									</td>
									<td>
										<label for="originPlace" class="edit_lbl">产地:</label>
									</td>
									<td>
										<input type="text" id="originPlace" name="originPlace" class="text ui-widget-content ui-corner-all" />
									</td>
								    <td>
										<label for="unitPrice" class="edit_lbl">单价:</label>
									</td>
									<td>
										<input type="text" id="unitPrice" name="unitPrice" class="text ui-widget-content ui-corner-all" />
									</td>
								</tr>
								<tr>
									<td>
										<label for="unitPrice1" class="edit_lbl">现值:</label>
									</td>
									<td>
										<input type="text" id="unitPrice1" name="unitPrice1" class="text ui-widget-content ui-corner-all" />
									</td>
									<td>
										<label for="amount" class="edit_lbl">数量:</label>
									</td>
									<td>
										<input type="text" id="amount" name="amount" class="text ui-widget-content ui-corner-all" />
									</td>
									<td>
										<label for="measureUnit" class="edit_lbl">计量单位:</label>
									</td>
									<td>
										<input type="text" id="measureUnit" name="measureUnit" class="text ui-widget-content ui-corner-all" />
									</td>
								</tr>
								<tr>
								   <td>
										<label for="supplierId" class="edit_lbl">供应商:</label>
									</td>
								    <td>
                                        <select id="supplierId" name="supplierId" class="select01">
                                          <#if supplierInfoList?exists>
                                        	<#list supplierInfoList as supplierInfo>
                                        	<option value="${supplierInfo.id}">${supplierInfo.name}</option>
                                        	</#list>
                                          </#if>	
                                       	</select>
									</td>
									<td>
										<label for="invoiceNumber" class="edit_lbl">发票编号:</label>
									</td>
									<td>
										<input type="text" id="invoiceNumber" name="invoiceNumber" class="text ui-widget-content ui-corner-all" />
									</td>
									<td>
										<label for="useSituationId" class="edit_lbl">使用情况:</label>
									</td>
									<td>
									  	<select id="useSituationId" name="useSituationId" class="select01">
									  	  <#if useSituationList?exists>
									  		<#list useSituationList as useSituation>
                                        	<option value="${useSituation.get('value')}">${useSituation.name}</option>
                                        	</#list>
                                          </#if>	
                                       	</select>
									</td>
								</tr>
								<tr>
									<td>
										<label for="usePlaceId" class="edit_lbl">使用地点:</label>
									</td>
									<td>
									  	<select id="usePlaceId" name="usePlaceId" class="select01">
									  		<#list dataUsePlaceList as dataUsePlace>
                                        	<option value="${dataUsePlace.id}">${dataUsePlace.department_name}_${dataUsePlace.room_num}</option>
                                        	</#list>
                                       	</select>
									</td>
									<td>
										<label for="serviceSituationId" class="edit_lbl">维修情况:</label>
									</td>
									<td>
									  	<select id="serviceSituationId" name="serviceSituationId" class="select01">
									  		<#list serviceSituationList as serviceSituation>
                                        	<option value="${serviceSituation.get('value')}">${serviceSituation.name}</option>
                                        	</#list>
                                       	</select>
									</td>
									<td>
										<label for="serviceFirm" class="edit_lbl">维修企业:</label>
									</td>
									<td>
										<input type="text" id="serviceFirm" name="serviceFirm" class="text ui-widget-content ui-corner-all" />
									</td>
								</tr>
								<tr>
									<td>
										<label for="storageModeId" class="edit_lbl">获得方式:</label>
									</td>
									<td>
										<select id="storageModeId" name="storageModeId" class="select01">
									  		<#list storageModeList as storageMode>
                                        	<option value="${storageMode.get('value')}">${storageMode.name}</option>
                                        	</#list>
                                       	</select>
									</td>
									<td>
										<label for="buyStaffId" class="edit_lbl">购买人:</label>
									</td>
									<td>
										<select id="buyStaffId" name="buyStaffId" class="select01">
									  		<#list staffInfoList as staffInfo>
                                        	<option value="${staffInfo.id}">${staffInfo.name}</option>
                                        	</#list>
                                       	</select>
									</td>
									<td>
										<label for="buyTime" class="edit_lbl">购买时间:</label>
									</td>
									<td>
										<input type="text" id="buyTime" name="buyTime" class="text ui-widget-content ui-corner-all" />
									</td>
								</tr>
								<tr>
									<td>
										<label for="signStaffId" class="edit_lbl">签收人:</label>
									</td>
									<td>
										<select id="signStaffId" name="signStaffId" class="select01">
									  		<#list staffInfoList as staffInfo>
                                        	<option value="${staffInfo.id}">${staffInfo.name}</option>
                                        	</#list>
                                       	</select>
									</td>
									<td>
										<label for="signTime" class="edit_lbl">签收时间:</label>
									</td>
									<td>
										<input type="text" id="signTime" name="signTime" class="text ui-widget-content ui-corner-all" />
									</td>
									<td>
										<label for="depotStaffId" class="edit_lbl">入库人:</label>
									</td>
									<td>
										<select id="depotStaffId" name="depotStaffId" class="select01">
									  		<#list staffInfoList as staffInfo>
                                        	<option value="${staffInfo.id}">${staffInfo.name}</option>
                                        	</#list>
                                       	</select>
									</td>
								</tr>
								<tr>

									<td>
										<label for="depotTime" class="edit_lbl">入库时间:</label>
									</td>
									<td>
										<input type="text" id="depotTime" name="depotTime" class="text ui-widget-content ui-corner-all" />
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
</body>
<#include "../../foot.ftl" />
