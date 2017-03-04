<#include "../../head.ftl" />
<script type="text/javascript">
	$(function(){
		var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: ["年度","供应商名称","供应商类别","价格级别","品质级别","服务级别","综合级别","备注","评审时间"],
	        colModel: [
	            {name: "year",width:80,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "supplier_name",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "data_supplier_type",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "price_level",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	if(key==1){
	            		return "优秀";
	            	} else if(key==2){
	            		return "合格";
	            	} else if(key==3){
	            		return "不合格";
	            	}
	            }},
	            {name: "quality_level", width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	if(key==1){
	            		return "优秀";
	            	} else if(key==2){
	            		return "合格";
	            	} else if(key==3){
	            		return "不合格";
	            	}
	            }},
	            {name: "service_level",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	if(key==1){
	            		return "优秀";
	            	} else if(key==2){
	            		return "合格";
	            	} else if(key==3){
	            		return "不合格";
	            	}
	            }},
	            {name: "complex_level",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	if(key==1){
	            		return "优秀";
	            	} else if(key==2){
	            		return "合格";
	            	} else if(key==3){
	            		return "不合格";
	            	}
	            }},
	            {name: "remark",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
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
	            }}
	        ],
	        datatype: "json", //将这里改为使用JSON数据  
	        url:'${gzUrl('gysgl/gysnj/list.do')}', //这是Action的请求地址  
	        mtype: 'POST',
	        postData:{
            	'supplierId':$("#supplierId").val()
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
			caption: "供应商年度评审记录信息列表"
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
                	'supplierId':$("#supplierId").val(),
                	'startTime':$("#startTime").val(),
                	'endTime':$("#endTime").val()
                }  
            }).trigger('reloadGrid');    
	    });
	    $("#create").button().click(function( event ) {
	    	event.preventDefault();
	    	window.location.href="${gzUrl('gysgl/gysnj/initAdd.do')}";
	    });
	    $("#startTime").datepicker({
			dateFormat: "yy-mm-dd"
		});
	    $("#endTime").datepicker({
			dateFormat: "yy-mm-dd"
		});
	    $("#supplierId").combobox();
		$("#pageloading").hide();
	});
	
	function infoObj(id) {
		$("#dialog").dialog({
    		 height: 450,
    		 width: 650,
    		 modal: true,
    		 resizable: false,
    		 close: function( event, ui ) {
    			 $("#dialog_iframe").css("display","none");
    		 },
    		 buttons:[
    		 {
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
    	$("#dialog_iframe").attr("src","${gzUrl('gysgl/gysnj/info.do')}?id=" + id + "&randomNum=" + Math.random());
	}
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：供应商管理->供应商年度评审记录</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form" style="padding: 5px; ">
				<form action="" method="post">
					<table border="0" width="930">
						<tr>
							<td width="330">
								<label for="supplierId" class="query_condition_lbl">供应商名称:</label>
							    <select name="supplierId" id="supplierId" class="text ui-widget-content" style="width:151px;">
							    	<option value="-100">全部</option>
							   		<#list supplierInfoList as supplierInfo>
							   		<option value="${supplierInfo.id}">${supplierInfo.name}</option>
							   		</#list>
							    </select>
							</td>
							<td width="600">
								<label for="startTime" class="query_condition_lbl">评审时间:</label>
								<input type="text" id="startTime" name="startTime" class="text ui-widget-content ui-corner-all" />
								-
								<input type="text" id="endTime" name="endTime" class="text ui-widget-content ui-corner-all" />
							</td>
				    	</tr>
						<tr>
							<td>
								<input type="button" id="search" value="搜索" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
								<#if isDisplay('4_3_2')>	
								   <input type="button" id="create" value="创建年度评审信息" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
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
	<div id="dialog" title="供应商评审详细" style="padding: 0px;">
		<iframe id="dialog_iframe" name="dialog_iframe" src="" frameborder="0" width="100%" height="100%" style="overflow: hidden;display: none;"></iframe>
	</div>
</body>
<#include "../../foot.ftl" />
