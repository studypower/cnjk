<#include "../../head.ftl" />
<script type="text/javascript">
	$(function(){
		var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: ["人事编号*","姓名*","工号(帐号)*","性别","年龄","科室*","职位*","工作状态*",<#--"政治面貌*","职称*","职称级别*",-->"操作"],
	        colModel: [
	        	{name: "index_num1",width:100,sortable:true,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return rowObject['index_num'];
	            }},
	            {name: "name",width:100,sortable:true,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html='';
	            	html += '<a href="${gzUrl('rygl/jbxx/info.do?id=')}'+rowObject['id']+'" title="'+rowObject['name']+'">'+rowObject['name']+'</a>&nbsp;&nbsp;';
                	return html;
	            }},
	            {name: "user_name",width:110,sortable:true,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
                	return key;
	            }},
	            {name: "sex",width:50,sortable:false,align:"center",formatter:function(key,options,rowObject){
	                if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	                 if(key==0){
	            		return "女";
	            	} else if(key==1){
	            		return "男";
	            	}
	            }},
	            {name: "age",width:50,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "department_name", width:150,sortable:true,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "position_name",width:100,sortable:true,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "work_status",width:100,sortable:true,align:"center",formatter:function(key,options,rowObject){
	                if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	           <#--
	           {name: "zzmmName",width:100,sortable:true,align:"center",formatter:function(key,options,rowObject){
	                if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	           {name: "zcName",width:100,sortable:true,align:"center",formatter:function(key,options,rowObject){
	                if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	           {name: "zcjbName",width:100,sortable:true,align:"center",formatter:function(key,options,rowObject){
	                if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            -->
	            {name: "",width:200,sortable:false,align:"center",formatter:function(key,options,rowObject){
	                if(rowObject['isBlanklines']){
	            		return "";
	            	}
	            	var html='';
	            	<#if isDisplay('7_1_2')>	
	            	  html += '<a href="${gzUrl('rygl/jbxx/info.do?id=')}'+rowObject['id']+'" title="详情">详情</a>&nbsp;&nbsp;';
	            	</#if>
	            	<#if isDisplay('7_1_3')>  
                	  html += '<a href="${gzUrl('rygl/jbxx/initUpdate.do?id=')}'+rowObject['id']+'" title="修改">修改</a>&nbsp;&nbsp;';
                	  html += '<a href="javascript:del('+rowObject['id']+');" title="删除">删除</a>';
                	</#if>  
                	return html;
	            }}
	        ],
	        datatype: "json", //将这里改为使用JSON数据  
	        url:'${gzUrl('rygl/jbxx/list.do')}', //这是Action的请求地址  
	        mtype: 'POST',
	        postData:{
            	'departmentId':$("#departmentId").val(),
            	'name':$("#name").val(),
            	'sexy':$("#sexy").val(),
            	'contractual':$("#contractual").val(),
            	'positionId':$("#positionId").val(),
            	'education':$("#education").val(),
            	'workStatus':$("#workStatus").val(),
            	'startTime':$("#startTime").val(),
            	'endTime':$("#endTime").val(),
            	'startAge':$("#startAge").val(),
            	'endAge':$("#endAge").val()
            },
	        pager: $("#pager"),
	        rowNum:20,
	        shrinkToFit:false,
	        rownumbers:false,
	        hidegrid:false,
	        multiselect: false,
	        viewrecords:true,
	        height:"100%",
	        width: '100%', 
	        rowList:[20,40,60],
	        loadComplete: function(){
	        	var rowNum = $("#dataGrid").getGridParam("rowNum");
	        	var records = $("#dataGrid").getGridParam("records");
	        	var page = $("#dataGrid").getGridParam("page");
	        	for(var i=0;i<(page * rowNum - records);i++){
	        		$("#dataGrid").jqGrid("addRowData",i+1,{"isBlanklines":true});
	        	}
	        },
			caption: "职工基本信息列表"
	    });
		$("#dataGrid").navGrid("#pager",{edit:false,add:false,del:false,refresh:true,search:false});
	    $(document.body).css({"overflow-x":"auto","overflow-y":"auto"});

		
	    $("#search").button().click(function( event ) {
	    	event.preventDefault();
	    	jQuery("#dataGrid").jqGrid('setGridParam',{  
                postData:{
                	'departmentId':$("#departmentId").val(),
                	'name':$("#name").val(),
                	'sexy':$("#sexy").val(),
                	'contractual':$("#contractual").val(),
                	'positionId':$("#positionId").val(),
                	'whcdId':$("#whcdId").val(),
            	    'zzmmId':$("#zzmmId").val(),
            	    'zcId':$("#zcId").val(),
            	    'zcjbId':$("#zcjbId").val(),
                	'workStatus':$("#workStatus").val(),
                	'startTime':$("#startTime").val(),
                	'endTime':$("#endTime").val(),
	            	'startAge':$("#startAge").val(),
	            	'endAge':$("#endAge").val()
                }  
            }).trigger('reloadGrid');    
	    });
	    $("#create").button().click(function( event ) {
	    	event.preventDefault();
	    	window.location.href="${gzUrl('rygl/jbxx/initAdd.do')}";
	    });
	    $("#startTime").datepicker({
			dateFormat: "yy-mm-dd"
		});
	    $("#endTime").datepicker({
			dateFormat: "yy-mm-dd"
		});
	    $("#departmentId").combobox();
	    $("#positionId").combobox();
	    $("#sexy").combobox();
	    $("#contractual").combobox();
	    $("#whcdId").combobox();
	    $("#zzmmId").combobox();
	    $("#zcId").combobox();
	    $("#zcjbId").combobox();
	    $("#workStatus").combobox();
		$("#pageloading").hide();
		$("#departmentId").combobox();
	    $("#export").button().click(function( event ) {
	    	event.preventDefault();
	    	$.get("${gzUrl('rygl/jbxx/exportData.do')}", null, returnBack);
	    });
	    $("#importIndexNumButton").button().click(function( event ) {
	    	event.preventDefault();
	    	window.location.href="${gzUrl('rygl/jbxx/initImportIndexNum.do')}";
	    });
	    
	});
	
	function callback(data){
		var positionList = eval("("+data+")");
	    var positionSelect = document.getElementById("positionId");
	    var positionCount = positionSelect.options.length;
	    for(var i = 0; i<positionCount; i++){
	      positionSelect.options.remove(0);//每次删除下标都是0
	   	}
	   	var option = document.createElement("OPTION");
	   	option.value =0;  
		option.innerHTML =""; 
		positionSelect.appendChild(option);  
 		for(var i=0; i<positionList.length; i++){
		    var option = document.createElement("OPTION"); 
		    option.value = positionList[i].id;  
		    option.innerHTML = positionList[i].name; 
		    positionSelect.appendChild(option);  
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
	
	function del(id){
		var r = confirm("确认要删除？"); 
		if (r==true) { 
			$.get("${gzUrl('rygl/jbxx/del.do')}?id="+ id +"&timestamp=" + Date.parse(new Date()), null, callback);
		}
	}
	
	function callback(data){
		jQuery("#dataGrid").jqGrid('setGridParam',{  
            postData:{
            	'departmentId':$("#departmentId").val(),
            	'name':$("#name").val(),
            	'sexy':$("#sexy").val(),
            	'contractual':$("#contractual").val(),
            	'positionId':$("#positionId").val(),
            	'whcdId':$("#whcdId").val(),
            	'zzmmId':$("#zzmmId").val(),
            	'zcId':$("#zcId").val(),
            	'zcjbId':$("#zcjbId").val(),
            	'workStatus':$("#workStatus").val(),
            	'startTime':$("#startTime").val(),
            	'endTime':$("#endTime").val(),
            	'startAge':$("#startAge").val(),
            	'endAge':$("#endAge").val()
            }  
        }).trigger('reloadGrid');    
	}
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：人员管理->基本信息</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form" style="padding: 5px; ">
				<form action="" method="post">
					<table border="0" width="960">
						<tr>
							<td width="80px">
								<label for="name" class="query_condition_lbl">职工姓名:</label>
							</td>
							<td width="220px">
								<input type="text" id="name" name="name" class="text ui-widget-content ui-corner-all"/>
							</td>
						    <td width="80px">
						      	<label for="sexy" class="query_condition_lbl">性别:</label>
						    </td>
							<td width="220px">
							    <select name="sexy" id="sexy" class="text ui-widget-content" style="width:151px;">
							    	<option value=" ">不限</option>
							   		<option value="1">男</option>
							   		<option value="0">女</option>
							    </select>
					        </td>
					        <td  width="80px">
								<label for="workStatus" class="query_condition_lbl">工作状态:</label>
							</td>
							<td width="220px">
							    <select name="workStatus" id="workStatus" class="text ui-widget-content" style="width:151px;">
						           <option value=" ">不限</option>
						           <#if dataWorkStatusList?exists>
	                                  <#list dataWorkStatusList as dataWorkStatus>
                                         <option value="${dataWorkStatus.id}">${dataWorkStatus.name}</option>
                                      </#list>
                                    </#if>
							    </select>
							</td>
				    	</tr>
				     	<tr>
							<td>
								<label for="whcdId" class="query_condition_lbl">文化程度:</label>
							</td>
							<td>
						         <select id="whcdId" name="whcdId"  class="select01">
									        <option value="0">请选择</option>
        	                                <#if dataWhcdInfoList?exists>
        	                                  <#list dataWhcdInfoList as dataWhcdInfo>
        	                                     <option value="${dataWhcdInfo.id}">${dataWhcdInfo.name}</option>
        	                                  </#list>
        	                                </#if>
                                  </select>
						  	</td>
						  	<td>
								<label for="departmentId" class="query_condition_lbl">科室:</label>
							</td>
							<td>
							    <select name="departmentId" id="departmentId" class="text ui-widget-content" style="width:151px;">
					           		<option value="0">不限</option>
					             	<#if departmentList?exists>
        	                        <#list departmentList as department>
                                    <option value="${department.id}">${department.name}</option>
                                    </#list>
                                 	</#if>    
							    </select>
							</td>
							<td>
								<label for="positionId" class="query_condition_lbl">职位:</label>
							</td>
							<td>
							   	<select class="select01" id="positionId" name="positionId" class="text ui-widget-content" style="width:151px;">
								  	<option value="0">不限</option>
								  	<#if positionList?exists>
	                                <#list positionList as position>
                                      <option value="${position.id}">${position.name}</option>
                                    </#list>
                                    </#if>
                               	</select>
						  	</td>
				     	</tr>
				     	<tr>
							<td>
								<label for="zzmmId" class="query_condition_lbl">政治面貌:</label>
							</td>
							<td>
					            <select id="zzmmId" name="zzmmId"  class="select01">
							        <option value="0">请选择</option>
	                                <#if dataZzmmInfoList?exists>
	                                  <#list dataZzmmInfoList as dataZzmmInfo>
	                                     <option value="${dataZzmmInfo.id}">${dataZzmmInfo.name}</option>
	                                  </#list>
	                                </#if>
                                </select>
						  	</td>
						  	<td>
								<label for="zcId" class="query_condition_lbl">职称:</label>
							</td>
							<td>
						       <select id="zcId" name="zcId"  class="select01">
							        <option value="0">请选择</option>
	                                <#if dataZcInfoList?exists>
	                                  <#list dataZcInfoList as dataZcInfo>
	                                     <option value="${dataZcInfo.id}">${dataZcInfo.name}</option>
	                                  </#list>
	                                </#if>
                                </select>
							</td>
							<td>
								<label for="zcjbId" class="query_condition_lbl">职称级别:</label>
							</td>
							<td>
						  	    <select id="zcjbId" name="zcjbId"  class="select01">
								        <option value="0">请选择</option>
    	                                <#if dataZcjbInfoList?exists>
    	                                  <#list dataZcjbInfoList as dataZcjbInfo>
    	                                     <option value="${dataZcjbInfo.id}">${dataZcjbInfo.name}</option>
    	                                  </#list>
    	                                </#if>
                                </select>
						  	</td>
				     	</tr>
   						<tr>
   							<td>
   								<label for="startTime" class="query_condition_lbl">年龄:</label>
   							</td>
   							<td>
   								<input type="text" id="startAge" name="startAge" class="text ui-widget-content ui-corner-all" style="width:80px" />
								-
								<input type="text" id="endAge" name="endAge" class="text ui-widget-content ui-corner-all" style="width:80px" />
   							</td>
				   			<td>
								<label for="startTime" class="query_condition_lbl">入职日期:</label>
							</td>
							<td colspan="4">
								<input type="text" id="startTime" name="startTime" class="text ui-widget-content ui-corner-all" />
								-
								<input type="text" id="endTime" name="endTime" class="text ui-widget-content ui-corner-all" />
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<input type="button" id="search" value="搜索" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
								<#if isDisplay('7_1_4')>  
								  <input type="button" id="create" value="创建" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
								</#if>
								<#if isDisplay('7_1_5')>  
								<input type="button" id="importIndexNumButton" value="人员编号校准" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
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
<#include "../../foot.ftl" />
