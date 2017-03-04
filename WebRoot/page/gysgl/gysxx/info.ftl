<#include "../../head.ftl" />
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
						<table border="0" width="800" style="overflow: hidden;">
							<tr>
								<td width="130px">
									<label for="name" class="edit_lbl">供应商名称:</label>
								</td>
								<td>
									<input type="text" id="name" name="name" class="text ui-widget-content ui-corner-all" value="${supplierInfo.name}" />
								</td>
								<td width="140px">
									<label for="type" class="edit_lbl">供应商类别:</label>
								</td>
							    <td>
                                    <input type="text" id="type" name="type" class="text ui-widget-content ui-corner-all" value="${supplierInfo.type_name}" />
								</td>
							</tr>
							<tr>
							    <td>
									<label class="edit_lbl">营业执照编号:</label>
								</td>
								<td>
									<input type="text" id="businessLicenseNum" name="businessLicenseNum" class="text ui-widget-content ui-corner-all" value="${supplierInfo.business_license_num}"/>
								</td>
								<td>
									<label class="edit_lbl">营业执照过期时间:</label>
								</td>
								<td>
									<input type="text" id="businessLicenseExpiryTime" name="businessLicenseExpiryTime" class="text ui-widget-content ui-corner-all" value="${supplierInfo.business_license_expiry_time}" />
								</td>
							</tr>
							<tr>
								<td>
									<label for="businessLicenseFileUrl" class="edit_lbl">营业执照附件(原):</label>
								</td>
								<td colspan="3">
									<input type="button" id="openFile" value="点击查看" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
									<script>
										$("#openFile").button().click(function( event ) {
									    	event.preventDefault();
									    	window.open("${gzUrl(supplierInfo.business_license_file_url)}");
									    });
									</script>
								</td>
								</tr>
							<tr>
								<td>
									<label for="address" class="edit_lbl">供应商地址:</label>
								</td>
								<td colspan="3">
									<input type="text" id="address" name="address" class="text ui-widget-content ui-corner-all" style="width: 535px;" value="${supplierInfo.address}"/>
								</td>
							</tr>
							<tr>
							   <td>
									<label for="contactName" class="edit_lbl">联系人:</label>
								</td>
							    <td>
                                    <input type="text" id="contactName" name="contactName" class="text ui-widget-content ui-corner-all" value="${supplierInfo.contact_name}"/>
								</td>
								<td>
									<label for="contactPhone" class="edit_lbl">联系电话:</label>
								</td>
								<td>
									<input type="text" id="contactPhone" name="contactPhone" class="text ui-widget-content ui-corner-all" value="${supplierInfo.contact_phone}"/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="complexLevel" class="edit_lbl">供应商等级:</label>
								</td>
								<td>
								  	<input type="text" id="complexLevel" name="complexLevel" class="text ui-widget-content ui-corner-all" value="<#if supplierInfo.complex_level==1>优秀<#elseif supplierInfo.complex_level==2>合格<#elseif supplierInfo.complex_level==3>不合格</#if>"/>
								</td>
								<td>
									&nbsp;
								</td>
								<td>
									&nbsp;
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