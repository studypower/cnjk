<#include "../../head.ftl" />
<script type="text/javascript">
	$(function(){
		var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: ["供应商名称","所属采购单名称","采购单类别","采购设备名称","资产类别","设备品牌","设备型号","设备单价","采购数量"],
	        colModel: [
	            {name: "supplierName",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	                return key;
	            }},
	            {name: "name",width:250,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "type",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	                if(key==0){
	            		return "一般物品采购";
	            	}else if(key==1){
	            		return "宣传品采购";
	            	}else if(key==2){
	            		return "一般设备";
	            	}else if(key==3){
	            		return "专业设备";
	            	}
	            }},
	            {name: "deviceName",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "deviceTypeName",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	                return key;
	            }},
	            {name: "brandName",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "brandFormatName",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "deviceMoney",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	                 return key;
	            }},
	            {name: "amount",width:80,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines']){
	            		return "";
	            	}
	               return key;
	            }}
	        ],
	        datatype: "json", //将这里改为使用JSON数据  
	        url:'${gzUrl('gysgl/gyscgcx/listByOrder.do')}', //这是Action的请求地址  
	        mtype: 'POST',
	        postData:{
            	'id':$("#id").val()
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
			caption: "供应商物品采购列表"
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
                	'id':$("#id").val(),
                	'startTime':$("#startTime").val(),
                	'endTime':$("#endTime").val(),
                }  
            }).trigger('reloadGrid');    
	    });
	    $("#startTime").datepicker({
			dateFormat: "yy-mm-dd"
		});
	    $("#endTime").datepicker({
			dateFormat: "yy-mm-dd"
		});
	    $("#id").combobox();
		$("#pageloading").hide();
	});
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：供应商管理->供应商物品采购查询</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form" style="padding: 5px; ">
				<form action="" method="post">
					<table border="0" width="830">
						<tr>
							<td width="330">
							  <label for="id" class="query_condition_lbl">供应商:</label>
							    <select name="id" id="id" class="text ui-widget-content" style="width:151px;">
							       <#if supplierInfoList?exists>
							   		<#list supplierInfoList as supplierInfo>
							   		   <option value="${supplierInfo.id}">${supplierInfo.name}</option>
							   		</#list>
							   	   </#if>	
							   </select>
							</td>
						   <td width="500">
							<label for="startTime" class="query_condition_lbl">采购日期:</label>
							<input type="text" id="startTime" name="startTime" class="text ui-widget-content ui-corner-all" />
							-
							<input type="text" id="endTime" name="endTime" class="text ui-widget-content ui-corner-all" />
						</td>
				    	</tr>
						<tr>
							<td colspan="3">
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
<#include "../../foot.ftl" />
