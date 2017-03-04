<#include "../head.ftl" />
<script type="text/javascript">

	var moneyList = new Array();
	var amountElementIdList = new Array();
	
	$(function(){
		$("#tabs" ).tabs();
		$("#tabs").height($(window).height());
		$("#tabs > div").height($(window).height());
		
		$("#save").button().click(function( event ) {
	    	event.preventDefault();
	    	var money = 0;
	    	for(var index in amountElementIdList){
	    		if(amountElementIdList[index] != null && amountElementIdList[index] != ""){
	    			var amount = $("#"+amountElementIdList[index]).val();
	    			if(amount==null || amount==""){
	    				$("#"+amountElementIdList[index]).val(0);
	    				amount = 0;
	    			}
	    			if(amount - $("#_amount"+index).val() > 0){
	    				alert("申购数量不能大于最大申购数量!");
	    				return false;
	    			}
	    			if(amount>0){
	    				money += moneyList[index]*amount;
	    			}
	    		}
	    	}
	    	$("#money").val(money);
	    	if(money<=0){
	    		alert("申购物品数量不能都为“0”！");
	    		return false;
	    	}
	    	if(!confirm("是否确认提交？")){
    			return;
    		}
	    	$("#form1").submit();
	    });
		$("#pageloading").hide();
	  	var data = [ 
	  		${stockEntryListJson}
		];
	  	var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	       colNames: ["设备名称","单价","数量","备注","可申购数量","申购数量"],
	       colModel: [
	            {name: "name",width:150,sortable:false,align:"center"},
	            {name: "money",width:150,sortable:false,align:"center"},
	            {name: "amount",width:150,sortable:false,align:"center"},
                {name: "remark",width:150,sortable:false,align:"center"},
                {name: "",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
                	return rowObject['amount']-rowObject['buy_amount'];
	            }},
                {name: "",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
                	var html='';
                	moneyList[rowObject['id']] = rowObject['money'];
                	amountElementIdList[rowObject['id']] = "amount" + rowObject['id'];
                    html += '<input type="hidden" name="fundsApplyEntryId" style="width:60px;" value="' + rowObject['id'] + '"/>';
                    html += '<input id="amount' + rowObject['id'] + '" type="text" name="amount" style="width:60px;"/>';
                    html += '<input id="_amount' + rowObject['id'] + '" type="hidden" name="_amount" style="width:60px;" value="'+(rowObject['amount']-rowObject['buy_amount'])+'"/>';
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
		$("#form_content select").combobox();
		
		$("#type").combobox({
			select:function(){
				if($("#type").val()==3){
					//$("#rhcg").show(); 
					//$("#isJcDiv").show(); 
					//$("#isJcDiv0").show(); 
					//$("#isZcDiv").hide(); 
					//$("#isZcDiv0").hide(); 
					//if($("#isJc").val()==1){
					//	$("#jc_tr").show(); 
					//} else{
					//	$("#jc_tr").hide(); 
					//}
				} else if($("#type").val()==2) {
					//$("#rhcg").show(); 
					//$("#isZcDiv").show(); 
					//$("#isZcDiv0").show(); 
					//$("#isJcDiv").hide(); 
					//$("#isJcDiv0").hide(); 
					//$("#jc_tr").hide(); 
				} else{
					//$("#rhcg").hide(); 
					//$("#isZcDiv").hide(); 
					//$("#isZcDiv0").hide(); 
					//$("#isJcDiv").hide(); 
					//$("#isJcDiv0").hide(); 
					//$("#jc_tr").hide(); 
				}
			}
		});
		$("#signSupplierId").combobox();
		$("#isZc").combobox();
		$("#isJc").combobox({
			select:function(){
				if($("#isJc").val()==1){
					$("#jc_tr").show(); 
				} else{
					$("#jc_tr").hide(); 
				}
			}
		});
		$("#jc_tr").hide(); 
		$("#rhcg").hide(); 
		$("#isZcDiv").hide(); 
		$("#isZcDiv0").hide(); 
		$("#isJcDiv").hide(); 
		$("#isJcDiv0").hide(); 
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
			<div class="osx-modal-title">您现在所在的位置：物品采购->采购登记->经费列表->发起采购</div>
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
						<li><a href="#add" style="font-size: ;font-family: 'yakov_wryh';">新增</a></li>
					</ul>
					<div id="project" style="overflow:auto;">
					  	<form id="form1" name="form1" action="${gzUrl('wpcg/add.do')}" method="post">
					  		<table border="0" style="overflow: hidden;">
					  			<tr>
									<td width="90px">
										经费单名称:
									</td>
									<td width="220px">
										<input type="text" class="text ui-widget-content ui-corner-all"  value="${fundsApplyInfo.name?if_exists}" disabled/>
									</td>
									<td  width="90px">
										经费单编号:
									</td>
									<td width="220px">
										<input type="text" class="text ui-widget-content ui-corner-all" value="${fundsApplyInfo.num?if_exists}" disabled/>
									</td>
									<td width="90px">
										经费单金额:
									</td>
									<td>
										<input type="text" class="text ui-widget-content ui-corner-all" value="${fundsApplyInfo.money?if_exists}" disabled/>
									</td>
								</tr>
								<tr>
									<td>
										申请部门:
									</td>
									<td>
										<input type="text" class="text ui-widget-content ui-corner-all"  value="${fundsApplyInfo.applyDepartmentName?if_exists}" disabled/>
									</td>
									<td>
										经办人:
									</td>
									<td>
										<input type="text" class="text ui-widget-content ui-corner-all" value="${fundsApplyInfo.applyStaffName?if_exists}" disabled/>
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
										选择采购方式:
									</td>
									<td>
										<select name="type" id="type" class="text ui-widget-content" style="width:151px;">
									    	<option value="0">科室采购</option>
									    	<option value="2">政府采购</option>
									    	<option value="3">集中采购</option>
							           	</select>
									</td>
									<td>
                                    	<div id="isZcDiv">
                                    	采购方式:
                                    	</div>
							           	<div id="isJcDiv">
							           	采购方式:
							           	</div>
							        </td>
							     	<td>
                                    	<div id="isZcDiv0">
                                    	<select name="isZc" id="isZc" class="text ui-widget-content" style="width:151px;"
									    	<option value="1">进行政采</option>
							           	</select>
							           	</div>
                                    	<div id="isJcDiv0">
							           	<select name="isJc" id="isJc" class="text ui-widget-content" style="width:151px;">
									    	<option value="0">自行采购</option>
							           	</select>
							           	</div>
                                    </td>
                                    <td></td>
									<td></td>
                                </tr>
								<tr id="jc_tr">
									<td>
                                    	集采供应商:
                                    </td>
									<td>
                                    	<select id="signSupplierId" name="signSupplierId">
										    <#if supplierInfoList?exists>
										       <#list supplierInfoList as supplierInfo>
										           <option value="${supplierInfo.id}">${supplierInfo.name}</option>
										       </#list>
										    </#if>
										</select>
									</td>
									<td>
                                    	集采合同编号:
                                    </td>
									<td>
                                    	<input type="text" id="signContractNum" name="signContractNum" class="text ui-widget-content ui-corner-all" style="width:200px;"/>
									</td>
									<td></td>
									<td></td>
                                </tr>
							    <tr>
									<td colspan="6">
										<br/>
										<input type="hidden" id="money" name="money" class="text ui-widget-content ui-corner-all"  value="0"/>
										<input type="hidden" id="fundsApplyId" name="fundsApplyId" class="text ui-widget-content ui-corner-all"  value="${fundsApplyInfo.id?if_exists}"/>
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
