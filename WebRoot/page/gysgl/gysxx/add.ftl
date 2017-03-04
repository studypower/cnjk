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
	    	if($("#businessLicenseExpiryTime").val()==""){
	    	   alert("请填写营业执照过期时间");
	    	   return false;
	    	}
	    	if($("#file").val()==""){
	    	   alert("请填写营业执照附件");
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
						<li><a href="#add" style="font-size: ;font-family: 'yakov_wryh';">增加</a></li>
					</ul>
					<div id="project" style="overflow:auto;">
						<form id="form1" name="form1" action="${gzUrl('gysgl/gysxx/add.do')}" enctype="multipart/form-data" method="post">
							<table border="0" width="700" style="overflow: hidden;">
								<tr>
									<td width="120">
										<label class="edit_lbl">供&nbsp;应&nbsp;商&nbsp;名称:</font>
									</td>
									<td width="200">
										<input type="text" id="name" name="name" class="text ui-widget-content ui-corner-all" />
									</td>
									<td width="120">
										<label class="edit_lbl">供&nbsp;应&nbsp;商&nbsp;类别:</font>
									</td>
									<td>
                                        <select id="type" name="type" class="select01">
        	                                <#if supplierTypeList?exists>
        	                                  <#list supplierTypeList as supplierType>
                                                 <option value="${supplierType.id}">${supplierType.name}</option>
                                              </#list>
                                            </#if>
                                       	</select>
									</td>
								</tr>
								<tr>
								    <td>
										<label class="edit_lbl">营业执照编号:</font>
									</td>
									<td>
										<input type="text" id="businessLicenseNum" name="businessLicenseNum" class="text ui-widget-content ui-corner-all" />
									</td>
									<td>
										<label class="edit_lbl">执照过期时间:</font>
									</td>
									<td>
										<input type="text" id="businessLicenseExpiryTime" name="businessLicenseExpiryTime" class="text ui-widget-content ui-corner-all" />
									</td>
								</tr>
								<tr>
									<td>
										<label class="edit_lbl">营业执照附件:</font>
									</td>
									<td colspan="3"><input type="file" name="file" id="file"/></td>
								</tr>
								<tr>
									<td valign="top">
										<label class="edit_lbl">供&nbsp;应&nbsp;商&nbsp;地址:</font>
									</td>
									<td colspan="3">
										<input type="text" id="address" name="address" class="text ui-widget-content ui-corner-all" style="width: 485px;"/>
									</td>
								</tr>
								<tr>
								   	<td>
										<label class="edit_lbl">联&nbsp;&nbsp;&nbsp;&nbsp;系&nbsp;&nbsp;&nbsp;&nbsp;人&nbsp;:</font>
									</td>
									<td>
                                        <input type="text" id="contactName" name="contactName" class="text ui-widget-content ui-corner-all" />
									</td>
									<td>
										<label class="edit_lbl">联&nbsp;&nbsp;系&nbsp;&nbsp;电&nbsp;&nbsp;话:</font>
									</td>
									<td>
										<input type="text" id="contactPhone" name="contactPhone" class="text ui-widget-content ui-corner-all" />
									</td>
								</tr>
								<tr>
									<td>
										<label class="edit_lbl">供&nbsp;应&nbsp;商&nbsp;等级:</font>
									</td>
									<td>
									  	<select id="complexLevel" name="complexLevel" class="select01">
        	                            	<option value="1">优秀</option>
        	                            	<option value="2">合格</option>
        	                            	<option value="3">不合格</option>
                                       	</select>
									</td>
									<td></td>
									<td></td>
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
