<#include "../head.ftl" />
<script type="text/javascript">
	var amountList = new Array();
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
	    	if($("#supplierId1").val()==0 && $("#supplierId2").val()==0 && $("#supplierId3").val()==0){
	    		alert("至少填写一家供应商的报价信息！");
	    		return;
	    	}
	    	if($("#supplierId1").val()!=0 && ($("#supplierId1").val()==$("#supplierId2").val() || $("#supplierId1").val()==$("#supplierId3").val())){
	    		alert("不能选择相同的供应商。");
	    		return;
	    	}
	    	if($("#supplierId2").val()!=0 && ($("#supplierId2").val()==$("#supplierId1").val() || $("#supplierId1").val()==$("#supplierId3").val())){
	    		alert("不能选择相同的供应商。");
	    		return;
	    	}
	    	if($("#supplierId3").val()!=0 && ($("#supplierId3").val()==$("#supplierId1").val() || $("#supplierId1").val()==$("#supplierId2").val())){
	    		alert("不能选择相同的供应商。");
	    		return;
	    	}
	    	if($("#supplierId1").val()!=0 && ($("#supplierMoney1").val()=="" || $("#supplierMoney1").val()==null || $("#supplierFile1").val()=="" || $("#supplierFile1").val()==null)){
	    		alert("请完善供应商(1)的报价信息!");
	    		return;
	    	}
	    	if($("#supplierMoney1").val()!=null && $("#supplierMoney1").val()!="" && isNaN($("#supplierMoney1").val())){
    			alert("供应商(1)的报价不能为字符!");
	    		return;
    		}
    		if($("#supplierId2").val()!=0 && ($("#supplierMoney2").val()=="" || $("#supplierMoney2").val()==null || $("#supplierFile2").val()=="" || $("#supplierFile2").val()==null)){
	    		alert("请完善供应商(2)的报价信息!");
	    		return;
	    	} 
	    	if($("#supplierMoney2").val()!=null && $("#supplierMoney2").val()!="" && !isNaN($("#supplierMoney2").val())){
    			alert("供应商(2)的报价不能为字符!");
	    		return;
    		}
	    	if($("#supplierId3").val()!=0 && ($("#supplierMoney3").val()=="" || $("#supplierMoney3").val()==null || $("#supplierFile3").val()=="" || $("#supplierFile3").val()==null)){
	    		alert("请完善供应商(3)的报价信息!");
	    		return;
	    	}
	    	if($("#supplierMoney3").val()!=null && $("#supplierMoney3").val()!="" && !isNaN($("#supplierMoney3").val())){
    			alert("供应商(3)的报价不能为字符!");
	    		return;
    		}
	    	var recommendIndex = $("input[name='recommend']:checked").val();
	    	if(recommendIndex==null || recommendIndex==""){
	    		alert("请推荐一家供应商报价!");
	    		return;
	    	}
	    	if($("#supplierId"+recommendIndex).val()==0){
	    		alert("推荐的供应商报价信息不完整!");
	    		return;
	    	}
	    	$("#supplierStatus" + recommendIndex).val(1);
	    	for(var amountId in amountList){
	    		if($("#amount_"+amountId).val()==null || $("#amount_"+amountId).val()=="" || isNaN($("#amount_"+amountId).val())){
	    			$("#amount_"+amountId).val(0);
	    		}
	    		if($("#money_"+amountId).val()==null || $("#money_"+amountId).val()=="" || isNaN($("#money_"+amountId).val())){
	    			$("#money_"+amountId).val(0);
	    		}
	    	}
	    	var countAmount = 0;
	    	for(var amountId in amountList){
	    		countAmount += $("#amount_"+amountId).val();
	    	}
	    	if(countAmount==0){
	    		if(!confirm("所有设备的验收数量都为0，是否要提交？")){
	    			return;
	    		}
	    	} else{
	    		if(!confirm("是否确认提交？")){
	    			return;
	    		}
	    	}
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
	       colNames: ["设备名称","申购单价","申购数量","备注","采购单价","采购数量"],
	       colModel: [
	            {name: "device_name",width:150,sortable:false,align:"center"},
	            {name: "device_money",width:80,sortable:false,align:"center"},
                {name: "sg_amount",width:80,sortable:false,align:"center"},
                {name: "device_remark",width:250,sortable:false,align:"center"},
	            {name: "",width:80,sortable:false,align:"center",formatter:function(key,options,rowObject){
                	var html='';
                    html += '<input id="money_' + rowObject['id'] + '" type="text" name="money" style="width:60px;"/>';
            		return html;
	            }},
                {name: "",width:80,sortable:false,align:"center",formatter:function(key,options,rowObject){
                	var html='';
                    html += '<input type="hidden" name="purchaseOrderEntryId" style="width:60px;" value="' + rowObject['id'] + '"/>';
                    html += '<input id="amount_' + rowObject['id'] + '" type="text" name="amount" style="width:60px;"/>';
                    amountList[rowObject['id']] = rowObject['id'];
            		return html;
	            }}
	        ],
	        datatype: "local",
	        pager: $("#pager"),
	        rowNum:20,
	        shrinkToFit:false,
	        rownumbers:false,
	        hidegrid:false,
	        multiselect: false,
	        viewrecords:true,
	        height:"100%",
	        width:"100%", 
	        rowList:[10000],
			caption: "采购单明细"
	    });
		for(var i=0;i<=data.length;i++){
	    	$("#dataGrid").jqGrid("addRowData",i+1,data[i]);
	    }
	    $("#dataGrid").navGrid("#pager",{edit:false,add:false,del:false,refresh:true,search:false});
		$(document.body).css({"overflow-x":"auto","overflow-y":"auto"});
	    $(window).resize(function(){
	    	var $window=$(window);
			$("#dataGrid").setGridHeight("100%");
			$("#dataGrid").setGridWidth("100%");
		});
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
			<div class="osx-modal-title">您现在所在的位置：物品采购->采购比价</div>
		</div>
		<div class="osx-modal-close" style="display: block;cursor: pointer;">
			<div class="osx-modal-icon-back">
				<div class="osx-modal-title" style="text-align: right;line-height: 13px;"><a href="javascript:">返回</a></div>
			</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form_content">
				<div id="tabs">
				     <ul>
						<li><a href="#add" style="font-size: ;font-family: 'yakov_wryh';">新增</a></li>
					</ul>
					<div id="project" style="overflow:auto;">
					  	<form id="form1" name="staffInfoForm" action="${gzUrl('wpcg/addSupplier.do')}" enctype="multipart/form-data" method="post">
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
									<td colspan="6">
										<table id="dataGrid"></table>
									</td>
								</tr>
						   		<tr>
									<td colspan="6"><br/></td>
								</tr>
								<tr>
									<td colspan="6">
										<table border="0" width="750px" style="overflow: hidden;">
									        <tr>
									        	<td width="20px">
													&nbsp;
												</td>
												<td width="150px">
													<label class="edit_lbl">供应商</label>
												</td>
												<td width="60px">
													<label class="edit_lbl">报价</label>
												</td>
												<td>
													<label class="edit_lbl">附件</label>
												</td>
												<td>
													<label class="edit_lbl">推荐？</label>
												</td>
											</tr>
											<tr>
												<td width="20px">
													1
												</td>
												<td>
													<select id="supplierId1" name="supplierId">
													    <option value="0"></option>
													    <#if supplierInfoList?exists>
													       <#list supplierInfoList as supplierInfo>
													           <option value="${supplierInfo.id}">${supplierInfo.name}</option>
													       </#list>
													    </#if>
													</select>
												</td>
												<td>
													<input type="text" id="supplierMoney1" name="supplierMoney" class="text ui-widget-content ui-corner-all" style="width:60px;"/>
												</td>
												<td>
													<input type="file" id="supplierFile1" name="supplierFile" class="text ui-widget-content ui-corner-all"/>    
												</td>
												<td>
													<input type="radio" id="radio1" name="recommend" class="text ui-widget-content ui-corner-all" value="1"/>
													<input type="hidden" id="supplierStatus1" name="supplierStatus" class="text ui-widget-content ui-corner-all" style="width:60px;" value="0"/> 
												</td>
											</tr>
											<tr>
												<td width="20px">
													2
												</td>
												<td>
													<select id="supplierId2" name="supplierId">
													    <option value="0"></option>
													    <#if supplierInfoList?exists>
													       <#list supplierInfoList as supplierInfo>
													           <option value="${supplierInfo.id}">${supplierInfo.name}</option>
													       </#list>
													    </#if>
													</select>
												</td>
												<td>
													<input type="text" id="supplierMoney2" name="supplierMoney" class="text ui-widget-content ui-corner-all" style="width:60px;"/>
												</td>
												<td>
													<input type="file" id="supplierFile2" name="supplierFile" class="text ui-widget-content ui-corner-all"/>    
												</td>
												<td>
													<input type="radio" id="radio2" name="recommend" class="text ui-widget-content ui-corner-all" value="2"/> 
													<input type="hidden" id="supplierStatus2" name="supplierStatus" class="text ui-widget-content ui-corner-all" style="width:60px;" value="0"/>   
												</td>
											</tr>
											<tr>
												<td width="20px">
													3
												</td>
												<td>
													<select id="supplierId3" name="supplierId">
													    <option value="0"></option>
													    <#if supplierInfoList?exists>
													       <#list supplierInfoList as supplierInfo>
													           <option value="${supplierInfo.id}">${supplierInfo.name}</option>
													       </#list>
													    </#if>
													</select>
												</td>
												<td>
													<input type="text" id="supplierMoney3" name="supplierMoney" class="text ui-widget-content ui-corner-all" style="width:60px;"/>
												</td>
												<td>
													<input type="file" id="supplierFile3" name="supplierFile" class="text ui-widget-content ui-corner-all"/>    
												</td>
												<td>
													<input type="radio" id="radio3" name="recommend" class="text ui-widget-content ui-corner-all" value="3"/>
													<input type="hidden" id="supplierStatus3" name="supplierStatus" class="text ui-widget-content ui-corner-all" style="width:60px;" value="0"/>
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td colspan="6">
										<input type="hidden" id="id" name="id" class="text ui-widget-content ui-corner-all"  value="${purchaseOrder.id?if_exists}"/>
										<input type="hidden" id="step" name="step" class="text ui-widget-content ui-corner-all"  value="${step}"/>
										<input type="hidden" id="type" name="type" class="text ui-widget-content ui-corner-all"  value="${purchaseOrder.type}"/>
										<input type="button" id="save" value="保存" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
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
