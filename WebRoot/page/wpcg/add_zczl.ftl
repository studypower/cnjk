<#include "../head.ftl" />
<script type="text/javascript">
	var amountList = new Array();
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
		 $("#addFile").button().click(function(event){
			var _len = $("#formTable2 tr").length;
			var newTr = "<tr id="+_len+">";
			newTr += "<td><input type=\"file\" name=\"cgFile\" id=\"file"+_len+"\" style=\"width:100px;\"/></td><td><input type=\"button\" id=\"dropFile"+_len+"\" value=\"移除\" style=\"font-size: 62.5%;font-family: 'yakov_wryh';width: 60px;\"/></td>";
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
			<div class="osx-modal-title">您现在所在的位置：物品采购->采购比价</div>
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
					  	<form id="form1" name="staffInfoForm" action="${gzUrl('wpcg/addZczl.do')}" enctype="multipart/form-data" method="post">
					  		<table border="0" width="960" style="overflow: hidden;">
					  			<tr>
									<td width="80px">
										经费单名称:
									</td>
									<td width="200px">
										<input type="text" class="text ui-widget-content ui-corner-all"  value="${purchaseOrder.fundsApplyName?if_exists}" disabled/>
									</td>
									<td width="80px">
										经费单编号:
									</td>
									<td width="200px">
										<input type="text" class="text ui-widget-content ui-corner-all" value="${purchaseOrder.fundsApplyNum?if_exists}" disabled/>
									</td>
									<td width="80px"></td>
									<td></td>
								</tr>
								<tr>
									<td>
										申&nbsp;请&nbsp;部&nbsp;门:
									</td>
									<td>
										<input type="text" class="text ui-widget-content ui-corner-all"  value="${purchaseOrder.applyDepartmentName?if_exists}" disabled/>
									</td>
									<td>
										经&nbsp;&nbsp;&nbsp;办&nbsp;&nbsp;&nbsp;人:
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
									<td>
										政采备注:
									</td>
									<td colspan="5">
										<textarea id="zcRemark" name="zcRemark" class="text ui-widget-content ui-corner-all" style="width: 520px;"></textarea>
									</td>
								</tr>
								<tr>
									<td>
										增加资料:
									</td>
									<td colspan="5">
										<input type="button" id="addFile" value="增加资料" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
									</td>
								</tr>
								<tr>
									<td>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
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
										<input type="hidden" id="id" name="id" class="text ui-widget-content ui-corner-all"  value="${purchaseOrder.id?if_exists}"/>
										<input type="hidden" id="step" name="step" class="text ui-widget-content ui-corner-all"  value="${step}"/>
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
