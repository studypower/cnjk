<#include "../head.ftl" />
<script type="text/javascript">
	$(function(){
		$("#tabs" ).tabs();
		
		$("#pageloading").hide();
		
	  	var height=$(window).height();
		var width=$(window).width();
	  	var data = [ 
	  		${purchaseOrderEntryList?if_exists}
		];
		$("#dataGrid").jqGrid({
	   		colNames: ["设备名称","申购单价","申购数量","备注","采购单价","采购数量","采购总价","验收数量"],
	       	colModel: [
	            {name: "device_name",width:150,sortable:false,align:"center"},
	            {name: "device_money",width:80,sortable:false,align:"center"},
                {name: "sg_amount",width:80,sortable:false,align:"center"},
                {name: "device_remark",width:250,sortable:false,align:"center"},
                {name: "money",width:80,sortable:false,align:"center"},
                {name: "amount",width:80,sortable:false,align:"center"},
                {name: "",width:80,sortable:false,align:"center",formatter:function(key,options,rowObject){
               		return Math.round(rowObject['amount'] * rowObject['money']*1000)/1000;
                }},
                {name: "ys_amount",width:80,sortable:false,align:"center"}
	        ],
	        datatype: "local",
	        pager: $("#pager"),
	        rowNum:20,
	        shrinkToFit:false,
	        rownumbers:false,
	        hidegrid:false,
	        multiselect:false,
	        viewrecords:true,
	        height:"100%",
	        width:"100%", 
	        rowList:[10000],
			caption: "资产采购明细"
	    });
		for(var i=0;i<=data.length;i++){
	    	$("#dataGrid").jqGrid("addRowData",i+1,data[i]);
	    }
	    
	    <#if purchaseOrder.purchaseOrderSupplierList?exists && purchaseOrder.purchaseOrderSupplierList.size()!=0>
	    var data1 = [ 
	  		${purchaseOrderSupplierList?if_exists}
		];
		$("#dataGrid1").jqGrid({
	       colNames: ["供应商名称","供应商报价","报价附件","推荐？","选择？"],
	       colModel: [
	            {name: "supplier_name",width:200,sortable:false,align:"center"},
	            {name: "money",width:150,sortable:false,align:"center"},
	            {name: "file_url",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return "<a href='${gzUrl('')}" + key + "'>查看资料</a>";
	            }},
	            {name: "status",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(key==1){
	            		return "√";
	            	}
	            	return "";
	            }},
	            {name: "selected",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	<#if step==2>
	            		return "<input type='radio' id='radio"+rowObject['supplier_id']+"' name='selectedSupplierId' class='text ui-widget-content ui-corner-all' value='"+rowObject['supplier_id']+"'/> ";
	            	<#else>
	            		if(key==1){
	            			return "√";
	            		}
	            		return "";
	            	</#if>
	            }}
	        ],
	        datatype: "local",
	        pager: $("#pager"),
	        rowNum:20,
	        shrinkToFit:false,
	        rownumbers:false,
	        hidegrid:false,
	        multiselect:false,
	        viewrecords:true,
	        height:"100%",
	        width: 825, 
	        rowList:[10000],
			caption: "供应商报价明细"
	    });
		for(var i=0;i<=data1.length;i++){
	    	$("#dataGrid1").jqGrid("addRowData",i+1,data1[i]);
	    }
	    </#if>
	    
	    <#if purchaseOrder.depotRkEntryList?exists && purchaseOrder.depotRkEntryList.size()!=0>
	    var data2 = [ 
	  		${depotRkEntryList?if_exists}
		];
		$("#dataGrid2").jqGrid({
	       colNames: ["设备类别","设备类别","设备品牌","设备型号","单价","入库数量"],
	       colModel: [
	            {name: "device_type_name",width:200,sortable:false,align:"center"},
	            {name: "device_name",width:150,sortable:false,align:"center"},
	            {name: "brand_name",width:150,sortable:false,align:"center"},
	            {name: "brand_format_name",width:150,sortable:false,align:"center"},
	            {name: "money",width:150,sortable:false,align:"center"},
	            {name: "amount",width:150,sortable:false,align:"center"}
	        ],
	        datatype: "local",
	        pager: $("#pager"),
	        rowNum:20,
	        shrinkToFit:false,
	        rownumbers:false,
	        hidegrid:false,
	        multiselect:false,
	        viewrecords:true,
	        height:"100%",
	        width: "100%", 
	        rowList:[10000],
			caption: "入库资产明细"
	    });
		for(var i=0;i<=data2.length;i++){
	    	$("#dataGrid2").jqGrid("addRowData",i+1,data2[i]);
	    }
	    </#if>
	    
		$(document.body).css({"overflow-x":"auto","overflow-y":"auto"});
		$("#form_content select").combobox();
	});
	<#if result?exists>
	     <#if result==0> 
	          alert("修改失败"); 
	     </#if>             
	</#if>
</script>
<body>
<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：物品采购-->采购单明细</div>
		</div>
		<div class="osx-modal-close" style="display: block;cursor: pointer;">
			<div class="osx-modal-icon-back">
				<div class="osx-modal-title" style="text-align: right;line-height: 13px;"><a href="javascript:history.go(-1);">返回</a></div>
			</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form_content">
				<div id="tabs">
				    <ul>
						<li><a href="#add" style="font-size: ;font-family: 'yakov_wryh';">资产采购明细</a></li>
					</ul>
					<div id="project" style="overflow:auto;">
					  	<form id="form1" name="form1" action="${gzUrl('wpcg/storage.do')}" enctype="multipart/form-data" method="post">
					  		<table border="0" width="960" style="overflow: hidden;">
					  			<tr>
									<td width="90px">
										经费单名称:
									</td>
									<td width="200px">
										<input type="text" class="text ui-widget-content ui-corner-all"  value="${purchaseOrder.fundsApplyName?if_exists}" disabled/>
									</td>
									<td width="90px">
										经费单编号:
									</td>
									<td width="200px">
										<input type="text" class="text ui-widget-content ui-corner-all" value="${purchaseOrder.fundsApplyNum?if_exists}" disabled/>
									</td>
									<td width="90px">
										经费单金额:
									</td>
									<td>
										<input type="text" class="text ui-widget-content ui-corner-all" value="${purchaseOrder.funds_apply_money?if_exists}" disabled/>
									</td>
								</tr>
								<tr>
									<td>
										申请部门:
									</td>
									<td>
										<input type="text" class="text ui-widget-content ui-corner-all"  value="${purchaseOrder.applyDepartmentName?if_exists}" disabled/>
									</td>
									<td>
										经办人:
									</td>
									<td>
										<input type="text" class="text ui-widget-content ui-corner-all" value="${purchaseOrder.applyStaffName?if_exists}" disabled/>
									</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td colspan="6">
										<br/>
									</td>
								</tr>
								<tr>
									<td>
										采购单编号:
									</td>
									<td>
										<input type="text" name="name" id="name" class="text ui-widget-content ui-corner-all" value="${purchaseOrder.name?if_exists}" readonly/>
									</td>
									<td>
										采购方式:
									</td>
									<td>
										<#if purchaseOrder.type==0>
											<input type="text" class="text ui-widget-content ui-corner-all" value="科室采购" readonly/>
										<#elseif purchaseOrder.type==1>	
											<input type="text" class="text ui-widget-content ui-corner-all" value="宣传品采购" readonly/>
										<#elseif purchaseOrder.type==2>
											<input type="text" class="text ui-widget-content ui-corner-all" value="政府采购" readonly/>
										<#elseif purchaseOrder.type==3>
											<input type="text" class="text ui-widget-content ui-corner-all" value="集中采购" readonly/>
										</#if>
									</td>
									<td>
										采购单时间:
									</td>
									<td>
										<input type="text" class="text ui-widget-content ui-corner-all" value="${purchaseOrder.create_time?if_exists}" readonly/>
									</td>
								</tr>
						  		<tr>
									<td colspan="6">
						  				<br/>
						  			</td>
						  		</tr>
								<#if purchaseOrder.sign_supplier_name?exists && purchaseOrder.sign_contract_num?exists>
								<tr>
									<td>
										采购供应商:
									</td>
									<td>
										<input type="text" class="text ui-widget-content ui-corner-all"  value="${purchaseOrder.sign_supplier_name?if_exists}" disabled/>
									</td>
									<td>
										采购合同编号:
									</td>
									<td>
										<input type="text" id="signContractNum" name="signContractNum" class="text ui-widget-content ui-corner-all" value="${purchaseOrder.sign_contract_num?if_exists}" readonly/>
									</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td colspan="6">
										<br/>
									</td>
								</tr>
								</#if>
								<#if purchaseOrder.ysd_key?exists>
								<tr>
									<td>
										验收编号:
									</td>
									<td>
										<input type="text" class="text ui-widget-content ui-corner-all"  value="${purchaseOrder.ysd_key?if_exists}" disabled/>
									</td>
									<td>
										验收时间:
									</td>
									<td>
										<input type="text" id="signContractNum" name="signContractNum" class="text ui-widget-content ui-corner-all" value="${purchaseOrder.ys_time?if_exists}" readonly/>
									</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td colspan="6">
										<br/>
									</td>
								</tr>
								</#if>
								<#if purchaseOrder.rkd_key?exists>
								<tr>
									<td>
										入库编号:
									</td>
									<td>
										<input type="text" class="text ui-widget-content ui-corner-all"  value="${purchaseOrder.rkd_key?if_exists}" disabled/>
									</td>
									<td>
										入库时间:
									</td>
									<td>
										<input type="text" id="signContractNum" name="signContractNum" class="text ui-widget-content ui-corner-all" value="${purchaseOrder.rk_time?if_exists}" readonly/>
									</td>
									<td></td>
									<td></td>
								</tr>
						  		<tr>
									<td colspan="6">
						  				<br/>
						  			</td>
						  		</tr>
								</#if>
						  		<tr>
									<td colspan="6">
						   				<table id="dataGrid"></table>
						   			</td>
						  		</tr>
						  		<tr>
									<td colspan="6">
						   				<br/>
						   			</td>
						  		</tr>
						  		<tr>
									<td colspan="6">
						   				<table id="dataGrid1"></table>
						   			</td>
						  		</tr>
						  		<tr>
									<td colspan="6">
						   				<br/>
						   			</td>
						  		</tr>
						  		
						  		<#if purchaseOrder.zczlFileUrlList?exists>
						  		<#list purchaseOrder.zczlFileUrlList as zczlFileUrl>
						  		<tr>
									<td>
										<#if zczlFileUrl_index==0>
										政采资料：
										</#if>
						   			</td>
						   			<td colspan="5">
						   				<input type="text" name="cgFileUrl" class="text ui-widget-content ui-corner-all" style="width:300px;" value="${zczlFileUrl.file_name}"/>
		                         		<input type="hidden" name="cgFileUrl" class="text ui-widget-content ui-corner-all" value="${zczlFileUrl.file_url?if_exists}"/>
		                         		<input type="button" id="_openDataFileInfo${zczlFileUrl_index}" value="查看" style="font-size: ;font-family: 'yakov_wryh';width: 60px;"/>&nbsp;&nbsp;
						   				<script>
											$("#_openDataFileInfo${zczlFileUrl_index}").button().click(function( event ) {
												window.open("${gzUrl(zczlFileUrl.file_url?if_exists)}");
											});
		                                </script>
						   			</td>
						  		</tr>
						  		</#list>
						  		</#if>
						  		<#if purchaseOrder.zc_remark?exists>
						  		<tr>
									<td>
										政采备注:
									</td>
									<td colspan="5">
										<textarea id="zcRemark" name="zcRemark" class="text ui-widget-content ui-corner-all" style="width: 520px;">${purchaseOrder.zc_remark}</textarea>
									</td>
								</tr>	
						  		</#if>
						  		<#if purchaseOrder.cgFileUrlList?exists>
						  		<#list purchaseOrder.cgFileUrlList as cgFileUrl>
						  		<tr>
									<td>
										<#if cgFileUrl_index==0>
										采购资料：
										</#if>
						   			</td>
						   			<td colspan="5">
						   				<input type="text" name="cgFileUrl" class="text ui-widget-content ui-corner-all" style="width:300px;" value="${cgFileUrl.fileName}"/>
		                         		<input type="hidden" name="cgFileUrl" class="text ui-widget-content ui-corner-all" value="${cgFileUrl.fileUrl?if_exists}"/>
		                         		<input type="button" id="_openDataFileInfo${cgFileUrl_index}" value="查看" style="font-size: ;font-family: 'yakov_wryh';width: 60px;"/>&nbsp;&nbsp;
						   				<script>
											$("#_openDataFileInfo${cgFileUrl_index}").button().click(function( event ) {
												window.open("${gzUrl(cgFileUrl.fileUrl?if_exists)}");
											});
		                                </script>
						   			</td>
						  		</tr>
						  		</#list>
						  		</#if>
						  		
						  		<#if purchaseOrder.ysFileUrlList?exists>
						  		<#list purchaseOrder.ysFileUrlList as ysFileUrl>
						  		<tr>
									<td>
										<#if ysFileUrl_index==0>
										验收资料：
										</#if>
						   			</td>
						   			<td colspan="5">
						   				<input type="text" name="ysFileUrl" class="text ui-widget-content ui-corner-all" style="width:300px;" value="${ysFileUrl.fileName}"/>
		                         		<input type="hidden" name="ysFileUrl" class="text ui-widget-content ui-corner-all" value="${ysFileUrl.fileUrl?if_exists}"/>
		                         		<input type="button" id="_openDataYsFileInfo${ysFileUrl_index}" value="查看" style="font-size: ;font-family: 'yakov_wryh';width: 60px;"/>&nbsp;&nbsp;
						   				<script>
											$("#_openDataYsFileInfo${ysFileUrl_index}").button().click(function( event ) {
												window.open("${gzUrl(ysFileUrl.fileUrl?if_exists)}");
											});
		                                </script>
						   			</td>
						  		</tr>
						  		</#list>
						  		<tr>
									<td colspan="6">
						   				<br/>
						   			</td>
						  		</tr>
						  		</#if>
						  		<tr>
									<td colspan="6">
						   				<table id="dataGrid2"></table>
						   			</td>
						  		</tr>
							</table>
							<input type="button" id="sendBackButton" value="返回" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
							<script>
								$("#sendBackButton").button().click(function( event ) {
									history.go(-1);
								});
							</script>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<#include "../foot.ftl" />
