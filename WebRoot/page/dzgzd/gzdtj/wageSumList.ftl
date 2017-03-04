<#include "../../head.ftl" />
<script type="text/javascript">
	$(function(){
		var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: ["姓名","科室","职位","5号工资总和","20号奖金（加发）总和","20号奖金总和","所有总和"],
	        colModel: [
	        	{name: "staff_name",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "department_name", width:120,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "position_name",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "wage_sum4",width:120,sortable:false,align:"center",formatter:function(key,options,rowObject){
	                if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return Math.round(key*1000)/1000;
	            }},
	            {name: "wage_sum5",width:180,sortable:false,align:"center",formatter:function(key,options,rowObject){
	                if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return Math.round(key*1000)/1000;
	            }},
	            {name: "wage_sum6",width:120,sortable:false,align:"center",formatter:function(key,options,rowObject){
	                if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return Math.round(key*1000)/1000;
	            }},
	            {name: "wage_sum",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	                if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return Math.round((key-rowObject['wage_sum5'])*1000)/1000;
	            }}
	        ],
	        datatype: "json", //将这里改为使用JSON数据  
	        url:'${gzUrl('dzgzd/gzdtj/wageSumList.do')}', //这是Action的请求地址  
	        mtype: 'POST',
	        postData:{
            	'departmentId':$("#departmentId").val(),
            	'positionId':$("#positionId").val(),
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
	    	if($("#startTime").val()==null || $("#startTime").val()==""){
	    		alert("起始时间不能为空");
	    		return;
	    	}
	    	if($("#endTime").val()==null || $("#endTime").val()==""){
	    		alert("结束时间不能为空");
	    		return;
	    	}
	    	jQuery("#dataGrid").jqGrid('setGridParam',{  
                postData:{
	            	'departmentId':$("#departmentId").val(),
	            	'positionId':$("#positionId").val(),
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
	    $("#departmentId").combobox();
	    $("#positionId").combobox();
	    $("#export").button().click(function( event ) {
	    	event.preventDefault();
	    	if($("#startTime").val()==null || $("#startTime").val()==""){
	    		alert("起始时间不能为空");
	    		return;
	    	}
	    	if($("#endTime").val()==null || $("#endTime").val()==""){
	    		alert("结束时间不能为空");
	    		return;
	    	}
	    	var param = "departmentId=" + $("#departmentId").val();
	    	param += "&positionId=" + $("#positionId").val();
	    	param += "&startTime=" + $("#startTime").val();
	    	param += "&endTime=" + $("#endTime").val();
	    	$.get("${gzUrl('dzgzd/gzdtj/exportWageSumList.do')}?" + param, null, returnBack);
	    });
	    $("#pageloading").hide();
	});
		
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
			<div class="osx-modal-title">您现在所在的位置：人员管理->基本信息</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form" style="padding: 5px; ">
				<form action="" method="post">
					<table border="0" width="960">
				     	<tr>
						  	<td width="80px">
								<label for="departmentId" class="query_condition_lbl">科室:</label>
							</td>
							<td width="220px">
							    <select name="departmentId" id="departmentId" class="text ui-widget-content" style="width:151px;">
					           		<option value="0">不限</option>
					             	<#if departmentInfoList?exists>
        	                        <#list departmentInfoList as department>
                                    <option value="${department.id}">${department.name}</option>
                                    </#list>
                                 	</#if>    
							    </select>
							</td>
							<td></td>
							<td></td>
				     	</tr>
				     	<tr>
							<td width="80px">
								<label for="positionId" class="query_condition_lbl">职位:</label>
							</td>
							<td width="220px">
							   	<select class="select01" id="positionId" name="positionId" class="text ui-widget-content" style="width:151px;">
								  	<option value="0">不限</option>
								  	<#if positionInfoList?exists>
	                                <#list positionInfoList as position>
                                      <option value="${position.id}">${position.name}</option>
                                    </#list>
                                    </#if>
                               	</select>
						  	</td>
						  	<td></td>
							<td></td>
				     	</tr>
   						<tr>
   							<td>
   								<label for="" class="query_condition_lbl">日期范围:</label>
   							</td>
   							<td colspan="3">
   								<input type="text" id="startTime" name="startTime" class="text ui-widget-content ui-corner-all" readonly />
   								~
								<input type="text" id="endTime" name="endTime" class="text ui-widget-content ui-corner-all" readonly />
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<input type="button" id="search" value="搜索" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
								&nbsp;&nbsp;
								<input type="button" id="export" value="导出" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
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
