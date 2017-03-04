<#include "../../../head.ftl" />
<style>
	.customfile {
		width : 400px;
	}
</style>
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
	        if($("#num").val()=="" || $("#num").val()==null){
	    	   alert("请填证书编号！");
	    	   return false;
	    	}
	    	if($("#expiryTime").val()=="" || $("#expiryTime").val()==null){
	    	   alert("请填写证书过期时间！");
	    	   return false;
	    	}
	    	if($("#file1").val()=="" || $("#file1").val()==null){
	    	   alert("请选择证书附件！");
	    	   return false;
	    	}
	    	$("#form1").submit();
	    });
	    $("#form_content select").combobox();
	    $("#file1").customFileInput();
	    $("#expiryTime").datepicker({
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
			<div class="osx-modal-title">您现在所在的位置：供应商管理->供应商信息->证书信息</div>
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
						<form id="form1" name="form1" action="${gzUrl('gysgl/gysxx/zsxx/add.do')}" enctype="multipart/form-data" method="post">
							<table border="0" width="640" style="overflow: hidden;">
								<tr>
									<td width="320">
										供应商名称:
										<input type="text" class="text ui-widget-content ui-corner-all" value="${supplierInfo.name}" />
									</td>
									<td width="320">
									</td>
								</tr>
								<tr>
									<td>
										证&nbsp;书&nbsp;类&nbsp;别:
										<select id="typeId" name="typeId" class="select01">
        	                                <#if dataSupplierCertificateTypeList?exists>
        	                                  <#list dataSupplierCertificateTypeList as dataSupplierCertificateType>
                                                 <option value="${dataSupplierCertificateType.id}">${dataSupplierCertificateType.name}</option>
                                              </#list>
                                            </#if>
                                       	</select>
									</td>
									<td>
										证&nbsp;书&nbsp;编&nbsp;号:
										<input type="text" id="num" name="num" class="text ui-widget-content ui-corner-all" />
									</td>
								</tr>
								<tr>
									<td>
										到&nbsp;期&nbsp;时&nbsp;间:
										<input type="text" id="expiryTime" name="expiryTime" class="text ui-widget-content ui-corner-all" />
									</td>
									<td>
										需&nbsp;要&nbsp;年&nbsp;检:
										<select id="needInspection" name="needInspection" class="select01">
        	                            	<option value="0">不需要</option>
        	                            	<option value="1">需要</option>
                                       	</select>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<table>
											<tr>
												<td>证&nbsp;书&nbsp;附&nbsp;件:</td>
												<td><input type="file" name="file1" id="file1"/></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<input type="hidden" id="supplierId" name="supplierId" class="text ui-widget-content ui-corner-all" value="${supplierInfo.id}" />
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
<#include "../../../foot.ftl" />
