<#include "../../../head.ftl" />
<script type="text/javascript">
	$(function(){
		var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: ["模板名称","模板版本号","操作"],
	        colModel: [
	            {name: "name",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "version",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "action",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines']){
	            		return "";
	            	}
	              	var html='';
	              <#if isDisplay('6_1_3')> 
	            	html += '<a href="###" onclick="exportFile('+key+')" title="下载">下载</a>&nbsp;&nbsp;';
	             </#if>	
                	return html;
	            }}
	        ],
	        datatype: "json", //将这里改为使用JSON数据  
	        url:'${gzUrl('dzgzd/gzdgl/gzdmbxz/list.do')}', //这是Action的请求地址  
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
			caption: "工资单模板列表"
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
                	'id':$("#id").val()
                }  
            }).trigger('reloadGrid');    
	    });
		$("#pageloading").hide();
		 $("#id").combobox();
	});
	
	function exportFile(id){
	    $.get("${gzUrl('dzgzd/gzdgl/gzdmbxz/export.do')}?id="+id,null,callback);
	}
	
	function callback(data){
		var result = eval("("+data+")");
      	if(result[0]==1){
        	window.open('${gzUrl('')}'+result[1]);
      	} else{
        	alert("下载失败");
      	}
	}
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：电子工资单->工资单模板</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form" style="padding: 5px; ">
				<form action="" method="post">
					<table border="0" width="730">
					  	<tr>
							<td colspan="2">
								<label for="tableId" class="query_condition_lbl">工资单模板:</label>
								<select id="id" name="id" class="select01">
								    <option value="0"></option>
								   <#if payrollTableInfoList?exists>
		                    		<#list payrollTableInfoList as _payrollTableInfo>
		                    			<option value="${_payrollTableInfo.id}">${_payrollTableInfo.name}</option>
		                    		</#list>
		                    	   </#if>	
		                       	</select> 
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
</body>
<#include "../../../foot.ftl" />
