<#include "../../../head.ftl" />
<script type="text/javascript">
	$(function(){
		var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: ["批次名称","工资单模板名称","创建时间","发布情况","最后发布时间","操作"],
	        colModel: [
	            {name: "name",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html='';
	            	html += '<a href="${gzUrl('dzgzd/gzdgl/gzdpc/info.do?id=')}'+rowObject['id']+'" title="'+rowObject['name']+'">'+rowObject['name']+'</a>&nbsp;&nbsp;';
	            	return html;
	            }},
	            {name: "table_name",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "create_time",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines']){
	            		return "";
	            	}
	            	if(rowObject['peCount'] == 0){
	            		return "暂无数据";
	            	}
	            	if(rowObject['peCount'] == rowObject['pe1Count']){
	            		return "全部发布";
	            	}
	            	if(rowObject['peCount'] != rowObject['pe1Count']){
	            		if(rowObject['pe1Count']!=0){
	            			return "部分发布";
	            		} else{
	            			return "尚未发布";
	            		}
	            	}
	            	return "";
	            }},
	            {name: "release_time",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "action",width:350,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines']){
	            		return "";
	            	}
	              	var html='';
	              <#if isDisplay('6_2_6')>		
	            	html += '<a href="${gzUrl('dzgzd/gzdgl/gzdpc/gzdxx/initAdd.do?batchId=')}' + rowObject['id'] + '" title="上传本月工资单">上传本月工资单</a>&nbsp;&nbsp;';
	              </#if>
	              <#if isDisplay('6_2_5_1')>		
	            	html += '<a href="${gzUrl('dzgzd/gzdgl/gzdpc/gzdxx/initList.do?batchId=')}'+key+'" title="工资单明细">工资单明细</a>&nbsp;&nbsp;';
	              </#if>
	               <#if isDisplay('6_2_3')>		
	            	html += '<a href="###" onclick="releaseBatch('+key+')" title="发布">发布</a>&nbsp;&nbsp;';
	              </#if>
	               <#if isDisplay('6_2_4')>	
	            	html += '<a href="${gzUrl('dzgzd/gzdgl/gzdpc/del.do?id=')}'+key+'" title="删除">删除</a>&nbsp;&nbsp;';
	               </#if>	
                	return html;
	            }}
	        ],
	        datatype: "json", //将这里改为使用JSON数据  
	        url:'${gzUrl('dzgzd/gzdgl/gzdpc/list.do')}', //这是Action的请求地址  
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
			caption: "工资单批次列表"
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
	    	window.location.href="${gzUrl('dzgzd/gzdgl/gzdpc/initAdd.do')}";
	    });
	    $("#search").button().click(function( event ) {
	    	event.preventDefault();
	    	jQuery("#dataGrid").jqGrid('setGridParam',{  
                postData:{
                	'tableId':$("#tableId").val(),
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
	    $("#tableId").combobox();
		$("#pageloading").hide();
	});
	
	function releaseBatch(id){
		$.get("${gzUrl('dzgzd/gzdgl/gzdpc/release.do?id=')}" + id, null, releaseBatchCallback);
	}
	
	function releaseBatchCallback(data){
		if(data==1){
			alert("发布成功.");
		} else{
			alert("发布失败.");
		}
		jQuery("#dataGrid").jqGrid('setGridParam',{  
            postData:{
            	'tableId':$("#tableId").val(),
            	'startTime':$("#startTime").val(),
            	'endTime':$("#endTime").val()
            }  
        }).trigger('reloadGrid');
	}
	
	function deleteColumn(id) {
		var goto = confirm("删除后，数据库中的数据也会做相应删除，此操作不可逆，确定要执行？");
		if(goto){
			window.location.href="${gzUrl('dzgzd/gzdgl/gzdpc/delete.do?id=')}" + id;
		}
	}
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：电子工资单->工资单管理</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form" style="padding: 5px; ">
				<form action="" method="post">
					<table border="0" width="830">
					    <tr>
							<td width="330">
							  <label for="tableId" class="query_condition_lbl">工资单模版:</label>
							     <select name="tableId" id="tableId" class="text ui-widget-content" style="width:151px;">
						           <option value="0"></option>
							       <#if payrollTableInfoList?exists>
							   		<#list payrollTableInfoList as payrollTableInfo>
							   		   <option value="${payrollTableInfo.id}">${payrollTableInfo.name}</option>
							   		</#list>
							   	   </#if>	
							   </select>
							</td>
							<td width="500">
								<label for="startTime" class="query_condition_lbl">创建时间:&nbsp;&nbsp;&nbsp;</label>
								<input type="text" id="startTime" name="startTime" class="text ui-widget-content ui-corner-all" />
								-
								<input type="text" id="endTime" name="endTime" class="text ui-widget-content ui-corner-all" />
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="button" id="search" value="搜索" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
							   <#if isDisplay('6_2_2')>	
								<input type="button" id="addBtn" value="创建" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
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
<#include "../../../foot.ftl" />
