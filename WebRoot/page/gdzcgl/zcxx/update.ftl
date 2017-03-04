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
	    	$("#form1").submit();
	    });
	    $("#form_content select").combobox();
		$("#pageloading").hide();
	});
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
						<li><a href="#add" style="font-size: ;font-family: 'yakov_wryh';">修改</a></li>
					</ul>
					<div id="project" style="overflow:auto;">
						<form id="form1" name="form1" action="${gzUrl('gdzcgl/zcxx/update.do')}" method="post">
							<table border="0" width="1100" style="overflow: hidden;">
								<tr>
									<td width="70">
										<label for="num" class="edit_lbl">资产编号:</label>
									</td>
									<td>
										<input type="text" id="num" name="num" class="text ui-widget-content ui-corner-all" value="${assetsInfo.num?if_exists}"/>(可修改)
									</td>
									<td  width="70">
										<label for="name" class="edit_lbl">资产名称:</label>
									</td>
									<td>
										<input type="text" id="name" name="name" class="text ui-widget-content ui-corner-all" value="${assetsInfo.name?if_exists}"/>(可修改)
									</td>
									<td width="70">
										<label for="deviceTypeId" class="edit_lbl">设备类别:</label>
									</td>
								    <td>
                                        <select id="deviceTypeId" name="deviceTypeId" class="select01">
        	                                <#if dataDeviceTypeList?exists>
        	                                  <#list dataDeviceTypeList as dataDeviceType>
                                                 <option value="${dataDeviceType.id}" <#if assetsInfo.device_type_id?if_exists==dataDeviceType.id>selected</#if>>${dataDeviceType.name}</option>
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
                                           <#if dataDeviceList?exists>
                                              <#list dataDeviceList as dataDevice>
                                                  <option value="${dataDevice.id}" <#if assetsInfo.device_id?if_exists==dataDevice.id>selected</#if>>${dataDevice.name}</option>
                                              </#list>
                                           </#if>
                                       	</select>
									</td>
									 <td>
										<label for="brandId" class="edit_lbl">设备类别:</label>
									</td>
								    <td>
                                        <select id="brandId" name="brandId" class="select01">
                                           <#if dataBrandList?exists>
                                             <#list dataBrandList as dataBrand>
                                                <option value="${dataBrand.id}" <#if assetsInfo.brand_id?if_exists==dataBrand.id>selected</#if>>${dataBrand.name}</option>
                                             </#list>
                                           </#if>
                                       	</select>
									</td>
									<td>
										<label for="brandFormatId" class="edit_lbl">设备类别:</label>
									</td>
								    <td>
                                        <select id="brandFormatId" name="brandFormatId" class="select01">
                                           <#if dataBrandFormatList?exists>
                                              <#list dataBrandFormatList as dataBrandFormat>
                                                 <option value="${dataBrandFormat.id}" <#if assetsInfo.brand_format_id?if_exists==dataBrandFormat.id>selected</#if>>${dataBrandFormat.name}</option>
                                              </#list>
                                           </#if>
                                       	</select>
									</td>
								</tr>
								<tr>
									<td>
										<label for="serialNumber" class="edit_lbl">序列号:</label>
									</td>
									<td>
										<input type="text" id="serialNumber" name="serialNumber" class="text ui-widget-content ui-corner-all"  value="${assetsInfo.serial_number?if_exists}"/>(可修改)
									</td>
									<td>
										<label for="originPlace" class="edit_lbl">产地:</label>
									</td>
									<td>
										<input type="text" id="originPlace" name="originPlace" class="text ui-widget-content ui-corner-all" value="${assetsInfo.origin_place?if_exists}"/>(可修改)
									</td>
								    <td>
										<label for="unitPrice" class="edit_lbl">单价:</label>
									</td>
									<td>
										<input type="text" id="unitPrice" name="unitPrice" class="text ui-widget-content ui-corner-all" value="${assetsInfo.unit_price?if_exists}"/>(可修改)
									</td>
								</tr>
								<tr>
									<td>
										<label for="unitPrice1" class="edit_lbl">现值:</label>
									</td>
									<td>
										<input type="text" id="unitPrice1" name="unitPrice1" class="text ui-widget-content ui-corner-all" value="${assetsInfo.unit_price1?if_exists}"/>(可修改)
									</td>
									<td>
										<label for="amount" class="edit_lbl">数量:</label>
									</td>
									<td>
										<input type="text" id="amount" name="amount" class="text ui-widget-content ui-corner-all" value="${assetsInfo.amount?if_exists}" readOnly/>
									</td>
									<td>
										<label for="measureUnit" class="edit_lbl">计量单位:</label>
									</td>
									<td>
										<input type="text" id="measureUnit" name="measureUnit" class="text ui-widget-content ui-corner-all" value="${assetsInfo.measure_unit?if_exists}" readOnly/>
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
                                        	<option value="${supplierInfo.id}" <#if assetsInfo.supplier_id?if_exists==supplierInfo.id>selected</#if>>${supplierInfo.name}</option>
                                        	</#list>
                                          </#if>	
                                       	</select>
									</td>
									<td>
										<label for="invoiceNumber" class="edit_lbl">发票编号:</label>
									</td>
									<td>
										<input type="text" id="invoiceNumber" name="invoiceNumber" class="text ui-widget-content ui-corner-all" value="${assetsInfo.invoice_number?if_exists}"/>(可修改)
									</td>
									<td>
										<label for="useSituationId" class="edit_lbl">使用情况:</label>
									</td>
									<td>
									  	<select id="useSituationId" name="useSituationId" class="select01">
									  	  <#if useSituationList?exists>
									  		<#list useSituationList as useSituation>
                                        	<option value="${useSituation.get('value')}" <#if assetsInfo.use_situation_id?if_exists?string==useSituation.get('value')>selected</#if>>${useSituation.name}</option>
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
									  	  <#if dataUsePlaceList?exists>
									  		<#list dataUsePlaceList as dataUsePlace>
                                        	   <option value="${dataUsePlace.id}" <#if assetsInfo.use_place_id?if_exists==dataUsePlace.id>selected</#if>>${dataUsePlace.department_name}_${dataUsePlace.room_num}</option>
                                        	</#list>
                                          </#if> 	
                                       	</select>
									</td>
									<td>
										<label for="serviceSituationId" class="edit_lbl">维修情况:</label>
									</td>
									<td>
									  	<select id="serviceSituationId" name="serviceSituationId" class="select01">
									  	 <#if serviceSituationList?exists>
									  		<#list serviceSituationList as serviceSituation>
                                        	   <option value="${serviceSituation.get('value')}" <#if assetsInfo.service_situation_id?if_exists?string==serviceSituation.get('value')>selected</#if>>${serviceSituation.name}</option>
                                        	</#list>
                                        </#if>	
                                       	</select>
									</td>
									<td>
										<label for="serviceFirm" class="edit_lbl">维修企业:</label>
									</td>
									<td>
										<input type="text" id="serviceFirm" name="serviceFirm" class="text ui-widget-content ui-corner-all" value="${assetsInfo.service_firm?if_exists}" readOnly/>
									</td>
								</tr>
								<tr>
									<td>
										<label for="storageModeId" class="edit_lbl">获得方式:</label>
									</td>
									<td>
										<select id="storageModeId" name="storageModeId" class="select01">
										  <#if storageModeList?exists>
									  		<#list storageModeList as storageMode>
                                        	  <option value="${storageMode.get('value')}" <#if assetsInfo.storage_mode_id?if_exists?string==storageMode.get('value')>selected</#if>>${storageMode.name}</option>
                                        	</#list>
                                          </#if>	
                                       	</select>
									</td>
									<td>
										<label for="buyStaffId" class="edit_lbl">购买人:</label>
									</td>
									<td>
										<select id="buyStaffId" name="buyStaffId" class="select01">
										  <#if staffInfoList?exists>
									  		<#list staffInfoList as staffInfo>
                                        	  <option value="${staffInfo.id}" <#if assetsInfo.buy_staff_id?if_exists==staffInfo.id>selected</#if>>${staffInfo.name}</option>
                                        	</#list>
                                          </#if>	
                                       	</select>
									</td>
									<td>
										<label for="buyTime" class="edit_lbl">购买时间:</label>
									</td>
									<td>
										<input type="text" id="buyTime" name="buyTime" class="text ui-widget-content ui-corner-all" value="${assetsInfo.buy_time?if_exists}" readOnly/>
									</td>
								</tr>
								<tr>
									<td>
										<label for="signStaffId" class="edit_lbl">签收人:</label>
									</td>
									<td>
										<select id="signStaffId" name="signStaffId" class="select01">
										   <#if staffInfoList?exists>
									  		<#list staffInfoList as staffInfo>
                                        	  <option value="${staffInfo.id}" <#if assetsInfo.sign_staff_id?if_exists==staffInfo.id>selected</#if>>${staffInfo.name}</option>
                                        	</#list>
                                           </#if>	
                                       	</select>
									</td>
									<td>
										<label for="signTime" class="edit_lbl">签收时间:</label>
									</td>
									<td>
										<input type="text" id="signTime" name="signTime" class="text ui-widget-content ui-corner-all" value="${assetsInfo.sign_time?if_exists}" readOnly/>
									</td>
									<td>
										<label for="depotStaffId" class="edit_lbl">入库人:</label>
									</td>
									<td>
										<select id="depotStaffId" name="depotStaffId" class="select01">
										  <#if staffInfoList?exists>
									  		<#list staffInfoList as staffInfo>
                                        	   <option value="${staffInfo.id}" <#if assetsInfo.depot_staff_id?if_exists==staffInfo.id>selected</#if>>${staffInfo.name}</option>
                                        	</#list>
                                          </#if>	
                                       	</select>
									</td>
								</tr>
								<tr>

									<td>
										<label for="depotTime" class="edit_lbl">入库时间:</label>
									</td>
									<td>
										<input type="text" id="depotTime" name="depotTime" class="text ui-widget-content ui-corner-all" value="${assetsInfo.depot_time?if_exists}" readOnly/>
									</td>
								<#if assetsInfo.use_staff_id?exists && assetsInfo.use_staff_id!=0>	
									<td>
										<label for="useStaffId" class="edit_lbl">使用人:</label>
									</td>
									<td>
										<select id="useStaffId" name="useStaffId" class="select01">
										  <option value="0"></option>
										  <#if staffInfoList?exists>
									  		<#list staffInfoList as staffInfo>
                                        	   <option value="${staffInfo.id}" <#if assetsInfo.use_staff_id==staffInfo.id>selected</#if>>${staffInfo.name}</option>
                                        	</#list>
                                          </#if>	
                                       	</select>
									</td>
								 </#if> 
								</tr>
								<tr>
                                	<td><label class="edit_lbl" for="remark">备注:</label></td>
                                    <td colspan="3">
                                    	<textarea id="remark" class="text ui-widget-content ui-corner-all" style="width: 494px;" name="remark" value="${assetsInfo.remark?if_exists}">${assetsInfo.remark?if_exists}</textarea>(可修改)
                                	</td>
                                </tr>
								<tr>
									<td colspan="4">
									    <input type="hidden" id="id" name="id" class="text ui-widget-content ui-corner-all" value="${assetsInfo.id?if_exists}"/>
										<input type="button" id="save" value="修改" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
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
