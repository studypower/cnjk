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
	    	if($("#num").val()==""){
	    	   alert("请填写营业执照编号");
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
	    $("#file").customFileInput();
	    $("#businessLicenseExpiryTime").datepicker({
			dateFormat: "yy-mm-dd"
		});
		$("#pageloading").hide();
	});
	
</script>
<body>
<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：供应商管理->供应商信息</div>
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
						<form id="form1" name="form1" action="${gzUrl('gysgl/gysxx/update.do')}" enctype="multipart/form-data" method="post">
							<table border="0" width="800" style="overflow: hidden;">
								<tr>
									<td width="400">
										供&nbsp;&nbsp;应&nbsp;&nbsp;商&nbsp;&nbsp;名&nbsp;&nbsp;称:
										<input type="text" id="name" name="name" class="text ui-widget-content ui-corner-all" value="${supplierInfo.name}" />
									</td>
									<td width="400">
										供&nbsp;&nbsp;应&nbsp;&nbsp;商&nbsp;&nbsp;类&nbsp;&nbsp;别:
                                        <select id="type" name="type" class="select01">
        	                                <#if supplierTypeList?exists>
        	                                  <#list supplierTypeList as supplierType>
                                                 <option value="${supplierType.id}" <#if supplierInfo.type==supplierType.id>selected</#if>>${supplierType.name}</option>
                                              </#list>
                                            </#if>
                                       	</select>
									</td>
								</tr>
								<tr>
									<td colspan="2" valign="top">
										供&nbsp;&nbsp;应&nbsp;&nbsp;商&nbsp;&nbsp;地&nbsp;&nbsp;址:
										<input type="text" id="address" name="address" class="text ui-widget-content ui-corner-all" style="width: 585px;" value="${supplierInfo.address}"/>
									</td>
								</tr>
								<tr>
								    <td>
										营&nbsp;业&nbsp;执&nbsp;照&nbsp;编&nbsp;号:
										<input type="text" id="businessLicenseNum" name="businessLicenseNum" class="text ui-widget-content ui-corner-all" value="${supplierInfo.business_license_num}"/>
									</td>
									<td>
										执&nbsp;照&nbsp;过&nbsp;期&nbsp;时&nbsp;间:
										<input type="text" id="businessLicenseExpiryTime" name="businessLicenseExpiryTime" class="text ui-widget-content ui-corner-all" value="${supplierInfo.business_license_expiry_time}" />
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<table>
											<tr>
												<td>营&nbsp;业&nbsp;执&nbsp;照&nbsp;附&nbsp;件:</td>
												<td>
													<input type="button" id="openFile" value="点击查看原附件" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
													<script>
														$("#openFile").button().click(function( event ) {
													    	event.preventDefault();
													    	window.open("${gzUrl(supplierInfo.business_license_file_url)}");
													    });
													</script>
													<input type="hidden" id="businessLicenseFileUrl" name="businessLicenseFileUrl" class="text ui-widget-content ui-corner-all" value="${supplierInfo.business_license_file_url}" />
												</td>
												<td><input type="file" name="file" id="file"/></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
								   <td>
										联&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;系&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;人:
                                        <input type="text" id="contactName" name="contactName" class="text ui-widget-content ui-corner-all"  value="${supplierInfo.contact_name}"/>
									</td>
									<td>
										联&nbsp;&nbsp;&nbsp;系&nbsp;&nbsp;&nbsp;&nbsp;电&nbsp;&nbsp;&nbsp;&nbsp;话:
										<input type="text" id="contactPhone" name="contactPhone" class="text ui-widget-content ui-corner-all"  value="${supplierInfo.contact_phone}"/>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										供&nbsp;&nbsp;应&nbsp;&nbsp;商&nbsp;&nbsp;等&nbsp;&nbsp;级:
									  	<select id="complexLevel" name="complexLevel" class="select01">
        	                            	<option value="1" <#if supplierInfo.complex_level==1>selected</#if>>优秀</option>
        	                            	<option value="2" <#if supplierInfo.complex_level==2>selected</#if>>合格</option>
        	                            	<option value="3" <#if supplierInfo.complex_level==3>selected</#if>>不合格</option>
                                       	</select>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<input type="hidden" id="id" name="id" class="text ui-widget-content ui-corner-all" value="${supplierInfo.id}" />
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
