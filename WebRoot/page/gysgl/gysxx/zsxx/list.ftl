<#include "../../../head.ftl" />
<script type="text/javascript">
	$(function(){
		var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: ["供应商名称","证书类别","证书编号","证书附件","到期时间","操作"],
	        colModel: [
	            {name: "supplier_name",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html='';
	            	html += '<a href="${gzUrl('gysgl/gysxx/zsxx/info.do?id=')}' + rowObject['id'] + '" title="'+rowObject['supplier_name']+'">'+rowObject['supplier_name']+'</a>';
	            	return html;
	            }},
	            {name: "type_name",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "num",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html='';
	            	if(rowObject['expiry_status']==2){
	            		html += "<font color='red'>";
	            	} else if(rowObject['expiry_status']==1){
	            		html += "<font color='#0000FF'>";
	            	} else{
	            		html += "<font>";
	            	}
	            	html += key;
	            	html += "</font>";
	            	return html;
	            }},
	            {name: "file_url1", width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html='';
	            	html += '<a href="${gzUrl('')}' + key + '" title="点击查看" target="_blank">点击查看</a>';
	            	return html;
	            }},
	            {name: "expiry_time",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines']){
	            		return "";
	            	}
	            	var html='';
	            	<#if isDisplay('4_1_5_2')>	
	            	   html += '<a href="${gzUrl('gysgl/gysxx/zsxx/info.do?id=')}' + rowObject['id'] + '" title="详情">详情</a>';
	            	</#if> 
	            	html += '&nbsp;&nbsp;&nbsp;&nbsp;';
	                <#if isDisplay('4_1_5_3')>	  
	            	   html += '<a href="${gzUrl('gysgl/gysxx/zsxx/initUpdate.do?id=')}' + rowObject['id'] + '" title="修改">修改</a>';
	            	</#if>  
	            	html += '&nbsp;&nbsp;&nbsp;&nbsp;';
	            	<#if isDisplay('4_1_5_4')>	  
	            	   html += '<a href="${gzUrl('gysgl/gysxx/zsxx/delete.do?id=')}' + rowObject['id'] + '&supplierId=${supplierInfo.id}" title="删除">删除</a>';
	            	</#if>	     
	            	return html;
	            }}
	        ],
	        datatype: "json", //将这里改为使用JSON数据  
	        url:'${gzUrl('gysgl/gysxx/zsxx/list.do')}', //这是Action的请求地址  
	        mtype: 'POST',
	        postData:{
            	'supplierId':${supplierInfo.id}
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
			caption: "供应商信息列表"
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
	    	window.location.href="${gzUrl('gysgl/gysxx/zsxx/initAdd.do?supplierId=')}${supplierInfo.id}";
	    });
	    $("#type").combobox();
		$("#pageloading").hide();
	});
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：供应商管理->供应商信息->证书信息</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form" style="padding: 5px; ">
				<form action="" method="post">
					<table border="0" width="730">
						<tr>
							<td colspan="3">
								<#if isDisplay('4_1_5_5')>	
								<input type="button" id="create" value="创建" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
						     	</#if>	
						     	&nbsp;&nbsp;&nbsp;&nbsp;
							  	<font color='red' style="font-size:16px;">红色：</font><font style="font-size:16px;">执照已过期</font>&nbsp;&nbsp;&nbsp;&nbsp;
								<font color='#0000FF' style="font-size:16px;">深蓝色：</font><font style="font-size:16px;">执照即将过期</font>	
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
