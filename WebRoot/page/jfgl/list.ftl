<#include "../head.ftl" />
<script type="text/javascript">
    var step = 0;
    <#if step?exists>
    step = ${step}; 
    </#if>
	$(function(){
		var name_1000 = $("#name").val();
     	if($("#name1").val()!="" && $("#name1").val()!=null){
     		name_1000 = $("#name1").val();
     	}
		var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: ["经费名称","经费类别","金额(元)","申请科室","经办人","申请时间","流程状态说明","操作"],
	        colModel: [
	            {name: "name",width:"180",sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html = "";
	            	if((rowObject['step']>1 && ${step}==1 && rowObject['status']==-1) || (rowObject['step']==1 && ${step}==0 && rowObject['status']==-1)){
	            		html += '<a href="${gzUrl('jfgl/info.do?step=${step?if_exists}&id=')}' + rowObject['id'] + '" title="'+ rowObject['name'] +'"><font color="red">' + rowObject['name'] + '</font></a>';		
	            	} else if(rowObject['step']!=${step}-1 && rowObject['status']==-1){
	            		html += '<a href="${gzUrl('jfgl/info.do?step=${step?if_exists}&id=')}' + rowObject['id'] + '" title="'+ rowObject['name'] +'"><font color="#A52A2A">' + rowObject['name'] + '</font></a>';		
	            	} else if(rowObject['step']==${step} && rowObject['status']==0){
	            		html += '<a href="${gzUrl('jfgl/info.do?step=${step?if_exists}&id=')}' + rowObject['id'] + '" title="'+ rowObject['name'] +'"><font color="red">' + rowObject['name'] + '</font></a>';		
	            	} else if((rowObject['step']==6 || (rowObject['step']==5 && rowObject['money']<30000)) && rowObject['status']==1){
	            		html += '<a href="${gzUrl('jfgl/info.do?step=${step?if_exists}&id=')}' + rowObject['id'] + '" title="'+ rowObject['name'] +'"><font color="#0000FF">' + rowObject['name'] + '</font></a>';		
	            	} else{
	            		html += '<a href="${gzUrl('jfgl/info.do?step=${step?if_exists}&id=')}' + rowObject['id'] + '" title="'+ rowObject['name'] +'">' + rowObject['name'] + '</a>';	
	            	}
	            	return html;
	            }},
	             {name: "type_name",width:120,sortable:false,align:"center",formatter:function(key,options,rowObject){
	             	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html = "";
	            	if((rowObject['step']>1 && ${step}==1 && rowObject['status']==-1) || (rowObject['step']==1 && ${step}==0 && rowObject['status']==-1)){
	            		html += "<font color='red'>";	
	            	} else if(rowObject['step']!=${step}-1 && rowObject['status']==-1){
	            		html += "<font color='#A52A2A'>";	
	            	} else if(rowObject['step']==${step} && rowObject['status']==0){
	            		html += "<font color='red'>";	
	            	} else if((rowObject['step']==6 || (rowObject['step']==5 && rowObject['money']<30000)) && rowObject['status']==1){
	            		html += "<font color='#0000FF'>";	
	            	} else{
	            		html += "<font>";
	            	}
	            	html += key;
	            	html += "</font>";
	            	return html;
	            }},
	            {name: "money",width:80,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html = "";
	            	if((rowObject['step']>1 && ${step}==1 && rowObject['status']==-1) || (rowObject['step']==1 && ${step}==0 && rowObject['status']==-1)){
	            		html += "<font color='red'>";	
	            	} else if(rowObject['step']!=${step}-1 && rowObject['status']==-1){
	            		html += "<font color='#A52A2A'>";	
	            	} else if(rowObject['step']==${step} && rowObject['status']==0){
	            		html += "<font color='red'>";	
	            	} else if((rowObject['step']==6 || (rowObject['step']==5 && rowObject['money']<30000)) && rowObject['status']==1){
	            		html += "<font color='#0000FF'>";	
	            	} else{
	            		html += "<font>";
	            	}
	            	html += key;
	            	html += "</font>";
	            	return html;
	            }},
	            {name: "applyDepartmentName",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	             	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html = "";
	            	if((rowObject['step']>1 && ${step}==1 && rowObject['status']==-1) || (rowObject['step']==1 && ${step}==0 && rowObject['status']==-1)){
	            		html += "<font color='red'>";	
	            	} else if(${step}>1 && rowObject['step']>1 && rowObject['status']==-1){
	            		html += "<font color='#A52A2A'>";	
	            	} else if(rowObject['step']==${step} && rowObject['status']==0){
	            		html += "<font color='red'>";	
	            	} else if((rowObject['step']==6 || (rowObject['step']==5 && rowObject['money']<30000)) && rowObject['status']==1){
	            		html += "<font color='#0000FF'>";	
	            	} else{
	            		html += "<font>";
	            	}
	            	html += key;
	            	html += "</font>";
	            	return html;
	            }},
	            {name: "applyStaffName",width:60,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html = "";
	            	if((rowObject['step']>1 && ${step}==1 && rowObject['status']==-1) || (rowObject['step']==1 && ${step}==0 && rowObject['status']==-1)){
	            		html += "<font color='red'>";	
	            	} else if(rowObject['step']!=${step}-1 && rowObject['status']==-1){
	            		html += "<font color='#A52A2A'>";	
	            	} else if(rowObject['step']==${step} && rowObject['status']==0){
	            		html += "<font color='red'>";	
	            	} else if((rowObject['step']==6 || (rowObject['step']==5 && rowObject['money']<30000)) && rowObject['status']==1){
	            		html += "<font color='#0000FF'>";	
	            	} else{
	            		html += "<font>";
	            	}
	            	html += key;
	            	html += "</font>";
	            	return html;
	            }},
	            {name: "apply_time",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html = "";
	            	if((rowObject['step']>1 && ${step}==1 && rowObject['status']==-1) || (rowObject['step']==1 && ${step}==0 && rowObject['status']==-1)){
	            		html += "<font color='red'>";	
	            	} else if(rowObject['step']!=${step}-1 && rowObject['status']==-1){
	            		html += "<font color='#A52A2A'>";	
	            	} else if(rowObject['step']==${step} && rowObject['status']==0){
	            		html += "<font color='red'>";	
	            	} else if((rowObject['step']==6 || (rowObject['step']==5 && rowObject['money']<30000)) && rowObject['status']==1){
	            		html += "<font color='#0000FF'>";	
	            	} else{
	            		html += "<font>";
	            	}
	            	html += key;
	            	html += "</font>";
	            	return html;
	            }},
	            {name: "",width:160,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines']){
	            		return "";
	            	}
	            	var html = "";
	            	if((rowObject['step']>1 && ${step}==1 && rowObject['status']==-1) || (rowObject['step']==1 && ${step}==0 && rowObject['status']==-1)){
	            		html += "<font color='red'>";	
	            	} else if(rowObject['step']!=${step}-1 && rowObject['status']==-1){
	            		html += "<font color='#A52A2A'>";	
	            	} else if(rowObject['step']==${step} && rowObject['status']==0){
	            		html += "<font color='red'>";	
	            	} else if((rowObject['step']==6 || (rowObject['step']==5 && rowObject['money']<30000)) && rowObject['status']==1){
	            		html += "<font color='#0000FF'>";	
	            	} else{
	            		html += "<font>";
	            	}
	            	if(rowObject['step']==0){
	            		html += "经费申请";
	            	} else if(rowObject['step']==1){
	            		html += "科室审批";
	            	} else if(rowObject['step']==2){
	            		html += "质管科审批"; 
	                } else if(rowObject['step']==3){
	            		html += "财务审批"; 
	                } else if(rowObject['step']==4){
	            		html += "分管审批"; 
	                } else if(rowObject['step']==5){
	            		html += "中心审批"; 
	                } else if(rowObject['step']==6){
	            		html += "'三重一大'"; 
	                }
	                if(rowObject['status']==1){
	            		html += "-->通过";
	            	} else if(rowObject['status']==-1){
	            		html += "-->被驳回";
	            	} else if(rowObject['status']==0){
	            	    html += "-->待处理";
	            	}
	            	html += "</font>";
	            	return html;
	            }},
	            {name: "",width:120,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines']){
	            		return "";
	            	}
	            	var html='';
	            	html += '<a href="${gzUrl('jfgl/info.do?step=${step?if_exists}&id=')}' + rowObject['id'] + '" title="详情">详情</a>';		
	              	<#if step?exists && step==0 && isDisplay('2_1_2')>
	               	if(rowObject['step']==0 || (rowObject['step']-${step}==1 && rowObject['status']==-1)){
	            	  	html += '&nbsp;&nbsp;<a href="${gzUrl('jfgl/initUpdate.do?step=${step?if_exists}&id=')}' + rowObject['id'] + '" title="修改">修改</a>';
	                }
	              	</#if>
                    <#if step?exists && step==1 && isDisplay('2_2_3')>
					  if((rowObject['step']==${step} && rowObject['status']==0) || (rowObject['step']-${step}>=1 && rowObject['status']==-1)){
                	   	html += '&nbsp;&nbsp;<a href="${gzUrl('jfgl/initApproval.do?step=${step?if_exists}&id=')}' + rowObject['id'] + '" title="审批">审批</a>';
                	  }
                	 <#elseif step?exists && step==2 && isDisplay('2_9_2')>
                	   if((rowObject['step']==${step} && rowObject['status']==0)){
                	   	html += '&nbsp;&nbsp;<a href="${gzUrl('jfgl/initApproval.do?step=${step?if_exists}&id=')}' + rowObject['id'] + '" title="审批">审批</a>';
                	  }
                	<#elseif step?exists && step==3 && isDisplay('2_3_3')>
                	   if((rowObject['step']==${step} && rowObject['status']==0)){
                	   	html += '&nbsp;&nbsp;<a href="${gzUrl('jfgl/initApproval.do?step=${step?if_exists}&id=')}' + rowObject['id'] + '" title="审批">审批</a>';
                	  }
                	<#elseif step?exists && step==4 && isDisplay('2_4_3')>
                	   if((rowObject['step']==${step} && rowObject['status']==0)){
                	   	html += '&nbsp;&nbsp;<a href="${gzUrl('jfgl/initApproval.do?step=${step?if_exists}&id=')}' + rowObject['id'] + '" title="审批">审批</a>';
                	  }
                    <#elseif step?exists && step==5 && isDisplay('2_5_3')>
                	   if((rowObject['step']==${step} && rowObject['status']==0)){
                	   	html += '&nbsp;&nbsp;<a href="${gzUrl('jfgl/initApproval.do?step=${step?if_exists}&id=')}' + rowObject['id'] + '" title="审批">审批</a>';
                	  }
                	<#elseif step?exists && step==6 && isDisplay('2_6_3')>
                	   if((rowObject['step']==${step} && rowObject['status']==0)){
                	   	html += '&nbsp;&nbsp;<a href="${gzUrl('jfgl/initApproval.do?step=${step?if_exists}&id=')}' + rowObject['id'] + '" title="审批">审批</a>';
                	  }    	       
                	</#if>
	              	<#if !isDisplay('2_2_3')>
	              	if(rowObject['step']==1 && rowObject['status']==0 && rowObject['apply_staff_id']==${Session.currentUser.staffId}){
	              		html += '&nbsp;&nbsp;<a href="javascript:{if(confirm(\'确定要删除数据吗\'))window.location=\'${gzUrl('jfgl/del.do?id=')}' + rowObject['id'] + '\';}" title="删除">删除</a>';
	              	}else if(rowObject['status']==-1){//被驳回的数据可以删除
	              		html += '&nbsp;&nbsp;<a href="javascript:{if(confirm(\'确定要删除数据吗\'))window.location=\'${gzUrl('jfgl/del.do?id=')}' + rowObject['id'] + '\';}" title="删除">删除</a>';
	              	}
	              	<#else>
	              	if(rowObject['step']==1 && rowObject['status']==0){
	              		html += '&nbsp;&nbsp;<a href="javascript:{if(confirm(\'确定要删除数据吗\'))window.location=\'${gzUrl('jfgl/del.do?id=')}' + rowObject['id'] + '\';}" title="删除">删除</a>';
	              	}else if(rowObject['status']==-1){//被驳回的数据可以删除
	              		html += '&nbsp;&nbsp;<a href="javascript:{if(confirm(\'确定要删除数据吗\'))window.location=\'${gzUrl('jfgl/del.do?id=')}' + rowObject['id'] + '\';}" title="删除">删除</a>';
	              	}
	              	</#if>
                	return html;
	            }}
	        ],
	        datatype: "json", //将这里改为使用JSON数据  
	        url:'${gzUrl('jfgl/list.do?step=${step?if_exists}')}', //这是Action的请求地址  
	        mtype: 'POST',
	        pager: $("#pager"),
	        rowNum:20,
	        shrinkToFit:false,
	        rownumbers:false,
	        hidegrid:false,
	        multiselect: false,
	        viewrecords:true,
	        height:"100%",
	        width:"100%", 
	        rowList:[20,40,60],
	        postData:{
	        	'status':$("#status").val(),
	        	 'startTime':$("#startTime").val()
	        },
	        loadComplete: function(){
	        	var rowNum = $("#dataGrid").getGridParam("rowNum");
	        	var records = $("#dataGrid").getGridParam("records");
	        	var page = $("#dataGrid").getGridParam("page");
	        	for(var i=0;i<(page * rowNum - records);i++){
	        		$("#dataGrid").jqGrid("addRowData",i+1,{"isBlanklines":true});
	        	}
	        },
			caption: "经费申请列表"
	    });
		$("#dataGrid").navGrid("#pager",{edit:false,add:false,del:false,refresh:true,search:false});
		$(document.body).css({"overflow-x":"auto","overflow-y":"auto"});
	    $(window).resize(function(){
	    	var $window=$(window);
			$("#dataGrid").setGridHeight("100%");
			$("#dataGrid").setGridWidth("100%");
		});
	    $("#create").button().click(function( event ) {
	    	event.preventDefault();
	    	window.location.href="${gzUrl('jfgl/initAdd.do')}";
	    });
	     $("#search").button().click(function( event ) {
	     	var name_1001 = $("#name").val();
	     	if($("#name1").val()!="" && $("#name1").val()!=null){
	     		name_1001 = $("#name1").val();
	     	}
	    	event.preventDefault();
	    	jQuery("#dataGrid").jqGrid('setGridParam',{  
                postData:{
                	'name':name_1001,
                	'typeName':$("#typeName").val(),
                	'step':$("#step").val(),
                	'status':$("#status").val(),
                	'type':$("#type").val(),
                	'num':$("#num").val(),
                	'money':$("#money").val(),
                	'applyDepartmentId':$("#applyDepartmentId").val(),
                	'applyStaffId':$("#applyStaffId").val(),
                    'startTime':$("#startTime").val(),
                	'endTime':$("#endTime").val()
                }  
            }).trigger('reloadGrid');    
	    });
	    $("#startTime").datepicker({
			dateFormat: "yy-mm-dd"
		});
		$("#endTime").datepicker({
			dateFormat: "yy-mm-dd"
		});
	    $("#typeName").combobox();
	    $("#applyDepartmentId").combobox();
	    $("#applyStaffId").combobox();
	    $("#status").combobox();
	    $("#name").combobox();
		$("#pageloading").hide();
	    $("#applyDepartmentId").combobox({
		   select:function() {
		      $.get("${gzUrl('rygl/jbxx/ajaxList.do')}?departmentId="+ $("#applyDepartmentId").val()+"&timestamp="+Date.parse(new Date()), null, callback);
		  }
	   });
	});
	
		function callback(data){
				var staffList = eval("("+data+")");
			    var applyStaffSelect = document.getElementById("applyStaffId");
			    var staffCount = applyStaffSelect.options.length;
			    for(var i = 0; i<staffCount; i++){
			      applyStaffSelect.options.remove(0);//每次删除下标都是0
			   	}
			   	var option = document.createElement("OPTION");
			   	option.value =0;  
				option.innerHTML =""; 
				 applyStaffSelect.appendChild(option);  
		 		for(var i=0; i<staffList.length; i++){
				    var option = document.createElement("OPTION"); 
				    option.value = staffList[i].id;  
				    option.innerHTML = staffList[i].name; 
				    applyStaffSelect.appendChild(option);  
		   		} 
			}
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：<#if step?exists><#if step==0>经费管理->经费申请<#elseif step==1>经费管理->科室审批<#elseif step==2>经费管理->质管科审批<#elseif step==3>经费管理->财务审批<#elseif step==4>经费管理->分管审批<#elseif step==5>经费管理->中心审批<#elseif step==6>经费管理->"三重一大"审批</#if></#if></div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form" style="padding: 5px; ">
				<form action="" method="post">
					<table border="0" width="1040">
					    <input type="hidden" id="type" name="type" class="text ui-widget-content ui-corner-all" value="${type?if_exists}"/>
						<tr>
						    <td width="80">
							  	<label for="num" class="query_condition_lbl">经费编号:</label>
							</td>
							<td width="180">
							    <input type="text" id="num" name="num" class="text ui-widget-content ui-corner-all" />
							</td>
							<td width="80">
							  <label for="name" class="query_condition_lbl">经费名称:</label>
							</td>
							<td colspan="5">
							    <select name="name" id="name" class="text ui-widget-content" style="width:151px;">
									<option value=""></option>
                                    <#if fundsNameList?exists>
                                    	<#list fundsNameList as fundsName>
					   		            <option value="${fundsName.name}">${fundsName.name}</option>
					   		            </#list> 
					   		        </#if>
					          	</select>
					          	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					          	<label class="query_condition_lbl">或手动输入:</label>
							    <input type="text" id="name1" name="name1" class="text ui-widget-content ui-corner-all" />
							    <label class="query_condition_lbl">（搜索条件以手动输入为准）</label>
							</td>
				    	</tr>
				    	<tr>
						    <td width="80">
						        <label for="typeId" class="query_condition_lbl">经费类别:</label>
						    </td>
							<td width="180">
						        <select name="typeName" id="typeName" class="text ui-widget-content" style="width:151px;">
						        	<option value="">不限</option>
							       	<#if dataFundsTypeList?exists>
							   		<#list dataFundsTypeList as dataFundsType>
							   		   <option value="${dataFundsType.name}">${dataFundsType.name}</option>
							   		</#list>
							   	   	</#if>	
							   </select>
					        </td>
						    <td width="80">
							  	<label for="money" class="query_condition_lbl">经费金额:</label>
							</td>
							<td width="180">
							    <input type="text" id="money" name="money" class="text ui-widget-content ui-corner-all" />
							</td>
							<#if step!=0 && step!=1>
							<td width="80">
							  	<label for="applyDepartmentId" class="query_condition_lbl">申请科室:</label>
							</td>
							<td width="180">
							      <select id="applyDepartmentId" name="applyDepartmentId" class="text ui-widget-content" style="width:151px;">
						           <option value="0"></option>
							       <#if departmentList?exists>
							   		<#list departmentList as department>
							   		   <option value="${department.id}">${department.name}</option>
							   		</#list>
							   	   </#if>	
							   </select>
							</td>
							</#if>
							<#if step!=0>
						    <td width="80">
						        <label for="applyStaffId" class="query_condition_lbl">经办人:</label>
						    </td>
							<td width="180">
						        <select name="applyStaffId" id="applyStaffId" class="text ui-widget-content" style="width:151px;">
						           <option value="0"></option>
							       <#if staffInfoList?exists>
							   		<#list staffInfoList as staffInfo>
							   		   <option value="${staffInfo.id}">${staffInfo.name}</option>
							   		</#list>
							   	   </#if>	
							   </select>
					        </td>
					    	</#if>
					    	<#if step!=0 && step!=1>
					    		<td colspan="2"></td>
					    	</#if>
					    	<#if step!=0>
					    		<td colspan="2"></td>
					    	</#if>
				    	</tr>
				    	<tr>
				   			<td>
								<label for="startTime" class="query_condition_lbl">申请日期:</label>
							</td>
							<td colspan="3">
								<input type="text" id="startTime" name="startTime" value="${defStartTime?if_exists}" class="text ui-widget-content ui-corner-all" />
								-
								<input type="text" id="endTime" name="endTime" class="text ui-widget-content ui-corner-all" />
							</td>
							<td width="80">
						        <label for="" class="query_condition_lbl">处理状态:</label>
						    </td>
							<td width="180">
						        <select name="status" id="status" class="text ui-widget-content" style="width:151px;">
						        	<option value="-1000">不限</option>
						        	<option value="-100" <#if from?exists><#if from=='welcome'>selected</#if></#if> >待处理</option>
							   </select>
					        </td>
					        <td colspan="2"></td>
						</tr>
				    	<tr>
							<td colspan="8">
							   <input type="button" id="search" value="搜索" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
								<#if step?exists>
								  <#if step==0>
								  <#if isDisplay('2_1_2')>
								   <input type="button" id="create" value="创建" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
								  </#if>	 
								  </#if>
								</#if>    
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<font style="font-size:12px;">黑色：</font><font style="font-size:12px;">无需处理</font>&nbsp;&nbsp;&nbsp;&nbsp;
								<font color='red' style="font-size:12px;">红色：</font><font style="font-size:12px;">待处理</font>&nbsp;&nbsp;&nbsp;&nbsp;
								<font color='#A52A2A' style="font-size:12px;">棕色：</font><font style="font-size:12px;">驳回，无需处理</font>&nbsp;&nbsp;&nbsp;&nbsp;
								<font color='#0000FF' style="font-size:12px;">深蓝色：</font><font style="font-size:12px;">流程已走完</font>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<table id="dataGrid"></table>
			<div id="pager"></div>
		</div>
	</div>
</body>
<#include "../foot.ftl" />
