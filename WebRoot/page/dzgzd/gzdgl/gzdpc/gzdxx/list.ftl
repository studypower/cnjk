<#include "../../../../head.ftl" />
<script type="text/javascript">
	$(function(){
		var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: [<#list payrollColumnInfoList as payrollColumnInfo><#if payrollColumnInfo.column_name=="batch_id">"工资单批次",<#elseif payrollColumnInfo.column_name!="id">"${payrollColumnInfo.name}",</#if></#list>"操作"],
	        colModel: [
	        	<#list payrollColumnInfoList as payrollColumnInfo>
	            <#if payrollColumnInfo.column_name=="batch_id">
				{name: "batch_name",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html = "";
	            	if(rowObject['batch_name']=='合计'){
	            		html += "<font color='#1670eb'>";
	            	}
	            	if(rowObject['batch_name']=='合计(百分比)' || rowObject['batch_name']=='合计（百分比）'){
	            		html += "<font color='#0000FF'>";
	            	}
	            	html += key;
	            	if(rowObject['batch_name']=='合计' || rowObject['batch_name']=='合计(百分比)' || rowObject['batch_name']=='合计（百分比）'){
	            		html += "</font>";
	            	}
	            	return html;
	            }},
				<#elseif payrollColumnInfo.column_name=="read_status">
				{name: "read_status",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
					if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	              	if(key=="0"){
	              		return "未阅读";
	              	} else if(key=="1"){
	              		return "已阅读";
	              	}
	              	return "";
	            }},
	            <#elseif payrollColumnInfo.column_name=="release_status">
				{name: "release_status",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
					if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	              	if(key=="0"){
	              		return "未发布";
	              	} else if(key=="1"){
	              		return "已发布";
	              	}
	              	return "";
	            }},
				<#elseif payrollColumnInfo.column_name!="id">
				{name: "${payrollColumnInfo.column_name}",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html = "";
	            	if(rowObject['batch_name']=='合计'){
	            		html += "<font color='#1670eb'>";
	            	}
	            	if(rowObject['batch_name']=='合计(百分比)' || rowObject['batch_name']=='合计（百分比）'){
	            		html += "<font color='#0000FF'>";
	            	}
	            	html += key;
	            	if(rowObject['batch_name']=='合计' || rowObject['batch_name']=='合计(百分比)' || rowObject['batch_name']=='合计（百分比）'){
	            		html += "</font>";
	            	}
	            	return html;
	            }},
				</#if>
	            </#list>
	            {name: "",width:200,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines']){
	            		return "";
	            	}
	            	if(rowObject['batch_name']=='合计' || rowObject['batch_name']=='合计(百分比)' || rowObject['batch_name']=='合计（百分比）'){
	            		return "";
	            	}
	              	var html='';
	               <#if isDisplay('6_2_5_3')>			
	            	html += '<a href="###" onclick="info(' + rowObject['id'] + ')" title="详情">详情</a>&nbsp;&nbsp;';
	               </#if>
	               <#if isDisplay('6_2_5_4')>	
	            	html += '<a href="###" onclick="update(' + rowObject['id'] + ')" title="修改">修改</a>&nbsp;&nbsp;';
	               </#if>
	               <#if isDisplay('6_2_5_5')>		
	            	html += '<a href="${gzUrl('dzgzd/gzdgl/gzdpc/gzdxx/del.do?id=')}' + rowObject['id'] + '&batchId='+ rowObject['batch_id'] + '" title="删除">删除</a>&nbsp;&nbsp;';
	               </#if>	
                	return html;
	            }}
	        ],
	        datatype: "json", //将这里改为使用JSON数据  
	        url:'${gzUrl('dzgzd/gzdgl/gzdpc/gzdxx/list.do')}', //这是Action的请求地址  
	        mtype: 'POST',
	        postData:{
            	'batchId':${payrollBatch.id?if_exists},
            	'tableId':${payrollBatch.table_id?if_exists}
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
			caption: "工资单明细"
	    });
		$("#dataGrid").navGrid("#pager",{edit:false,add:false,del:false,refresh:true,search:false});
		$(document.body).css({"overflow-x":"auto","overflow-y":"auto"});
	    $(window).resize(function(){
	    	var $window=$(window);
			$("#dataGrid").setGridHeight("100%");
			$("#dataGrid").setGridWidth("100%");
		});
	    $("#addBtn").button().click(function( event ) {
	    	event.preventDefault();
	    	window.location.href="${gzUrl('dzgzd/gzdgl/gzdpc/gzdxx/initAdd.do?batchId=')}${batchId?if_exists}";
	    });
	    $("#searchBtn").button().click(function( event ) {
	    	event.preventDefault();
	    	jQuery("#dataGrid").jqGrid('setGridParam',{  
                postData:{
                	'batchId':${payrollBatch.id?if_exists},
            		'tableId':${payrollBatch.table_id?if_exists},
            		'staffName':$("#staffName").val()
                }  
            }).trigger('reloadGrid');    
	    });
		$("#pageloading").hide();
	});
	
	function deleteColumn(id) {
		var goto = confirm("删除后，数据库中的数据也会做相应删除，此操作不可逆，确定要执行？");
		if(goto){
			window.location.href="${gzUrl('dzgzd/gzdgl/gzdpc/gzdxx/delete.do?id=')}" + id + "&batchId=${batchId?if_exists}";
		}
	}
	
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
    	$("#dialog_iframe").attr("src","${gzUrl('dzgzd/gzdgl/gzdpc/gzdxx/info.do?id=')}" + id + "&randomNum=" + Math.random());
    }
    
    function update(id) {
    	$("#dialog").dialog({
    		 height: 500,
    		 width: 900,
    		 modal: true,
    		 resizable: false,
    		 close: function( event, ui ) {
    			 $("#dialog_iframe").css("display","none");
    		 },
    		 buttons:[
    		 {
    			 text:"保存",
    			 click:function(){
    				 dialog_iframe.window.checkSubmit();
    			 }
    		 },
    		 {
    			 text:"关闭",
    			 click:function(){
    				 $(this).dialog("close");
    			 }
    		 }
    		 ]
    	});
    	$("#dialog_iframe").css("display","block");
    	$("#dialog_iframe").attr("src","${gzUrl('dzgzd/gzdgl/gzdpc/gzdxx/initUpdate.do?id=')}" + id + "&randomNum=" + Math.random());
    }
    
    function updateOK(){
		window.location.href = "${gzUrl('dzgzd/gzdgl/gzdpc/gzdxx/initList.do?batchId=${batchId}')}";
	}
	
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：电子工资单->工资单管理->工资单明细</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form" style="padding: 5px; ">
				<form action="" method="post">
					<table border="0" width="730">
						<tr>
							<td colspan="2">
								<label for="staffName" class="query_condition_lbl">职工姓名:</label>
								<input type="text" id="staffName" name="staffName" class="text ui-widget-content ui-corner-all"/>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="button" id="searchBtn" value="搜索" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
								&nbsp;&nbsp;
							   <#if isDisplay('6_2_5_2')>			
								<input type="button" id="addBtn" value="批量上传工资单" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
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
	<div id="dialog" title="工资单明细" style="padding: 0px;">
		<iframe id="dialog_iframe" name="dialog_iframe" src="" frameborder="0" width="100%" height="100%" style="overflow: hidden;display: none;"></iframe>
	</div>
</body>
<#include "../../../../foot.ftl" />
