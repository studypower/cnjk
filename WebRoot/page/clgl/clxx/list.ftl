<#include "../../head.ftl" />
<script type="text/javascript">
    var step = 0;
    <#if step?exists>
    step = ${step}; 
    </#if>
	$(function(){
		var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: ["车辆名称","车牌号","座位数量","状态","操作"],
	        colModel: [
	            {name: "brand_name",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "id_num",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "seats_num",width:80,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "status",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	if(key==1){
	            		return "正常";
	            	} else if(key==0){
	            		return "保养";
	            	} else if(key==-1){
	            		return "维修";
	            	} else{
	            		return "未知";
	            	}
	            }},
	            {name: "action",width:200,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines']){
	            		return "";
	            	}
	                var html='';
	                <#if isDisplay('1_2_2')>
	            	  html += '<a href="${gzUrl('clgl/clxx/info.do?id=')}'+rowObject['id']+'" title="详情">详情</a>&nbsp;&nbsp;&nbsp;&nbsp;';
	            	</#if>
	            	<#if isDisplay('1_2_3')>  
	            	  html += '<a href="${gzUrl('clgl/clxx/initUpdate.do?id=')}'+rowObject['id']+'" title="修改">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;';
	            	</#if>
	            	<#if isDisplay('1_2_4')>  
	            	  html += '<a href="###" onclick="deleteObj(' + rowObject['id'] + ')" title="删除">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;';
	            	</#if>  
	            	return html;
	            }}
	        ],
	        datatype: "json", //将这里改为使用JSON数据  
	        url:'${gzUrl('clgl/clxx/list.do')}', //这是Action的请求地址  
	        mtype: 'POST',
	        postData:{
	        	'brandName':$("#key").val(),
            	'status':$("#status").val(),
            	'idNum':$("#idNum").val(),
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
			caption: "车辆管理列表"
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
                	'brandName':$("#key").val(),
                	'status':$("#status").val(),
                	'idNum':$("#idNum").val(),
                	'startTime':$("#startTime").val(),
                	'endTime':$("#endTime").val()
                }  
            }).trigger('reloadGrid');    
	    });
	    $("#create").button().click(function( event ) {
	    	event.preventDefault();
	    	window.location.href="${gzUrl('clgl/clxx/initAdd.do')}";
	    });
	    $("#startTime").datepicker({
			dateFormat: "yy-mm-dd"
		});
	    $("#endTime").datepicker({
			dateFormat: "yy-mm-dd"
		});
		$("#status").combobox();
		$("#pageloading").hide();
	});
	function deleteObj(id) {
		var goto = confirm("此操作不可逆，确定要执行删除？");
		if(goto){
			window.location.href="${gzUrl('clgl/clxx/delete.do')}?id=" + id;
		}
	}
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：车辆申请->车辆管理</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form" style="padding: 5px; ">
				<form action="" method="post">
					<table border="0" width="950">
						<tr>
							<td width="250">
								<label for="brandName" class="query_condition_lbl">车辆名称:</label>
								<input type="text" id="brandName" name="brandName" class="text ui-widget-content ui-corner-all"/>
							</td>
							<td width="250">
								<label for="idNum" class="query_condition_lbl">车牌号:&nbsp;&nbsp;&nbsp;</label>
								<input type="text" id="idNum" name="idNum" class="text ui-widget-content ui-corner-all"/>
							</td>
							<td>
								<label for="status" class="query_condition_lbl">车辆状态:</label>
								<select id="status" name="status" class="select01" style="width:151px;">
		                    		<option value="-100">全部</option>
		                    		<option value="1">正常</option>
		                    		<option value="0">保养</option>
		                    		<option value="-1">维修</option>
		                    		<option value="-2">外借</option>
		                    		<option value="-3">其他</option>
		                        </select>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<label for="startTime" class="query_condition_lbl">购车日期:</label>
								<input type="text" id="startTime" name="startTime" class="text ui-widget-content ui-corner-all" />
								-
								<input type="text" id="endTime" name="endTime" class="text ui-widget-content ui-corner-all" />
							</td>
				    	</tr>
				    	<tr>
							<td colspan="2">
								<input type="button" id="search" value="搜索" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
								<#if isDisplay('1_2_5')>  
								  <input type="button" id="create" value="创建" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
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
