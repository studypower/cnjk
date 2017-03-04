<#include "../head.ftl" />
<script type="text/javascript">

	var purchaseOrderEntryIdList = new Array();
	var purchaseOrderEntryAmountList = new Array();
	var fileList = new Array();
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
	    	for(var purchaseOrderEntryId in purchaseOrderEntryIdList){
	    		if($("#purchaseOrderEntryAmount_"+purchaseOrderEntryId).val()==null || $("#purchaseOrderEntryAmount_"+purchaseOrderEntryId).val()=="" || isNaN($("#purchaseOrderEntryAmount_"+purchaseOrderEntryId).val())){
	    			$("#purchaseOrderEntryAmount_"+purchaseOrderEntryId).val(0);
	    		}
	    		if(purchaseOrderEntryAmountList[purchaseOrderEntryId]<$("#purchaseOrderEntryAmount_"+purchaseOrderEntryId).val()){
	    			alert("验收数量不能大于采购数量！");
	    			return;
	    		}
	    	}
	    	var countAmount = 0;
	    	for(var purchaseOrderEntryId in purchaseOrderEntryIdList){
	    		countAmount += $("#purchaseOrderEntryAmount_"+purchaseOrderEntryId).val();
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
                {name: "amount",width:80,sortable:false,align:"center",formatter:function(key,options,rowObject){
                	purchaseOrderEntryAmountList[rowObject['id']] = rowObject['amount'];
                	return key;
                }},
                {name: "",width:80,sortable:false,align:"center",formatter:function(key,options,rowObject){
               		return Math.round(rowObject['amount'] * rowObject['money']*1000)/1000;
                }},
                {name: "",width:80,sortable:false,align:"center",formatter:function(key,options,rowObject){
                	var html = "<input type='text' id='purchaseOrderEntryAmount_"+rowObject['id']+"' name='purchaseOrderEntryAmount' style='width:60px' />";
                	html += "<input type='hidden' id='purchaseOrderEntryId_"+rowObject['id']+"' name='purchaseOrderEntryId' value='"+rowObject['id']+"' />";
                	purchaseOrderEntryIdList[rowObject['id']] = rowObject['id'];
               		return html;
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
	        width: "100%", 
	        rowList:[10000],
			caption: "资产验收明细"
	    });
		for(var i=0;i<=data.length;i++){
	    	$("#dataGrid").jqGrid("addRowData",i+1,data[i]);
	    }
	    $("#dataGrid").navGrid("#pager",{edit:false,add:false,del:false,refresh:true,search:false});
	    
		$(document.body).css({"overflow-x":"auto","overflow-y":"auto"});
		$("#form_content select").combobox();
		$("#addFile").button().click(function(event){
			var _len = $("#formTable2 tr").length;
			var newTr = "<tr id="+_len+">";
			newTr += "<td><input type=\"file\" name=\"ysFile\" id=\"file"+_len+"\" style=\"width:100px;\"/></td><td><input type=\"button\" id=\"dropFile"+_len+"\" value=\"移除\" style=\"font-size: 62.5%;font-family: 'yakov_wryh';width: 60px;\"/></td>";
			newTr += "</tr>";
            $("#formTable2 tr:gt(0):eq("+(_len-3)+")").after(newTr);
            $("#file"+_len).customFileInput();
            fileList[_len] = _len;
            $("#dropFile"+_len).button().click(function( event ) {
            	fileList[_len] = null;
            	$("#formTable2 tr:gt(0):eq("+(_len-2)+")").html("");
            });
		});
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
			<div class="osx-modal-title">您现在所在的位置：物品采购->资产验收</div>
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
						<li><a href="#add" style="font-size: ;font-family: 'yakov_wryh';">资产验收</a></li>
					</ul>
					<div id="project" style="overflow:auto;">
					  	<form id="form1" name="form1" action="${gzUrl('wpcg/acceptance.do')}" enctype="multipart/form-data" method="post">
					  		<table border="0" width="960px" style="overflow: hidden;">
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
									<td>
											增加验收资料:
									</td>
									<td colspan="5">
											<input type="button" id="addFile" value="增加验收资料" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
									</td>
								</tr>
								<tr>
									<td></td>
									<td colspan="5">
										<table id="formTable2" border="0" width="600" style="overflow: hidden;">
											<tr><td width="400px"></td><td></td></tr>
											<tr><td width="400px"></td><td></td></tr>
											<tr><td width="400px"></td><td></td></tr>
											<tr><td width="400px"></td><td></td></tr>
										</table>
									</td>
								</tr>
								<tr>
									<td colspan="6">
										<br/>
										<input type="hidden" name="id" class="text ui-widget-content ui-corner-all"  value="${purchaseOrder.id?if_exists}"/>
										<input type="hidden" name="step" class="text ui-widget-content ui-corner-all"  value="${step}"/>
										<input type="button" id="save" value="确认验收" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
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
