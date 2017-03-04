<#include "../head.ftl" />
<script type="text/javascript">
	
	var fileList = new Array();
	var stockEntryList = new Array();
	var stockEntrySum = 0;
	
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
	    	if($("#nameId").val()!=-1){
	    		$("#name").val($("#nameId").val());
	    	}
	    	if($("#typeId").val()!=-1){
	    		$("#typeName").val($("#typeId").val());
	    	}
	        if($("#name").val()=="" || $("#name").val()==null){
    	      	alert("请填写经费名称");
    	      	return false;
    	   	}
	        if($("#typeName").val()=="" || $("#typeName").val()==null){
    	      	alert("请填写经费类别名称");
    	      	return false;
    	   	}
	    	if($("#money").val()==""){
	    	   alert("请填写申请金额");
	    	   return false;
	    	}
	    	if(isNaN($("#money").val())){
	    	   alert("申请金额必须为数字");
	    	   return false;
	    	}
	        if($("#workContent").val()==""){
	    	   alert("请填写工作内容");
	    	   return false;
	    	}
	    	if($("#remark").val()==""){
	    	   alert("请填写申请原因");
	    	   return false;
	    	}
	    	if($("#payDetails").val()==""){
	    	   alert("请填写支出明细");
	    	   return false;
	    	}
	    	for(var _index in fileList){
	    		if(fileList[_index]!=null && fileList[_index]!=""){
	    			if($("#file"+fileList[_index]).val()==null || $("#file"+fileList[_index]).val()==""){
	    				alert("申请资料不能为空，请移除或则选择资料！");
	    				return false;
	    			}
	    		}
	    	}
	    	for(var _index in stockEntryList){
	    		if(stockEntryList[_index]!=null && stockEntryList[_index]!=""){
	    			if($("#deviceName"+stockEntryList[_index]).val()==null || $("#deviceName"+stockEntryList[_index]).val()==""){
	    				alert("采购物品名称不能为空！");
	    				return false;
	    			}
	    			if($("#deviceMoney"+stockEntryList[_index]).val()==null || $("#deviceMoney"+stockEntryList[_index]).val()==""){
	    				alert("采购物品单价不能为空！");
	    				return false;
	    			}
	    			if($("#deviceAmount"+stockEntryList[_index]).val()==null || $("#deviceAmount"+stockEntryList[_index]).val()==""){
	    				alert("采购物品数量不能为空！");
	    				return false;
	    			}
	    			if($("#deviceRemark"+stockEntryList[_index]).val()==null || $("#deviceRemark"+stockEntryList[_index]).val()==""){
	    				alert("采购物品备注不能为空！");
	    				return false;
	    			}
	    		}
	    	}
	    	$("#form1").submit();
	    });
	    $("#file").customFileInput();
	    $("#form_content select").combobox({
    	});
	    $("#addFile").button().click(function(event){
			var _len = $("#formTable2 tr").length;
			var newTr = "<tr id="+_len+">";
			newTr += "<td><input type=\"file\" name=\"file\" id=\"file"+_len+"\" style=\"width:100px;\"/></td><td><input type=\"button\" id=\"dropFile"+_len+"\" value=\"移除\" style=\"font-size: 62.5%;font-family: 'yakov_wryh';width: 60px;\"/></td>";
			newTr += "</tr>";
            $("#formTable2 tr:gt(0):eq("+(_len-3)+")").after(newTr);
            $("#file"+_len).customFileInput();
            fileList[_len] = _len;
            $("#dropFile"+_len).button().click(function( event ) {
            	fileList[_len] = null;
            	$("#formTable2 tr:gt(0):eq("+(_len-2)+")").html("");
            });
		});
	    $("#addStockEntry").button().click(function(event){
			var _len = $("#formTable3 tr").length;
			var newTr = "<tr id="+_len+">";
			newTr += "<td style=\"border:1px solid #1670eb;\" align=\"center\"><input type=\"text\" id=\"deviceName"+_len+"\" name=\"deviceName\" class=\"text ui-widget-content ui-corner-all\" style=\"width:150px;\"/></td>";
			newTr += "<td style=\"border:1px solid #1670eb;\" align=\"center\"><input type=\"text\" id=\"deviceMoney"+_len+"\" name=\"deviceMoney\" class=\"text ui-widget-content ui-corner-all\" style=\"width:70px;\" onkeyup=\"_countMoney("+_len+")\"/></td>";
			newTr += "<td style=\"border:1px solid #1670eb;\" align=\"center\"><input type=\"text\" id=\"deviceAmount"+_len+"\" name=\"deviceAmount\" class=\"text ui-widget-content ui-corner-all\" style=\"width:70px;\" onkeyup=\"_countMoney("+_len+")\"/></td>";
			newTr += "<td style=\"border:1px solid #1670eb;\" align=\"center\"><input type=\"text\" id=\"deviceSumMoney"+_len+"\" name=\"\" class=\"text ui-widget-content ui-corner-all\" style=\"width:70px;\" readonly/></td>";
			newTr += "<td style=\"border:1px solid #1670eb;\" align=\"center\"><input type=\"text\" id=\"deviceRemark"+_len+"\" name=\"deviceRemark\" class=\"text ui-widget-content ui-corner-all\" style=\"width:230px;\"/></td>";
			newTr += "<td style=\"border:1px solid #1670eb;\" align=\"center\"><input type=\"button\" id=\"dropStockEntry"+_len+"\" value=\"移除\" style=\"font-size: 62.5%;font-family: 'yakov_wryh';width:70px;\"/></td><td></td>";
			newTr += "</tr>";
    		$("#formTable3 tr:gt(0):eq("+(_len-3)+")").after(newTr);
    		stockEntryList[_len] = _len;
    		stockEntrySum ++;
    		$("#dropStockEntry"+_len).button().click(function( event ) {
    			stockEntryList[_len] = null;
    			stockEntrySum --;
    			$("#formTable3 tr:gt(0):eq("+(_len-2)+")").html("");
    		});
		});
		$("#pageloading").hide();
	    $("#nameId").combobox({
			select:function() {
				if($("#nameId").val()==-1){
				  	$("#mctd").css("display","block"); 
				} else{
				  	$("#mctd").css("display","none"); 
				}
			}
		});
		
		$("#typeId").combobox({
			select:function() {
				if($("#typeId").val()==-1){
				  	$("#lbtd").css("display","block"); 
				} else{
				  	$("#lbtd").css("display","none"); 
				}
			}
		});
		
	});
	
	function _countMoney(_len){
		if($("#deviceMoney"+_len).val()!="" && $("#deviceAmount"+_len).val()!=""){
			if(!isNaN($("#deviceMoney"+_len).val()) && !isNaN($("#deviceAmount"+_len).val())){
				$("#deviceSumMoney"+_len).val(Math.round($("#deviceMoney"+_len).val()*$("#deviceAmount"+_len).val()*1000)/1000);
			}
		}
	}
	
	<#if result?exists>
	     <#if result==0> 
	          alert("添加失败");
	     <#elseif result==0> 
	          alert("添加失败,该编号已经存在");       
	     </#if>             
	</#if>
</script>
<body>
<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：经费管理->经费申请</div>
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
						<li><a href="#add" style="font-size: ;font-family: 'yakov_wryh';">增加</a></li>
					</ul>
					<div id="project" style="overflow:auto;">
						<form id="form1" name="form1" action="${gzUrl('jfgl/add.do')}" enctype="multipart/form-data" method="post">
							<table id="formTable1" border="0" width="960" style="overflow: hidden;">
						       	<tr>
								    <td>
								    	经费名称:
								    </td>
								   	<td>
									    <select name="nameId" id="nameId" class="text ui-widget-content" style="width:151px;">
                                            <#if fundsNameList?exists>
                                            	<#list fundsNameList as fundsName>
							   		            <option value="${fundsName.name}">${fundsName.name}</option>
							   		            </#list> 
							   		        </#if>
							   		        <option value="-1">自填名称</option>  
							           </select>
									</td>
									<td colspan="2">
										<div id="mctd" style="disPlay:none">
							           		<input type="text" id="name" name="name" class="text ui-widget-content ui-corner-all" style="width:320px;"/>
							           	</div>
									</td>
			                      	<td></td>
			                      	<td></td>
								</tr>
								<tr>
								    <td>
											经&nbsp;费&nbsp;类&nbsp;别:
									</td>
								   	<td>
											<select name="typeId" id="typeId" class="text ui-widget-content">
	                                       		<#if dataFundsTypeList?exists>
	                                          	<#list dataFundsTypeList as dataFundsType>
						   		                <option value="${dataFundsType.name}">${dataFundsType.name}</option>
						   		              	</#list> 
						   		           		</#if>
						   		           		<option value="-1">自填类别</option>
							           		</select>
									</td>
									<td colspan="2">
							           <div id="lbtd" style="disPlay:none">
							           		<input type="text" id="typeName" name="typeName" class="text ui-widget-content ui-corner-all" style="width:320px;"/>
							           </div>
									</td>
			                      	<td></td>
								   	<td></td>
								</tr>
						       	<tr>
									<td width="120px">
										申&nbsp;请&nbsp;科&nbsp;室:
									</td>
									<td width="200px">
										<input type="text"  class="text ui-widget-content ui-corner-all"  value="${Session.currentUser.departmentName?if_exists}" disabled/>
									</td>
									<td width="120px">
										经&nbsp;&nbsp;&nbsp;办&nbsp;&nbsp;&nbsp;人:
									</td>
									<td width="200px">
										<input type="text"  class="text ui-widget-content ui-corner-all"  value="${Session.currentUser.staffName?if_exists}" disabled/>
									</td>
									<td width="120px"></td>
									<td width="200px"></td>
								</tr>
								<tr>
			                      	<td>
										申&nbsp;请&nbsp;金&nbsp;额:
									</td>
								   	<td>
										<input type="text" id="money" name="money" class="text ui-widget-content ui-corner-all"/>
									</td>
									<td>质管科审批:</td>
								   	<td>
								   		<select id="isSyscg" name="isSyscg">
								   			<option value="0">否</option>
								   			<option value="1">是</option>
								   		</select>
								   	</td>
									<td></td>
								   	<td></td>
								</tr>
							    <tr>
                                     <td valign="top">
										工&nbsp;作&nbsp;内&nbsp;容:
									</td>
									<td colspan="5">
					                	<textarea id="workContent" class="text ui-widget-content ui-corner-all" style="width: 700px;height:100px;" name="workContent"></textarea>
					                </td>
                                </tr>
								<tr>
									<td valign="top">
										申&nbsp;请&nbsp;原&nbsp;因:
									</td>
									<td colspan="5">
					                	<textarea id="remark" class="text ui-widget-content ui-corner-all" style="width: 700px;height:100px;" name="remark"></textarea>
					                </td>
                                </tr>
                                <tr>
									<td valign="top">
										支&nbsp;出&nbsp;说&nbsp;明:
									</td>
									<td colspan="5">
					                	<textarea id="payDetails" class="text ui-widget-content ui-corner-all" style="width: 700px;height:100px;" name="payDetails"></textarea>
					                </td>
                                </tr>
								<tr>
									<td>
										申&nbsp;请&nbsp;资&nbsp;料:
									</td>	
									<td colspan="5">
										<input type="button" id="addFile" value="增加申请资料" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
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
									<td>
										采&nbsp;购&nbsp;条&nbsp;目:
									</td>
									<td colspan="5">
										<input type="button" id="addStockEntry" value="增加采购条目" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
									</td>
								</tr>
								<tr>
									<td>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
									<td colspan="5">
										<table id="formTable3" border="0" width="800" style="overflow: hidden;border-collapse:collapse;">
											<tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
											<tr>
												<td style="border:1px solid #1670eb;" align="center" width="160"><label for="" class="edit_lbl">设备名称</label></td>
												<td style="border:1px solid #1670eb;" align="center" width="80"><label for="" class="edit_lbl">单价</label></td>
												<td style="border:1px solid #1670eb;" align="center" width="80"><label for="" class="edit_lbl">数量</label></td>
												<td style="border:1px solid #1670eb;" align="center" width="80"><label for="" class="edit_lbl">总价</label></td>
												<td style="border:1px solid #1670eb;" align="center" width="240"><label for="" class="edit_lbl">备注</label></td>
												<td style="border:1px solid #1670eb;" align="center" width="80"><label for="" class="edit_lbl">操作</label></td>
												<td></td>
											</tr>
											<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
											<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
											<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
										</table>
									</td>
								</tr>
								<tr>
									<td colspan="6">
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
