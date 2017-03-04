<#include "../head.ftl" />
<script type="text/javascript">
	
	var purchaseOrderEntryAmountList = new Array();
	var stockEntryList = new Array();
	var stockEntrySum = 0;

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
	    	for(var _index in stockEntryList){
	    		if(stockEntryList[_index]!=null && stockEntryList[_index]!=""){
	    			if($("#deviceTypeId"+stockEntryList[_index]).val()==null || $("#deviceTypeId"+stockEntryList[_index]).val()==""){
	    				alert("入库物品类别不能为空！");
	    				return false;
	    			}
	    			if($("#deviceId"+stockEntryList[_index]).val()==null || $("#deviceId"+stockEntryList[_index]).val()==""){
	    				alert("入库物品名称不能为空！");
	    				return false;
	    			}
	    			if($("#brandId"+stockEntryList[_index]).val()==null || $("#brandId"+stockEntryList[_index]).val()==""){
	    				alert("入库物品品牌不能为空！");
	    				return false;
	    			}
	    			if($("#brandFormatId"+stockEntryList[_index]).val()==null || $("#brandFormatId"+stockEntryList[_index]).val()==""){
	    				alert("入库物品型号不能为空！");
	    				return false;
	    			}
	    			if($("#amount"+stockEntryList[_index]).val()==null || $("#amount"+stockEntryList[_index]).val()==""){
	    				alert("入库物品数量不能为空！");
	    				return false;
	    			}
	    			if($("#money"+stockEntryList[_index]).val()==null || $("#money"+stockEntryList[_index]).val()==""){
	    				alert("入库物品的采购单价不能为空！");
	    				return false;
	    			}
	    		}
	    	}
	    	if(!confirm("是否确认提交？")){
    			return;
    		}
	    	$("#form1").submit();
	    });
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
	    
		$(document.body).css({"overflow-x":"auto","overflow-y":"auto"});
		$("#form_content select").combobox();
		
		 $("#addStockEntry").button().click(function(event){
			var _len = $("#formTable3 tr").length;
			var newTr = "<tr id="+_len+">";
			newTr += "<td style=\"border:1px solid #1670eb;\"><select id=\"deviceTypeId"+_len+"\" name=\"deviceTypeId\" zj_class=\"custom-combobox100\">";
			<#list dataDeviceTypeList as dataDeviceType>
			newTr += "<option value=\"${dataDeviceType.id}\">${dataDeviceType.name}</option>";
			</#list>
			newTr += "</select></td>";
			newTr += "<td style=\"border:1px solid #1670eb;\"><select id=\"deviceId"+_len+"\" name=\"deviceId\" zj_class=\"custom-combobox100\"></select></td>";
			newTr += "<td style=\"border:1px solid #1670eb;\"><select id=\"brandId"+_len+"\" name=\"brandId\" zj_class=\"custom-combobox100\"></select></td>";
			newTr += "<td style=\"border:1px solid #1670eb;\"><select id=\"brandFormatId"+_len+"\" name=\"brandFormatId\" zj_class=\"custom-combobox100\"></select></td>";
			newTr += "<td style=\"border:1px solid #1670eb;\" align=\"center\"><input type=\"text\" id=\"money"+_len+"\" name=\"money\" class=\"text ui-widget-content ui-corner-all\" style=\"width:60px;\"/></td>";
			newTr += "<td style=\"border:1px solid #1670eb;\" align=\"center\"><input type=\"text\" id=\"amount"+_len+"\" name=\"amount\" class=\"text ui-widget-content ui-corner-all\" style=\"width:60px;\"/></td>";
			newTr += "<td style=\"border:1px solid #1670eb;\" align=\"center\"><input type=\"button\" id=\"dropStockEntry"+_len+"\" value=\"移除\" style=\"font-size: 62.5%;font-family: 'yakov_wryh';width: 60px;\"/></td><td></td>";
			newTr += "</tr>";
    		$("#formTable3 tr:gt(0):eq("+(_len-3)+")").after(newTr);
    		stockEntryList[_len] = _len;
    		stockEntrySum ++;
    		$("#deviceTypeId"+_len).combobox({
    			change:changeDeviceType(_len),
    			select:function(){
    				changeDeviceType(_len);
    			}
    		});
    		$("#deviceId"+_len).combobox({
    		});
    		$("#brandId"+_len).combobox({
    		});
    		$("#brandFormatId"+_len).combobox({
    		});
    		$("#dropStockEntry"+_len).button().click(function( event ) {
    			stockEntryList[_len] = null;
    			stockEntrySum --;
    			$("#formTable3 tr:gt(0):eq("+(_len-2)+")").html("");
    		});
		});
	});
	
	function changeDeviceType(_len) {
		if($("#deviceTypeId"+_len).val()!="" && $("#deviceTypeId"+_len).val()!=0){
			$.get("${gzUrl('xtsz/sjzd/sb/ajaxList.do?typeId=')}" + $("#deviceTypeId"+_len).val() + "&timestamp=" + Date.parse(new Date()), null, function(data){
				var deviceList = eval("("+data+")");
			    var deviceSelect = document.getElementById("deviceId"+_len);
			    var deviceCount = deviceSelect.options.length;
			    for(var i = 0; i<deviceCount; i++){
			      	deviceSelect.options.remove(0);//每次删除下标都是0
			   	} 
		 		for(var i=0; i<deviceList.length; i++){
				    var option = document.createElement("OPTION"); 
				    option.value = deviceList[i].id;  
				    option.innerHTML = deviceList[i].name;
				    deviceSelect.appendChild(option);
				    if(i==0){
			   			$("#deviceId"+ _len +" option[value='" + deviceList[i].id + "']").attr("selected", "selected");
			   		}
		   		}
			   	$("#deviceId"+ _len).combobox("destroy");
		   		$("#deviceId"+ _len).combobox({
		   			change:changeDevice(_len),
		   			select:function(){
		   				changeDevice(_len);
		   			}
		   		});
			});
		}
	}
	
	function changeDevice(_len) {
		if($("#deviceId"+_len).val()!="" && $("#deviceId"+_len).val()!=0){
			$.get("${gzUrl('xtsz/sjzd/sbpp/ajaxList.do?deviceId=')}" + $("#deviceId"+_len).val() + "&timestamp=" + Date.parse(new Date()), null, function(data){
				var brandList = eval("("+data+")");
			    var brandSelect = document.getElementById("brandId"+_len);
			    var brandCount = brandSelect.options.length;
			    for(var i = 0; i<brandCount; i++){
			      	brandSelect.options.remove(0);//每次删除下标都是0
			   	}
		 		for(var i=0; i<brandList.length; i++){
				    var option = document.createElement("OPTION"); 
				    option.value = brandList[i].id;  
				    option.innerHTML = brandList[i].name;
				    brandSelect.appendChild(option);
				    if(i==0){
			   			$("#brandId"+ _len +" option[value='" + brandList[i].id + "']").attr("selected", "selected");
			   		}
		   		}
			   	$("#brandId"+ _len).combobox("destroy");
		   		$("#brandId"+ _len).combobox({
		   			change:changeBrand(_len),
		   			select:function(){
		   				changeBrand(_len);
		   			}
		   		});
			});
		}
	}
	
	function changeBrand(_len) {
		if($("#brandId"+_len).val()!="" && $("#brandId"+_len).val()!=0){
			$.get("${gzUrl('xtsz/sjzd/ppxh/ajaxList.do?brandId=')}" + $("#brandId"+_len).val() + "&timestamp=" + Date.parse(new Date()), null, function(data){
				var brandFormatList = eval("("+data+")");
			    var brandFormatSelect = document.getElementById("brandFormatId"+_len);
			    var brandFormatCount = brandFormatSelect.options.length;
			    for(var i = 0; i<brandFormatCount; i++){
			      	brandFormatSelect.options.remove(0);//每次删除下标都是0
			   	} 
		 		for(var i=0; i<brandFormatList.length; i++){
				    var option = document.createElement("OPTION"); 
				    option.value = brandFormatList[i].id;  
				    option.innerHTML = brandFormatList[i].name;
				    brandFormatSelect.appendChild(option);
				    if(i==0){
			   			$("#brandFormatId"+ _len +" option[value='" + brandFormatList[i].id + "']").attr("selected", "selected");
			   		}
		   		}
			   	$("#brandFormatId"+ _len).combobox("destroy");
		   		$("#brandFormatId"+ _len).combobox({
		   		});
			});
		}
	}
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
			<div class="osx-modal-title">您现在所在的位置：物品采购->资产入库</div>
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
						<li><a href="#add" style="font-size: ;font-family: 'yakov_wryh';">资产入库</a></li>
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
								<#if purchaseOrder.sign_supplier_name?exists>
								<tr>
									<td>
										采购供应商:
									</td>
									<td>
										<input type="text" class="text ui-widget-content ui-corner-all"  value="${purchaseOrder.sign_supplier_name}" disabled/>
									</td>
									<td>
										采购合同编号:
									</td>
									<td>
										<input type="text" id="signContractNum" name="signContractNum" class="text ui-widget-content ui-corner-all" value="${purchaseOrder.sign_contract_num}" readonly/>
									</td>
									<td></td>
									<td></td>
								</tr>
								</#if>
								<tr>
									<td colspan="6">
										<br/>
									</td>
								</tr>
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
								</#if>
					  			<tr>
									<td colspan="6">
										<br/>
									</td>
								</tr>
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
									<td>
										入库物资：
									</td>
									<td colspan="5">
										<input type="button" id="addStockEntry" value="增加入库条目" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
									</td>
								</tr>
								<tr>
									<td colspan="6">
										<table id="formTable3" border="0" width="840" style="overflow: hidden;border-collapse:collapse;">
											<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
											<tr>
												<td style="border:1px solid #1670eb;" width="150" align="center"><label for="name" class="edit_lbl">设备类别</label></td>
												<td style="border:1px solid #1670eb;" width="150" align="center"><label for="name" class="edit_lbl">设备名称</label></td>
												<td style="border:1px solid #1670eb;" width="150" align="center"><label for="name" class="edit_lbl">设备品牌</label></td>
												<td style="border:1px solid #1670eb;" width="150" align="center"><label for="name" class="edit_lbl">设备型号</label></td>
												<td style="border:1px solid #1670eb;" width="80" align="center"><label for="name" class="edit_lbl">采购单价</label></td>
												<td style="border:1px solid #1670eb;" width="80" align="center"><label for="name" class="edit_lbl">入库数量</label></td>
												<td style="border:1px solid #1670eb;" width="80" align="center"><label for="name" class="edit_lbl">操作</label></td>
												<td></td>
											</tr>
											<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
											<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
											<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
										</table>
									</td>
								</tr>
							    <tr>
									<td colspan="6">
										<input type="hidden" name="id" class="text ui-widget-content ui-corner-all"  value="${purchaseOrder.id?if_exists}"/>
										<input type="hidden" name="step" class="text ui-widget-content ui-corner-all"  value="${step}"/>
										<input type="button" id="save" value="确认入库" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
										&nbsp;&nbsp;
										<input type="button" id="sendBackButton" value="返回" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
										<script>
											$("#sendBackButton").button().click(function( event ) {
												history.go(-1);
											});
										</script>
									</td>
								</tr>
								<tr>
									<td colspan="6">
										<br/>
									</td>
								</tr>
								<tr>
									<td colspan="6">
										<br/>
									</td>
								</tr>
								<tr>
									<td colspan="6">
										<br/>
									</td>
								</tr>
								<tr>
									<td colspan="6">
										<br/>
									</td>
								</tr>
								<tr>
									<td colspan="6">
										<br/>
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
