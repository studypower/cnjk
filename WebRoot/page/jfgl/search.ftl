<#include "../head.ftl" />
<script type="text/javascript">
	$(function(){
		var name_1000 = $("#name").val();
     	if($("#name1").val()!="" && $("#name1").val()!=null){
     		name_1000 = $("#name1").val();
     	}
		var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: ["经费单编号","经费名称","经费类别","申请金额(元)","申请科室","经办人","申请时间","流程状态说明"],
	        colModel: [
	            {name: "num",width:180,sortable:true,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	if(rowObject['id']==null || rowObject['id']==''){
	            		return key;
	            	}
	            	var html = "";
	            	html += '<a href="${gzUrl('jfgl/info.do?step=${step?if_exists}&id=')}' + rowObject['id'] + '" title="'+ rowObject['num'] +'">' + rowObject['num'] + '</a>';
	            	return html;
	            }},
	            {name: "name",width:"180",sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html = "";
	            	html += '<a href="${gzUrl('jfgl/info.do?step=${step?if_exists}&id=')}' + rowObject['id'] + '" title="'+ rowObject['name'] +'">' + rowObject['name'] + '</a>';
	            	return html;
	            }},
	             {name: "type_name",width:120,sortable:false,align:"center",formatter:function(key,options,rowObject){
	             	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html = "";
	            	html += "<font>";
	            	html += key;
	            	html += "</font>";
	            	return html;
	            }},
	            {name: "money",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html = "";
	            	html += "<font>";
	            	html += key;
	            	html += "</font>";
	            	return html;
	            }},
	            {name: "applyDepartmentName",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	             	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html = "";
	            	html += "<font>";
	            	html += key;
	            	html += "</font>";
	            	return html;
	            }},
	            {name: "applyStaffName",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html = "";
	            	html += "<font>";
	            	html += key;
	            	html += "</font>";
	            	return html;
	            }},
	            {name: "apply_time",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html = "";
	            	html += "<font>";
	            	html += key;
	            	html += "</font>";
	            	return html;
	            }},
	            {name: "",width:200,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines']){
	            		return "";
	            	}
	            	var html = "";
	            	html += "<font>";
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
	            		html += "-->退回修改";
	            	} else if(rowObject['status']==0){
	            	    html += "-->等待处理";
	            	}
	            	html += "</font>";
	            	return html;
	            }}
	        ],
	        datatype: "json", //将这里改为使用JSON数据  
	        url:'${gzUrl('jfgl/search.do')}', //这是Action的请求地址  
	        mtype: 'POST',
	        postData:{
            	'name':name_1000,
            	'typeName':$("#typeName").val(),
            	'step':$("#step").val(),
            	'status':$("#status").val(),
            	'num':$("#num").val(),
            	<#if !isDisplay('2_7_3') && !isDisplay('2_7_2') && isDisplay('2_7_1')>
            		'applyStaffId':${Session.currentUser.staffId},
            	</#if>
            	'applyDepartmentId':$("#applyDepartmentId").val(),
            	'startMoney':$("#startMoney").val(),
            	'endMoney':$("#endMoney").val(),
                'startTime':$("#startTime").val(),
            	'endTime':$("#endTime").val()
            },
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
                	'num':$("#num").val(),
                	<#if !isDisplay('2_7_3') && !isDisplay('2_7_2') && isDisplay('2_7_1')>
	            		'applyStaffId':${Session.currentUser.staffId},
	            	</#if>
                	'applyDepartmentId':$("#applyDepartmentId").val(),
                	'startMoney':$("#startMoney").val(),
                	'endMoney':$("#endMoney").val(),
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
	    $("#step").combobox();
	    $("#status").combobox();
	    $("#name").combobox();
		$("#pageloading").hide();
	    $("#applyDepartmentId").combobox({
		   select:function() {
		      $.get("${gzUrl('rygl/jbxx/ajaxList.do')}?departmentId="+ $("#applyDepartmentId").val()+"&timestamp="+Date.parse(new Date()), null, callback);
		  }
	   });
	   
	    $("#export").button().click(function( event ) {
	    	var name_1002 = $("#name").val();
	     	if($("#name1").val()!="" && $("#name1").val()!=null){
	     		name_1002 = $("#name1").val();
	     	}
	    	event.preventDefault();
	    	$.get("${gzUrl('jfgl/exportData.do?')}name="+name_1002+"&typeId="+ $("#typeId").val()+"&step="+ $("#step").val()+"&status="+ $("#status").val()+"&num="+ $("#num").val() + <#if isDisplay('2_7_4')>"&applyStaffId="+ ${Session.currentUser.staffId} +</#if>"&applyDepartmentId="+ $("#applyDepartmentId").val()+"&startMoney="+ $("#startMoney").val()+"&endMoney="+ $("#endMoney").val()+"&startTime="+ $("#startTime").val()+"&endTime="+ $("#endTime").val()+"&timestamp="+Date.parse(new Date()), null, returnBack);
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
			
		function returnBack(data){
		  var result = eval("("+data+")");
          if(result[0]==1){
             alert("导出成功");
             window.open('${gzUrl('')}'+result[1]);
          }else{
            alert("导出失败");
          }
	   }	
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：经费管理->经费查询</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form" style="padding: 5px; ">
				<form action="" method="post">
					<table border="0" width="1040px">
						<tr>
						    <td width="80px">
							  	<label for="num" class="query_condition_lbl">经费编号:</label>
							</td>
							<td width="180px">
							    <input type="text" id="num" name="num" class="text ui-widget-content ui-corner-all" />
							</td>
							<td width="80px">
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
							    <input type="text" id="name1" name="name1" class="text ui-widget-content ui-corner-all" /><label class="query_condition_lbl">（搜索条件以手动输入为准）</label>
							</td>
				    	</tr>
				    	<tr>
				    		<td>
								<label for="typeName" class="query_condition_lbl">经费类别:</label>
							</td>
							<td>
						        <select name="typeName" id="typeName" class="text ui-widget-content" style="width:151px;">
									<option value="">不限</option>
							       	<#if dataFundsTypeList?exists>
							   		<#list dataFundsTypeList as dataFundsType>
							   		   <option value="${dataFundsType.name}">${dataFundsType.name}</option>
							   		</#list>
							   	   </#if>	
							   </select>
					        </td>
							<td>
								<label for="applyDepartmentId" class="query_condition_lbl">申请科室:</label>
							</td>
							<td width="180px">
							    <select id="applyDepartmentId" name="applyDepartmentId" class="text ui-widget-content" style="width:151px;">
							    	<#if isDisplay('2_7_3')>
						           	<option value="0">不限</option>
							       	<#if departmentList?exists>
							   		<#list departmentList as department>
							   		   <option value="${department.id}">${department.name}</option>
							   		</#list>
							   	   	</#if>	
							   	   	<#else>
							   	   		<option value="${Session.currentUser.departmentId}">${Session.currentUser.departmentName}</option>
							   	   	</#if>
							   </select>
							</td>
					        <td width="80px">
								<label for="num" class="query_condition_lbl">流程名称:</label>
							</td>
							<td width="180px">
							    <select id="step" name="step" class="text ui-widget-content" style="width:151px;">
						        	<option value="-100">不限</option>
							    	<option value="0">经费申请</option>
							    	<option value="1">科室审批</option>
							    	<option value="2">财务审批</option>
							    	<option value="3">分管审批</option>
							    	<option value="4">中心主任审批</option>
							    	<option value="5">"三重一大"审批</option>   
							   	</select>
							</td>
							<td width="80px">
								<label for="num" class="query_condition_lbl">流程状态:</label>
							</td>
							 <td width="180px">
							    <select id="status" name="status" class="text ui-widget-content" style="width:151px;">
						        	<option value="-100">不限</option>
							    	<option value="-1">驳回</option>
							    	<option value="0">待处理</option>
							    	<option value="1">通过</option>
							   	</select>
							</td>   
				    	</tr>
				    	<tr>
						    <td>
							  	<label class="query_condition_lbl">金额:</label>
							</td>
							<td colspan="3">
							    <input type="text" id="startMoney" name="startMoney" class="text ui-widget-content ui-corner-all" />
							    -
							    <input type="text" id="endMoney" name="endMoney" class="text ui-widget-content ui-corner-all" />
							</td>
				   			<td>
								<label for="num" class="query_condition_lbl">申请日期:</label>
							</td>
							<td colspan="3">
								<input type="text" id="startTime" name="startTime" value="${curYear0101?if_exists}" class="text ui-widget-content ui-corner-all" />
								-
								<input type="text" id="endTime" name="endTime" class="text ui-widget-content ui-corner-all" />
							</td>
						</tr>
				    	<tr>
							<td colspan="8">
							   	<input type="button" id="search" value="搜索" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
							  	<#if isDisplay('2_7_4')> 
							   	<input type="button" id="export" value="导出" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
							  	</#if>  
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
