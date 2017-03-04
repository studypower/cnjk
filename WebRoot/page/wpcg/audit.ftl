<#include "../head.ftl" />
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
		$("#save").button().click(function( event ) {
	    	event.preventDefault();
	    	$("#status").val(1);
	    	$("#form1").submit();
	    });
	    $("#save1").button().click(function( event ) {
	    	event.preventDefault();
	    	$("#status").val(-1);
	    	$("#form1").submit();
	    });
	    $("#supplierFile1").customFileInput();
	    $("#supplierFile2").customFileInput();
	    $("#supplierFile3").customFileInput();
		$("#pageloading").hide();
	  	var data = [ 
	  		${purchaseOrderEntryList?if_exists}
		];
	  	var height=$(window).height();
		var width=$(window).width();
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
	    $("#dataGrid").navGrid("#pager",{edit:false,add:false,del:false,refresh:true,search:false});
	    
	    var data1 = [ 
	  		${purchaseOrderSupplierList?if_exists}
		];
	  	var height=$(window).height();
		var width=$(window).width();
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
			<div class="osx-modal-title">您现在所在的位置：<#if step?if_exists==-1>物品采购->采购查询<#elseif step?if_exists==0>物品采购->资产管理员<#elseif step?if_exists==1>物品采购->采购比价<#elseif step?if_exists==2>物品采购->报价审核(普通小组)<#elseif step?if_exists==3>物品采购->报价审核(领导小组)</#if></div>
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
						<li><a href="#add" style="font-size: ;font-family: 'yakov_wryh';">审批</a></li>
					</ul>
					<div id="project" style="overflow:auto;">
					  	<form id="form1" name="staffInfoForm" action="${gzUrl('wpcg/audit.do')}" enctype="multipart/form-data" method="post">
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
									<td colspan="6"><br/></td>
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
									<td colspan="6"><br/></td>
								</tr>
					   			<tr>
									<td colspan="6"><table id="dataGrid"></table></td>
								</tr>
					   			<tr>
									<td colspan="6"><br/></td>
								</tr>
								<tr>
									<td colspan="6"><table id="dataGrid1"></table></td>
								</tr>	
					   			<tr>
									<td colspan="6"><br/></td>
								</tr>
								<tr>
									<td valign="top">审核意见:</td>
									<td colspan="5">
										<textarea id="remark" name="purchaseOrderAudit.remark" class="text ui-widget-content ui-corner-all" style="width: 494px;"></textarea>
									</td>
                                </tr> 	
							    <tr>
									<td colspan="6">
										<input type="hidden" name="id" class="text ui-widget-content ui-corner-all"  value="${purchaseOrder.id?if_exists}"/>
										<input type="hidden" name="fundsApplyId" class="text ui-widget-content ui-corner-all"  value="${purchaseOrder.fundsApplyId?if_exists}"/>
										<input type="hidden" name="step" class="text ui-widget-content ui-corner-all"  value="${step}"/>
										<input type="hidden" name="purchaseOrderAudit.step" class="text ui-widget-content ui-corner-all" value="${step}"/>
										<input type="hidden" id="status" name="purchaseOrderAudit.status" class="text ui-widget-content ui-corner-all" value="0"/>
										<input type="button" id="save" value="审核通过" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
										&nbsp;&nbsp;
										<input type="button" id="save1" value="退回修改" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
										&nbsp;&nbsp;
										<input type="button" id="sendBackButton" value="返回" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
										<script>
											$("#sendBackButton").button().click(function( event ) {
												history.go(-1);
											});
										</script>
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
<#include "../foot.ftl" />
