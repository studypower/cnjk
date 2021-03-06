<#include "../head.ftl" />
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
	    $("#file").customFileInput();
		$("#pageloading").hide();
		$("#downBtn").button().click(function( event ) {
		   window.open('${gzUrl(fundsApplyInfo.file_url?if_exists)}');
	    });
	  	var data = [ 
	  		${fundsApplyInfo.approvalList?if_exists}
		];
	  	var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: ["审批流程","经办人","审批结论","记录时间","审批备注","调研资料"],
	        colModel: [
	            {name: "step",width:120,sortable:false,align:"center",formatter:function(key,options,rowObject){
	                var html='';
	                if(key==0){
	            		html += '<a href="javascript:info('+rowObject['id']+')" title="递交申请">递交申请</a>';
	            	} else if(key==1){
	            		html += '<a href="javascript:info('+rowObject['id']+')" title="科室审批">科室审批</a>';
	            	} else if(key==2){
	            		html += '<a href="javascript:info('+rowObject['id']+')" title="质管审批">质管审批</a>';
	            	} else if(key==3){
	            		html += '<a href="javascript:info('+rowObject['id']+')" title="财务审批">财务审批</a>';
	                } else if(key==4){ 
	            		html += '<a href="javascript:info('+rowObject['id']+')" title="分管审批">分管审批</a>';
	                } else if(key==5){
	            		html += '<a href="javascript:info('+rowObject['id']+')" title="中心审批 ">中心审批 </a>';
	                } else if(key==6){
	                    html += '<a href="javascript:info('+rowObject['id']+')" title="三重一大审批">三重一大审批</a>';
	                }
	                return html;
	            }},
	            {name: "staff_name",width:80,sortable:false,align:"center"},
	            {name: "result",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	                if(key==1){
	            		return "审批通过";
	            	} else if(key==-1){
	            		return "退回修改";
	            	} else{
	            		if(rowObject['step']==0){
	            			return "";
	            		}
	            	    return "未审批";
	            	}	
	            }},
	            {name: "approval_time",width:150,sortable:false,align:"center"},
	            {name: "remark",width:200,sortable:false,align:"center"},
	            {name: "file_url",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	                if(key!=null && key!=""){
	            		return "<a href='${gzUrl('')}" + key + "'>" + rowObject['file_name'] + "</a>";
	            	}else{
	            		return "";
	            	}	
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
	        width: '100%', 
	        rowList:[10000],
			caption: "审批流程明细"
	    });
		$("#dataGrid").navGrid("#pager",{edit:false,add:false,del:false,refresh:true,search:false});
		for(var i=0;i<=data.length;i++){
	    	$("#dataGrid").jqGrid("addRowData",i+1,data[i]);
	    }
	    $(window).resize(function(){
	    	var $window=$(window);
			$("#dataGrid").setGridHeight("100%");
			$("#dataGrid").setGridWidth('100%');
		});
		$("#form_content select").combobox();
	});
	
	function info(id) {
    	$("#dialog").dialog({
    		 height: 500,
    		 width: 900,
    		 modal: true,
    		 resizable: false,
    		 close: function( event, ui ) {
    			 $("#dialog_iframe").css("display","none");
    		 },
    		 buttons:[{
    			 text:"关闭",
    			 click:function(){
    				 $(this).dialog("close");
    			 }
    		 }]
    	});
    	$("#dialog_iframe").css("display","block");
    	$("#dialog_iframe").attr("src","${gzUrl('jfgl/log/info.do?approvalId=')}" + id + "&randomNum=" + Math.random());
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
			<div class="osx-modal-title">您现在所在的位置：<#if step?exists><#if step==0>经费管理->经费申请<#elseif step==1>经费管理->科室审批<#elseif step==2>经费管理->质管科审批<#elseif step==3>经费管理->财务审批<#elseif step==4>经费管理->分管审批<#elseif step==5>经费管理->中心审批<#elseif step==6>经费管理->"三重一大"审批</#if></#if></div>
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
						<li><a href="#add" style="font-size: ;font-family: 'yakov_wryh';">详情</a></li>
					</ul>
					<div id="project" style="overflow:auto;">
					  	<form id="form1" name="form1" action="${gzUrl('jfgl/update.do')}" enctype="multipart/form-data" method="post">
							<table border="0" width="960" style="overflow: hidden;">
								<tr>
								   	<td>
										经费名称:
									</td>
									<td>
										<input type="text" id="name" name="name" class="text ui-widget-content ui-corner-all" value="${fundsApplyInfo.name?if_exists}"/>
									</td>
									<td>
										经&nbsp;费&nbsp;类&nbsp;别:
									</td>
									<td>
										<input type="text" id="typeName" name="typeName" class="text ui-widget-content ui-corner-all" value="${fundsApplyInfo.type_name?if_exists}" readOnly/>
									</td>
									<td>
										编&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:
									</td>
									<td>
										<input type="text" id="num" name="num" class="text ui-widget-content ui-corner-all" value="${fundsApplyInfo.num?if_exists}" readOnly/>
									</td>
								</tr>
							   <tr>
									<td width="120px">
										申&nbsp;请&nbsp;科&nbsp;室:
									</td>
									<td width="200px">
										<input type="text"  class="text ui-widget-content ui-corner-all"  value="${fundsApplyInfo.applyDepartmentName?if_exists}" readOnly/>
										<input type="hidden" name="applyDepartmentId" class="text ui-widget-content ui-corner-all"  value="${fundsApplyInfo.apply_department_id?if_exists}" readOnly/>
									</td>
									<td width="120px">
										经&nbsp;&nbsp;&nbsp;办&nbsp;&nbsp;&nbsp;人:
									</td>
									<td width="200px">
										<input type="text" class="text ui-widget-content ui-corner-all"  value="${fundsApplyInfo.applyStaffName?if_exists}" readOnly/>
										<input type="hidden" name="applyStaffId" class="text ui-widget-content ui-corner-all"  value="${fundsApplyInfo.apply_staff_id?if_exists}"/>
									</td>
									<td width="120px">
										申&nbsp;请&nbsp;时&nbsp;间:
									</td>
									<td width="200px">
						                <input type="text" id="applyTime" name="applyTime" class="text ui-widget-content ui-corner-all"  value="${fundsApplyInfo.apply_time?if_exists}" readOnly/>
									</td>
								</tr>
								<tr>
									<td>
										申&nbsp;请&nbsp;金&nbsp;额:
									</td>
									<td>
										<input type="text" id="money" name="money" class="text ui-widget-content ui-corner-all" value="${fundsApplyInfo.money?if_exists?c}"/>
									</td>
									<td>质管科审批:</td>
								   	<td>
								   		<#if fundsApplyInfo.is_syscg==0>
							   			<input type="text" class="text ui-widget-content ui-corner-all" value="否"/>
							   			<input type="hidden" id="isSyscg" name="isSyscg" class="text ui-widget-content ui-corner-all" value="0"/>
							   			</#if>
							   			<#if fundsApplyInfo.is_syscg==1>
							   			<input type="text" class="text ui-widget-content ui-corner-all" value="是"/>
							   			<input type="hidden" id="isSyscg" name="isSyscg" class="text ui-widget-content ui-corner-all" value="1"/>
							   			</#if>
								   	</td>
								   	<td></td>
								   	<td></td>
								</tr>
							    <tr>
									<td valign="top">
										工&nbsp;作&nbsp;内&nbsp;容:
									</td>
									<td colspan="5">
					                	<textarea id="workContent" class="text ui-widget-content ui-corner-all" style="width: 700px;height:100px;" name="workContent">${fundsApplyInfo.work_content?if_exists}</textarea>	
					                </td>
                                </tr>
								<tr>
									<td valign="top">
										申&nbsp;请&nbsp;原&nbsp;因:
									</td>
									<td colspan="5">
					                	<textarea id="remark" name="remark" class="text ui-widget-content ui-corner-all" style="width: 700px;height:100px;">${fundsApplyInfo.remark?if_exists}</textarea>
					                </td>
                                </tr>
                                <tr>
									<td valign="top">
										支&nbsp;出&nbsp;说&nbsp;明:
									</td>
									<td colspan="5">
					        			<textarea id="payDetails" class="text ui-widget-content ui-corner-all" style="width: 700px;height:100px;" name="payDetails">${fundsApplyInfo.pay_details?if_exists}</textarea>        	
					                </td>
                                </tr>
                                <#if fundsApplyInfo.dataFileInfoList?exists && fundsApplyInfo.dataFileInfoList.size()!=0>
								<tr>
									<td valign="top">申&nbsp;请&nbsp;资&nbsp;料:</td>
									<td colspan="5">
										<table id="formTable2" border="0" style="overflow: hidden;">
											<#list fundsApplyInfo.dataFileInfoList as dataFileInfo>
			                                <tr id="_dataFileInfo${dataFileInfo_index}">
		                                     	<td>
		                                     		<input type="text" name="fileName" class="text ui-widget-content ui-corner-all" style="width:300px;" value="${dataFileInfo.file_name}"/>
		                                     		<input type="hidden" name="fileUrl" class="text ui-widget-content ui-corner-all" value="${dataFileInfo.file_url}"/>
		                                     		<input type="button" id="_openDataFileInfo${dataFileInfo_index}" value="查看" style="font-size: ;font-family: 'yakov_wryh';width: 60px;"/>&nbsp;&nbsp;
		                                     	</td>
		                                     	<td></td>
			                                </tr>
			                                <script>
												$("#_openDataFileInfo${dataFileInfo_index}").button().click(function( event ) {
													window.open("${gzUrl(dataFileInfo.file_url)}");
												});
			                                </script>
			                                </#list>
											<tr><td></td><td></td></tr>
											<tr><td></td><td></td></tr>
											<tr><td></td><td></td></tr>
											<tr><td></td><td></td></tr>
										</table>
									</td>
								</tr>
								</#if>
								<tr>
									<td valign="top">
										采&nbsp;购&nbsp;明&nbsp;细：
									</td>
									<td colspan="5">
										<table id="formTable3" border="0" width="800" style="overflow: hidden;border-collapse:collapse;">
											<tr><td></td><td></td><td></td><td></td><td></td></tr>
											<tr>
												<td style="border:1px solid #1670eb;" align="center" width="160"><label for="" class="edit_lbl">设备名称</label></td>
												<td style="border:1px solid #1670eb;" align="center" width="80"><label for="" class="edit_lbl">单价</label></td>
												<td style="border:1px solid #1670eb;" align="center" width="80"><label for="" class="edit_lbl">数量</label></td>
												<td style="border:1px solid #1670eb;" align="center" width="80"><label for="" class="edit_lbl">总价</label></td>
												<td style="border:1px solid #1670eb;" align="center" width="240"><label for="" class="edit_lbl">备注</label></td>
												<td></td>
											</tr>
											<#list fundsApplyInfo.stockEntryList as stockEntry>
			                                <tr id="_stockEntry${stockEntry_index}">
		                                     	<td style="border:1px solid #1670eb;" align="center"><input type="text" id="deviceName-${stockEntry_index}" name="deviceName" class="text ui-widget-content ui-corner-all" value="${stockEntry.name}" style="width:150px"/></td>
		                                     	<td style="border:1px solid #1670eb;" align="center"><input type="text" id="deviceMoney-${stockEntry_index}" name="deviceMoney" class="text ui-widget-content ui-corner-all" value="${stockEntry.money.toString()?html}" style="width:70px"/></td>
		                                     	<td style="border:1px solid #1670eb;" align="center"><input type="text" id="deviceAmount-${stockEntry_index}" name="deviceAmount" class="text ui-widget-content ui-corner-all" value="${stockEntry.amount}" style="width:70px"/></td>
		                                     	<td style="border:1px solid #1670eb;" align="center"><script> var money_${stockEntry_index}=${stockEntry.money.toString()?html};var amount_${stockEntry_index}=${stockEntry.amount.toString()?html};document.write(Math.round(money_${stockEntry_index}*amount_${stockEntry_index}*1000)/1000);</script></td>
		                                     	<td style="border:1px solid #1670eb;" align="center"><input type="text" id="deviceRemark-${stockEntry_index}" name="deviceRemark" class="text ui-widget-content ui-corner-all" value="${stockEntry.remark}" style="width:230px"/></td>
		                                     	<td></td>
			                                </tr>
			                                </#list>
											<tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
											<tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
											<tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
										</table>
									</td>
								</tr>
                                <tr>
									<td colspan="6">
									    <input type="hidden" name="id" value="${fundsApplyInfo.id?if_exists}"/>
									    <input type="hidden" name="step" value="${step?if_exists}"/>
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
						<table id="dataGrid"></table>
						<div id="pager"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="dialog" title="经费申请单日志" style="padding: 0px;">
		<iframe id="dialog_iframe" name="dialog_iframe" src="" frameborder="0" width="100%" height="100%" style="overflow: hidden;display: none;"></iframe>
	</div>
</body>
<#include "../foot.ftl" />
