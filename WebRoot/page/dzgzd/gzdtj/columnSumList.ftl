<#include "../../head.ftl" />
<script type="text/javascript">
	$(function(){
		var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: [<#list payrollColumnInfoList as payrollColumnInfo><#if payrollColumnInfo.column_name!="batch_id" && payrollColumnInfo.column_name!="release_status" && payrollColumnInfo.column_name!="read_status" && payrollColumnInfo.column_name!="bz" && payrollColumnInfo.column_name!="id">"${payrollColumnInfo.name}",</#if></#list>""],
	        colModel: [
	        	<#list payrollColumnInfoList as payrollColumnInfo>
				<#if payrollColumnInfo.column_name!="batch_id" && payrollColumnInfo.column_name!="release_status" && payrollColumnInfo.column_name!="read_status" && payrollColumnInfo.column_name!="bz" && payrollColumnInfo.column_name!="id">
				{name: "${payrollColumnInfo.column_name}",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
                	return key;
	            }},
				</#if>
	            </#list>
	            {name: "",width:"1",sortable:false,align:"center",formatter:function(key,options,rowObject){
                	return "";
	            }}
	        ],
	        datatype: "json", //将这里改为使用JSON数据  
	        url:'${gzUrl('dzgzd/gzdtj/columnSumList.do')}', //这是Action的请求地址  
	        mtype: 'POST',
	        postData:{
            	'payrollBatch.tableId':${payrollTableInfo.id?if_exists},
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
	        multiselect:false,
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
			caption: "工资单列表"
	    });
		$("#dataGrid").navGrid("#pager",{edit:false,add:false,del:false,refresh:true,search:false});
		$(document.body).css({"overflow-x":"auto","overflow-y":"auto"});
	    $(window).resize(function(){
	    	var $window=$(window);
			$("#dataGrid").setGridHeight("100%");
			$("#dataGrid").setGridWidth("100%");
		});
	    $("#searchBtn").button().click(function( event ) {
	    	event.preventDefault();
	    	if($("#startTime").val()==null || $("#startTime").val()==""){
	    		alert("起始时间不能为空");
	    		return;
	    	}
	    	if($("#endTime").val()==null || $("#endTime").val()==""){
	    		alert("结束时间不能为空");
	    		return;
	    	}
	    	$("#searchForm").submit();
	    });
	    $("#startTime").datepicker({
			dateFormat: "yy-mm-dd"
		});
		$("#endTime").datepicker({
			dateFormat: "yy-mm-dd"
		});
		$("#departmentId").combobox();
	    $("#positionId").combobox();
	    $("#tableId").combobox();
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
	    	param += "&payrollBatch.tableId=${payrollTableInfo.id?if_exists}";
	    	$.get("${gzUrl('dzgzd/gzdtj/exportColumnSumList.do')}?" + param, null, returnBack);
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
			<div class="osx-modal-title">您现在所在的位置：电子工资单->工资单查询</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form" style="padding: 5px; ">
				<form id="searchForm" action="${gzUrl('dzgzd/gzdtj/initColumnSumList.do')}" method="post">
					<table border="0" width="960">
						<tr>
						  	<td width="80px">
							    <label for="tableId" class="query_condition_lbl">工资模板:</label>
							</td>
							<td width="220px">
								<select id="tableId" name="payrollBatch.tableId" class="select01">
		                    		<#list payrollTableInfoList as _payrollTableInfo>
		                    			<option value="${_payrollTableInfo.id}" <#if _payrollTableInfo.id==payrollTableInfo.id>selected</#if>>${_payrollTableInfo.name}</option>
		                    		</#list>
		                       	</select> 
							</td>
							<td></td>
							<td></td>
				     	</tr>
				     	<tr>
						  	<td width="80px">
								<label for="departmentId" class="query_condition_lbl">科室:</label>
							</td>
							<td width="220px">
							    <select name="departmentId" id="departmentId" class="text ui-widget-content" style="width:151px;">
					           		<option value="0">不限</option>
					             	<#if departmentInfoList?exists>
        	                        <#list departmentInfoList as department>
                                    <option value="${department.id}" <#if departmentId?exists && department.id==departmentId>selected</#if>>${department.name}</option>
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
                                      <option value="${position.id}" <#if positionId?exists && position.id==positionId>selected</#if>>${position.name}</option>
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
   								<input type="text" id="startTime" name="startTime" class="text ui-widget-content ui-corner-all" <#if startTime?exists>value="${startTime?date}"</#if> readonly />
   								~
								<input type="text" id="endTime" name="endTime" class="text ui-widget-content ui-corner-all" <#if endTime?exists>value="${endTime?date}"</#if> readonly />
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<input type="button" id="searchBtn" value="搜索" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
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
