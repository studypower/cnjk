<#include "../../head.ftl" />
<script type="text/javascript">
	$(function(){
		var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: ["会议室","人数","基本设备","状态","操作"],
	        colModel: [
	            {name: "name",width:200,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "max_count_use",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "device_names",width:200,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "active",width:80,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	                if(key==1){
	            		return "在用";
	            	} else if(key==-1){
	            		return "不可用";
	            	}
	            }},
	            {name: "",width:200,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines']){
	            		return "";
	            	}
	            	var html='';
	                <#if isDisplay('8_2_4')>	
	            	 html += '<a href="${gzUrl('hysgl/xxwh/info.do?id=')}'+rowObject['id']+'" title="详情">详情</a>&nbsp;&nbsp;&nbsp;';
	            	</#if>
	            	<#if isDisplay('8_2_2')>
                	 html += '<a href="${gzUrl('hysgl/xxwh/initUpdate.do?id=')}'+rowObject['id']+'" title="修改">修改</a>&nbsp;&nbsp;&nbsp;';
                	</#if>
                	<#if isDisplay('8_2_3')>
                	 html += '<a href="javascript:{if(confirm(\'确认要删除该数据吗?\'))window.location=\'${gzUrl('hysgl/xxwh/del.do?id=')}'+rowObject['id']+'\';}" title="删除">删除</a>&nbsp;&nbsp;&nbsp;';
                	</#if> 
                	return html;
	            }}
	        ],
	        datatype: "json", //将这里改为使用JSON数据  
	        url:'${gzUrl('hysgl/xxwh/list.do')}', //这是Action的请求地址  
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
			caption: "会议室信息列表"
	    });
		$("#dataGrid").navGrid("#pager",{edit:false,add:false,del:false,refresh:true,search:false});
		$(document.body).css({"overflow-x":"auto","overflow-y":"auto"});
	    $(window).resize(function(){
	    	var $window=$(window);
			$("#dataGrid").setGridHeight("100%");
			$("#dataGrid").setGridWidth($window.width()-1);
		});
	    $("#search").button().click(function( event ) {
	    	event.preventDefault();
	    	jQuery("#dataGrid").jqGrid('setGridParam',{  
                postData:{
                	'id':$("#id").val(),
                	'active':$("#active").val(),
                }  
            }).trigger('reloadGrid');    
	    });
	    $("#create").button().click(function( event ) {
	    	event.preventDefault();
	    	window.location.href="${gzUrl('hysgl/xxwh/initAdd.do')}";
	    });
	    $("#id").combobox();
	    $("#active").combobox();
		$("#pageloading").hide();
	});
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：会议室申请->会议室管理</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form" style="padding: 5px; ">
				<form action="" method="post">
					<table border="0">
						<tr>
							<td width="80">
								<label for="id" class="query_condition_lbl">会议室:</label>
							</td>
							<td width="200">
								  <select name="id" id="id" class="text ui-widget-content" style="width:151px;">
							    	<option value="0"></option>
							       	<#if meetingRoomInfoList?exists>
							          	<#list meetingRoomInfoList as meetingRoomInfo>	
							   		   	<option value="${meetingRoomInfo.id}">${meetingRoomInfo.name}</option>
							   		  	</#list> 
							   	   	</#if>	
							      </select>
							</td>
						    <td width="80">
						      	<label for="active" class="query_condition_lbl">状态:</label>
						     </td>
						    <td width="200">
						      	<select name="active" id="active" class="text ui-widget-content" style="width:151px;">
							    	<option value="0"></option>	
							   		<option value="1">在用</option>
							   		<option value="-1">装修</option>
							      </select>
					        </td>
				    	</tr>
						<tr>
							<td colspan="3">
								<input type="button" id="search" value="搜索" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
								<#if isDisplay('8_2_1')>
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
