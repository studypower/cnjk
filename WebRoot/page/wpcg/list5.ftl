<#include "../head.ftl" />
<script type="text/javascript">
	$(function(){
		var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: ["采购单编号","采购方式","采购物品","采购申请时间","当前流程","操作"],
	        colModel: [
	            {name: "name",width:200,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html = "";
	            	html += "<a href='${gzUrl('wpcg/info.do?id=')}" + rowObject['id'] + "'>"
	            	if(rowObject['canYs']!=null && rowObject['canYs']!="" && rowObject['canYs']!=0){
	            		html += "<font color='red'>";
	            	} else if(${step}==rowObject['step'] && (rowObject['status']==0 || rowObject['status']==1)){
	            		html += "<font color='red'>";
	            	} else if(${step}==rowObject['step']-1 && rowObject['status']==-1){
	            		html += "<font color='red'>";
	            	} else if(${step}!=rowObject['step']-1 && rowObject['status']==-1){
	            		html += "<font color='#A52A2A'>";
	            	} else if(rowObject['step']==6 && rowObject['status']==2){
	            		html += "<font color='#0000FF'>";
	            	}
	            	html += key + "</font></a>";
	            	return html;
	            }},
	            {name: "type",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html = "";
	            	if(rowObject['canYs']!=null && rowObject['canYs']!="" && rowObject['canYs']!=0){
	            		html += "<font color='red'>";
	            	} else if(${step}==rowObject['step'] && (rowObject['status']==0 || rowObject['status']==1)){
	            		html += "<font color='red'>";
	            	} else if(${step}==rowObject['step']-1 && rowObject['status']==-1){
	            		html += "<font color='red'>";
	            	} else if(${step}!=rowObject['step']-1 && rowObject['status']==-1){
	            		html += "<font color='#A52A2A'>";
	            	} else if(rowObject['step']==6 && rowObject['status']==2){
	            		html += "<font color='#0000FF'>";
	            	}
	            	if(key==0){
	            		html += "科室采购";
	            	} else if(key==2){
	            		html += "政府采购";
	            	} else if(key==3){
	            		html += "集中采购";
	            	}
	            	html += "</font>";
	            	return html;
	            }},
	            {name: "entryNames",width:200,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html = "";
	            	if(${step}==rowObject['step'] && (rowObject['status']==0 || rowObject['status']==1)){
	            		html += "<font color='red'>";
	            	} else if(${step}==rowObject['step']-1 && rowObject['status']==-1){
	            		html += "<font color='red'>";
	            	} else if(${step}!=rowObject['step']-1 && rowObject['status']==-1){
	            		html += "<font color='#A52A2A'>";
	            	} else if(rowObject['step']==6 && rowObject['status']==2){
	            		html += "<font color='#0000FF'>";
	            	}
	            	html += key + "</font>";
	            	return html;
	            }},
	            {name: "create_time",width:160,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html = "";
	            	if(rowObject['canYs']!=null && rowObject['canYs']!="" && rowObject['canYs']!=0){
	            		html += "<font color='red'>";
	            	} else if(${step}==rowObject['step'] && (rowObject['status']==0 || rowObject['status']==1)){
	            		html += "<font color='red'>";
	            	} else if(${step}==rowObject['step']-1 && rowObject['status']==-1){
	            		html += "<font color='red'>";
	            	} else if(${step}!=rowObject['step']-1 && rowObject['status']==-1){
	            		html += "<font color='#A52A2A'>";
	            	} else if(rowObject['step']==6 && rowObject['status']==2){
	            		html += "<font color='#0000FF'>";
	            	}
	            	html += key + "</font>";
	            	return html;
	            }},
	            {name: "",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines']){
	            		return "";
	            	}
	            	var html = "";
	            	if(rowObject['canYs']!=null && rowObject['canYs']!="" && rowObject['canYs']!=0){
	            		html += "<font color='red'>";
	            	} else if(${step}==rowObject['step'] && (rowObject['status']==0 || rowObject['status']==1)){
	            		html += "<font color='red'>";
	            	} else if(${step}==rowObject['step']-1 && rowObject['status']==-1){
	            		html += "<font color='red'>";
	            	} else if(${step}!=rowObject['step']-1 && rowObject['status']==-1){
	            		html += "<font color='#A52A2A'>";
	            	} else if(rowObject['step']==6 && rowObject['status']==2){
	            		html += "<font color='#0000FF'>";
	            	}
	            	if(rowObject['step']==0){
	            		html += "采购登记";
	            	} else if(rowObject['step']==1){
	            		if(rowObject['type']==0){
	            			html += "科室采购";
	            		} else if(rowObject['type']==2){
	            			html += "政府采购";
	            		} else if(rowObject['type']==3){
	            			html += "集中采购";
	            		}
	            	} else if(rowObject['step']==2){
	            		html += "比价审核";
	            	} else if(rowObject['step']==3){
	            		html += "比价审核";
	            	} else if(rowObject['step']==4){
	            		html += "资产采购";
	            	} else if(rowObject['step']==5){
	            		html += "资产验收";
	            	} else if(rowObject['step']==6){
	            		html += "资产入库";
	            	}
	            	html += "-->";
	            	if(rowObject['status']==-1){
	            		html += "驳回";
	            	} else if(rowObject['status']==0){
	            		html += "待处理";
	            	} else if(rowObject['status']==1){
	            		if(rowObject['step']==4){
	            			html += "部分采购";
	            		} else if(rowObject['step']==5){
	            			html += "部分验收";
	            		} else if(rowObject['step']==6){
	            			html += "部分入库";
	            		} else{
	            			html += "已完结";
	            		}
	            	} else if(rowObject['status']==2){
	            		html += "已完结";
	            	}
	            	html += "</font>";
	            	return html;
	            }},
	            {name: "",width:200,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines']){
	            		return "";
	            	}
                    var html='';
                    html += '<a href="${gzUrl('wpcg/info.do?id=')}' + rowObject['id'] + '" title="详情">详情</a>&nbsp;&nbsp;';
                	if(rowObject['step']==5 && rowObject['status']==0){
                		html += '<a href="${gzUrl('wpcg/initAcceptance.do?step=5&id=')}' + rowObject['id'] + '" title="验收">验收</a>';
                	}
            	    return html;
	            }}
	        ],
	        datatype: "json", //将这里改为使用JSON数据  
	        url:'${gzUrl('wpcg/list.do')}', //这是Action的请求地址  
	        mtype: 'POST',
	        postData:{
	        	'fundsApplyId':$("#fundsApplyNum").val(),
	        	'name':$("#name").val(),
	        	'startTime':$("#startTime").val(),
	        	'endTime':$("#endTime").val(),
	        	'step':${step}
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
			caption: "采购申请列表"
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
                	'fundsApplyNum':$("#fundsApplyNum").val(),
		        	'name':$("#name").val(),
		        	'startTime':$("#startTime").val(),
		        	'endTime':$("#endTime").val(),
	        		'step':${step}
                }  
            }).trigger('reloadGrid');    
	    });
	    $("#create").button().click(function( event ) {
	    	event.preventDefault();
	    	window.location.href="${gzUrl('wpcg/initfundsApplyInfoList.do')}";
	    });
	    $("#startTime").datepicker({
			dateFormat: "yy-mm-dd"
		});
		$("#endTime").datepicker({
			dateFormat: "yy-mm-dd"
		});
		$("#applyType").combobox();
		$("#applyStaffId").combobox();
		$("#status").combobox();
		$("#pageloading").hide();
	});
	
	function deleteObj(id) {
		var goto = confirm("删除后，数据库中的数据也会做相应删除，此操作不可逆，确定要执行？");
		if(goto){
			window.location.href="${gzUrl('clgl/ycsq/delete.do')}?id=" + id;
		}
	}
	
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
    	$("#dialog_iframe").attr("src","${gzUrl('hysgl/sq/info.do')}?id=" + id + "&randomNum=" + Math.random());
	}
	
	function auditObj(id) {
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
    			 text:"通过",
    			 click:function(){
    			 	$.get("${gzUrl('hysgl/sq/audit.do')}?status=1&id="+ id + "&randomNum=" + Math.random(), null, auditCallback);
    			 }
    		 },
    		 {
    			 text:"驳回",
    			 click:function(){
    			 	$.get("${gzUrl('hysgl/sq/audit.do')}?status=-1&id="+ id + "&randomNum=" + Math.random(), null, auditCallback);
    			 }
    		 },
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
    	$("#dialog_iframe").attr("src","${gzUrl('hysgl/sq/info.do')}?id=" + id + "&randomNum=" + Math.random());
	}
	
	function auditCallback(data){
		if(data==0){
			alert("审批失败！");
		} else{
			jQuery("#dataGrid").jqGrid('setGridParam',{  
	            postData:{
	            }  
	        }).trigger('reloadGrid');
			$("#dialog").dialog("close");
			$("#dialog_iframe").attr("src","${gzUrl('page/blank.html')}");
		}
	}
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：<#if step?if_exists==-1>物品采购->采购查询<#elseif step?if_exists==0>物品采购->资产管理员<#elseif step?if_exists==1>物品采购->采购比价<#elseif step?if_exists==2>物品采购->报价审核(普通小组)<#elseif step?if_exists==3>物品采购->报价审核(领导小组)<#elseif step?if_exists==4>物品采购->资产采购<#elseif step?if_exists==5>物品采购->资产验收<#elseif step?if_exists==6>物品采购->资产入库</#if></div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form" style="padding: 5px; ">
				<form action="" method="post">
					<table border="0" width="500">
						<tr>
							<td width="250">
							    <label for="name" class="query_condition_lbl">经费编号:</label>
								<input id="fundsApplyNum" name="fundsApplyNum" type="text" class="text ui-widget-content ui-corner-all"/>
							</td>
							<td width="250">
								<label for="name" class="query_condition_lbl">采购编号:</label>
								<input id="name" name="name" type="text" class="text ui-widget-content ui-corner-all"/>
							</td>
				    	</tr>
				    	<tr>
							<td colspan="2">
								<label for="name" class="query_condition_lbl">采购日期:</label>
								<input id="startTime" name="startTime" type="text" class="text ui-widget-content ui-corner-all"/>
								<label class="query_condition_lbl">至</label>
								<input id="endTime" name="endTime" type="text" class="text ui-widget-content ui-corner-all"/>
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
	<div id="dialog" title="会议室申请明细" style="padding: 0px;">
		<iframe id="dialog_iframe" name="dialog_iframe" src="" frameborder="0" width="100%" height="100%" style="overflow: hidden;display: none;"></iframe>
	</div>
</body>
<#include "../foot.ftl" />
