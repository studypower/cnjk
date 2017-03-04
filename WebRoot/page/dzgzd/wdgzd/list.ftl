<#include "../../head.ftl" />
<script type="text/javascript">
	$(function(){
		var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: [<#list payrollColumnInfoList as payrollColumnInfo><#if payrollColumnInfo.column_name=="batch_id">"工资单批次",<#elseif payrollColumnInfo.column_name!="release_status" && payrollColumnInfo.column_name!="id">"${payrollColumnInfo.name}",</#if></#list>"操作"],
	        colModel: [
	        	<#list payrollColumnInfoList as payrollColumnInfo>
	            <#if payrollColumnInfo.column_name=="batch_id">
				{name: "batch_name",width:200,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	                var html='';
	            	html += '<a href="javascript:info(' + rowObject['id'] + ')" title="'+rowObject['batch_name']+'">'+rowObject['batch_name']+'</a>&nbsp;&nbsp;';
                	return html;
	            }},
				<#elseif payrollColumnInfo.column_name=="read_status">
				{name: "read_status",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
					if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	              	if(key=="0"){
	              		return "未阅读";
	              	} else{
	              		return "已阅读";
	              	}
	            }},
				<#elseif payrollColumnInfo.column_name!="release_status" && payrollColumnInfo.column_name!="id">
				{name: "${payrollColumnInfo.column_name}",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	<#if payrollColumnInfo.column_name=="id">
	            	   var html='';
	            	   html += '<a href="javascript:info(' + rowObject['id'] + ')" title="'+rowObject['id']+'">'+rowObject['id']+'</a>&nbsp;&nbsp;';
                	   return html;
                	<#else>
                	   return key;   
	            	</#if>
	            }},
				</#if>
	            </#list>
	            {name: "",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines']){
	            		return "";
	            	}
	              	var html='';
	              <#if isDisplay('6_3_2')>	
	            	html += '<a href="javascript:info(' + rowObject['id'] + ')" title="详情">详情</a>&nbsp;&nbsp;';
	              </#if>	
                	return html;
	            }}
	        ],
	        datatype: "json", //将这里改为使用JSON数据  
	        url:'${gzUrl('dzgzd/wdgzd/list.do')}', //这是Action的请求地址  
	        mtype: 'POST',
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
		$("#search").button().click(function( event ) {
	    	event.preventDefault();
	    	jQuery("#dataGrid").jqGrid('setGridParam',{  
                postData:{
                	'bacthId':$("#bacthId").val(),
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
	    $("#bacthId").combobox();
		$("#pageloading").hide();
	});
	
	function info(id) {
    	$("#dialog").dialog({
    		 height: 400,
    		 width: 850,
    		 modal: true,
    		 resizable: false,
    		 close: function( event, ui ) {
    			 $("#dialog_iframe").css("display","none");
    		 },
    		 buttons:[{
    			 text:"关闭",
    			 click:function(){
    			 	jQuery("#dataGrid").jqGrid('setGridParam',{  
			            postData:{
			            }  
			        }).trigger('reloadGrid');
    				$(this).dialog("close");
    				$("#dialog_iframe").attr("src","${gzUrl('page/blank.html')}");
    			 }
    		 }]
    	});
    	$("#dialog_iframe").css("display","block");
    	$("#dialog_iframe").attr("src","${gzUrl('dzgzd/wdgzd/read.do?id=')}" + id + "&randomNum=" + Math.random());
    }
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：电子工资单->我的工资单</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form" style="padding: 5px; ">
				<form id="searchForm" action="" method="post">
					<table border="0" width="780">
						<tr>
							<td width=330">
								<label for="bacthId" class="query_condition_lbl">工资单模板:</label>
								<select id="bacthId" name="bacthId" class="select01">
								    <option value="0"></option>
								  <#if payrollBatchList?exists> 
		                    		<#list payrollBatchList as _payrollBatch>
		                    			<option value="${_payrollBatch.id}">${_payrollBatch.name}</option>
		                    		</#list>
		                    	  </#if>	
		                       	</select> 
							</td>
							<td width="450">
								<label for="startTime" class="query_condition_lbl">日期:</label>
								<input type="text" id="startTime" name="startTime" class="text ui-widget-content ui-corner-all" />
								-
								<input type="text" id="endTime" name="endTime" class="text ui-widget-content ui-corner-all" />
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="button" id="search" value="搜索" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<table id="dataGrid"></table>
			<div id="pager"></div>
		</div>
	</div>
	<div id="dialog" title="工资单明细" style="padding: 0px;">
		<iframe id="dialog_iframe" src="" frameborder="0" width="100%" height="100%" style="overflow: hidden;display: none;"></iframe>
	</div>
</body>
<#include "../../foot.ftl" />
