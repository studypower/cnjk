<#include "../../../head.ftl" />
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
						<li><a href="#add" style="font-size: ;font-family: 'yakov_wryh';">详情</a></li>
					</ul>
					<div id="project" style="overflow:auto;">
						<form id="form1" name="form1" action="${gzUrl('gysgl/gysxx/zsxx/add.do')}" enctype="multipart/form-data" method="post">
							<table border="0" width="640" style="overflow: hidden;">
								<tr>
									<td width="320">
										供应商名称:
										<input type="text" class="text ui-widget-content ui-corner-all" value="${supplierCertificate.supplier_name}" />
									</td>
									<td width="320"></td>
								</tr>
								<tr>
									<td>
										证&nbsp;书&nbsp;类&nbsp;别:
										<input type="text" class="text ui-widget-content ui-corner-all" value="${supplierCertificate.type_name}" />
									</td>
									<td>
										证&nbsp;书&nbsp;编&nbsp;号:
										<input type="text" id="num" name="num" class="text ui-widget-content ui-corner-all" value="${supplierCertificate.num}" />
									</td>
								</tr>
								<tr>
									<td>
										到&nbsp;期&nbsp;时&nbsp;间:
										<input type="text" id="expiryTime" name="expiryTime" class="text ui-widget-content ui-corner-all" value="${supplierCertificate.expiry_time}" />
									</td>
									<td>
										需&nbsp;要&nbsp;年&nbsp;检:
                                       	<input type="text" class="text ui-widget-content ui-corner-all" value="<#if supplierCertificate.need_inspection==0>不需要<#else>需要</#if>" />
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<table>
											<tr>
												<td>证&nbsp;书&nbsp;附&nbsp;件:</td>
												<td>
													<#if supplierCertificate.file_url1?exists>
														<input type="button" id="openFile1" value="点击查看原件" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
														<script>
															$("#openFile1").button().click(function( event ) {
														    	event.preventDefault();
														    	window.open("${gzUrl(supplierCertificate.file_url1)}");
														    });
														</script>
														<input type="hidden" id="fileUrl1" name="fileUrl1" class="text ui-widget-content ui-corner-all" value="${supplierCertificate.file_url1}" />
													</#if>
												</td>
											</tr>
										</table>
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
