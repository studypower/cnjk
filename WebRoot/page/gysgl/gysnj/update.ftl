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
								<td>
									<label for="name" class="edit_lbl">供应商名称:</label>
								</td>
								<td>
									<input type="text" id="name" name="name" class="text ui-widget-content ui-corner-all" value="${supplierInfo.name}" />
								</td>
								<td>
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
							</tr>
							<tr>
							    <td>
									<label for="type" class="edit_lbl">供应商类别:</label>
								</td>
							    <td>
                                    <select id="type" name="type" class="select01">
    	                                <#if supplierTypeList?exists>
    	                                  <#list supplierTypeList as supplierType>
                                             <option value="${supplierType.id}" <#if supplierType.id==supplierInfo.type></#if>>${supplierType.name}</option>
                                          </#list>
                                        </#if>
                                   	</select>
								</td>
								<td>
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
							</tr>
							<tr>
								<td width="80px">
									<label for="address" class="edit_lbl">供应商地址:</label>
								</td>
								<td colspan="3">
									<textarea class="text ui-widget-content ui-corner-all" name="address" id="address" style="width: 494px;">${supplierInfo.address}</textarea>
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