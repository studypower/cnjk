<#include "../../head.ftl" />
<script type="text/javascript">
	$(function(){
		var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: ["人员","分管科室","操作"],
	        colModel: [
	            {name: "staffName",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	                var html='';
	            	html += '<a href="${gzUrl('rygl/fgfw/info.do?id=')}'+rowObject['id']+'" title="'+rowObject['staffName']+'">'+rowObject['staffName']+'</a>&nbsp;&nbsp;';
                	return html;
	            }},
	            {name: "departmentNames",width:300,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "",width:200,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines']){
	            		return "";
	            	}
	            	var html='';
                	html += '<a href="${gzUrl('rygl/fgfw/initUpdate.do?id=')}'+rowObject['id']+'" title="修改">修改</a>';
                	html += '&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:del('+rowObject['id']+')" title="删除">删除</a>';
                	return html;
	            }}
	        ],
	        datatype: "json", //将这里改为使用JSON数据  
	        url:'${gzUrl('rygl/fgfw/list.do')}', //这是Action的请求地址  
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
			caption: "分管范围列表"
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
                	'staffId':$("#staffId").val()
                }  
            }).trigger('reloadGrid');    
	    });
	    $("#create").button().click(function( event ) {
	    	event.preventDefault();
	    	window.location.href="${gzUrl('rygl/fgfw/initAdd.do')}";
	    });
	    $("#staffId").combobox();
		$("#pageloading").hide();
	});
	
	function del(id){
		$.get("${gzUrl('rygl/fgfw/del.do')}?id="+ id +"&timestamp=" + Date.parse(new Date()), null, callback);
	}
	
	function callback(data){
		jQuery("#dataGrid").jqGrid('setGridParam',{  
            postData:{
            	'staffId':$("#staffId").val()
            }  
        }).trigger('reloadGrid');    
	}
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：人员管理->分管范围</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form" style="padding: 5px; ">
				<form action="" method="post">
					<table border="0" width="730">
						<tr>
							<td width="230">
								<label for="staffId" class="query_condition_lbl">职工:</label>
								<select name="staffId" id="staffId" class="text ui-widget-content" style="width:151px;">
					           		<option value="0">不限</option>
					             	<#if staffInfoList?exists>
        	                        <#list staffInfoList as staffInfo>
                                    <option value="${staffInfo.id}">${staffInfo.name}</option>
                                    </#list>
                                 	</#if>    
							    </select>
							</td>
						    <td width="500">
						      	<label for="sexy" class="query_condition_lbl"></label>
					        </td>
				    	</tr>
						<tr>
							<td colspan="3">
								<input type="button" id="search" value="搜索" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
								<input type="button" id="create" value="创建" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
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
