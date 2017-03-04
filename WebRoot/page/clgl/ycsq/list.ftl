<#include "../../head.ftl" />
<script type="text/javascript">
	$(function(){
		var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: ["申请时间","申请类型","车辆名称","目的地","用车时间","申请科室","申请人","状态","操作"],
	        colModel: [
	            {name: "create_time",width:120,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html = "";
	            	if(rowObject['status']==0){
	            		html += "<font color='red'>";	
	            	} else {
	            		html += "<font>";
	            	}
	            	html += rowObject['create_time'].split(" ")[0] + "<br/>" + rowObject['create_time'].split(" ")[1];
	            	html += "</font>";
	            	return html;
	            }},
	            {name: "apply_type",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html = "";
	            	if(rowObject['status']==0){
	            		html += "<font color='red'>";	
	            	} else {
	            		html += "<font>";
	            	}
	            	if(key==0){
	            		html += "空车";
	            	} else {
	            		html += "拼车";
	            	}
	            	html += "</font>";
	            	return html;
	            }},
	            {name: "brand_name",width:80,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html = "";
	            	if(rowObject['status']==0){
	            		html += "<font color='red'>";	
	            	} else {
	            		html += "<font>";
	            	}
	            	html += key;
	            	html += "</font>";
	            	return html;
	            }},
	            {name: "destination",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html = "";
	            	if(rowObject['status']==0){
	            		html += "<font color='red'>";	
	            	} else {
	            		html += "<font>";
	            	}
	            	html += key;
	            	html += "</font>";
	            	return html;
	            }},
	            {name: "",width:120,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines']){
	            		return "";
	            	}
	            	var html = "";
	            	if(rowObject['status']==0){
	            		html += "<font color='red'>";	
	            	} else {
	            		html += "<font>";
	            	}
	            	html += rowObject['start_time'].split(" ")[0] + "<br/>(" + rowObject['start_time'].split(" ")[1] + "~" + rowObject['end_time'].split(" ")[1] + ")";
	            	html += "</font>";
	            	return html;
	            }},
	            {name: "department_name",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html = "";
	            	if(rowObject['status']==0){
	            		html += "<font color='red'>";	
	            	} else {
	            		html += "<font>";
	            	}
	            	html += key;
	            	html += "</font>";
	            	return html;
	            }},
	            {name: "staff_name",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html = "";
	            	if(rowObject['status']==0){
	            		html += "<font color='red'>";	
	            	} else {
	            		html += "<font>";
	            	}
	            	html += key;
	            	html += "</font>";
	            	return html;
	            }},
	            {name: "status",width:60,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	if(key==0){
	            		return "待审批";
	            	} else if(key==1){
	            		return "通过";
	            	} else if(key==-1){
	            		return "驳回/取消";
	            	} else if(key==-2){
	            		return "取消";
	            	} else{
	            		return "未知";
	            	}
	            }},
	            {name: "action",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines']){
	            		return "";
	            	}
	                var html='';
	            	html += '<a href="###" onclick="infoObj('+rowObject['id']+')" title="详情">详情</a>';
	            	if(rowObject['status']==0){
	            	  	<#if isDisplay('1_1_3')>	
	            		html += '&nbsp;&nbsp;<a href="###" onclick="auditObj('+rowObject['id']+')" title="审核">审核</a>';
	            	  	</#if>
	            	  	if(${Session.currentUser.staffId} == rowObject['apply_staff_id']){
	            	  		html += '&nbsp;&nbsp;<a href="###" onclick="del('+rowObject['id']+')" title="删除">删除</a>';
	            	  	}
	            	} else if(rowObject['status']==1 && rowObject['apply_type']==0){
	            		<#if isDisplay('1_1_3')>
	            		var date0 = new Date();
	            		var date1 = rowObject['start_time'].replace(/-/g, "/");
	            		if(Date.parse(date0) < Date.parse(date1)){
		            		html += '&nbsp;&nbsp;<a href="###" onclick="cancelObj('+rowObject['id']+')" title="取消">取消</a>';
	            		}
	            		</#if>
	            	}
	            	return html;
	            }}
	        ],
	        datatype: "json", //将这里改为使用JSON数据  
	        url:'${gzUrl('clgl/ycsq/list.do')}', //这是Action的请求地址  
	        mtype: 'POST',
	        postData:{
	        	'carId':$("#carId").val(),
            	'applyType':$("#applyType").val(),
            	'applyDepartmentId':$("#applyDepartmentId").val(),
            	'applyStaffId':$("#applyStaffId").val(),
            	'status':$("#status").val(),
            	'startTime':$("#startTime").val(),
            	'endTime':$("#endTime").val()
            	<#if from?if_exists ="welcome" >,'from':'welcome'</#if>
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
			caption: "用车申请记录列表"
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
                	'carId':$("#carId").val(),
                	'applyType':$("#applyType").val(),
                	'applyDepartmentId':$("#applyDepartmentId").val(),
                	'status':$("#status").val(),
                	'startTime':$("#startTime").val(),
                	'endTime':$("#endTime").val()
                	<#if from?if_exists ="welcome" >,'from':'welcome'</#if>
                }  
            }).trigger('reloadGrid');    
	    });
	    $("#create").button().click(function( event ) {
	    	event.preventDefault();
	    	window.location.href="${gzUrl('clgl/ycsq/initCalendar.do')}";
	    });
	    $("#audit").button().click(function( event ) {
	    	event.preventDefault();
	    	window.location.href="${gzUrl('clgl/ycsq/initCalendar.do')}";
	    });
	    $("#startTime").datetimepicker({
			timeText: '时间',  
           	hourText: '小时',  
           	minuteText: '分钟',  
           	secondText: '秒',  
           	currentText: '现在',  
           	closeText: '完成',  
           	showSecond: false, //显示秒 
           	timeFormat: 'hh:mm:ss'//格式化时间  
		});
		$("#endTime").datetimepicker({
			timeText: '时间',  
           	hourText: '小时',  
           	minuteText: '分钟',  
           	secondText: '秒',  
           	currentText: '现在',  
           	closeText: '完成',  
           	showSecond: false, //显示秒 
           	timeFormat: 'hh:mm:ss'//格式化时间  
		});
		$("#createTime").datepicker({
			dateFormat: "yy-mm-dd"
		});
		$("#carId").combobox();
		$("#applyType").combobox();
		$("#applyDepartmentId").combobox();
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
    		 width: 670,
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
    	$("#dialog_iframe").attr("src","${gzUrl('clgl/ycsq/info.do')}?id=" + id + "&randomNum=" + Math.random());
	}
	
	function auditObj(id) {
		$("#dialog").dialog({
    		 height: 450,
    		 width: 670,
    		 modal: true,
    		 resizable: false,
    		 close: function( event, ui ) {
    			 $("#dialog_iframe").css("display","none");
    		 },
    		 buttons:[
    		 {
    			 text:"通过",
    			 click:function(){
    			 	$.get("${gzUrl('clgl/ycsq/audit.do')}?status=1&id="+ id + "&randomNum=" + Math.random(), null, auditCallback);
    			 }
    		 },
    		 {
    			 text:"驳回",
    			 click:function(){
    			 	$.get("${gzUrl('clgl/ycsq/audit.do')}?status=-1&id="+ id + "&randomNum=" + Math.random(), null, auditCallback);
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
    	$("#dialog_iframe").attr("src","${gzUrl('clgl/ycsq/info.do')}?id=" + id + "&randomNum=" + Math.random());
	}
	
	function auditCallback(data){
		if(data==0){
			alert("审批失败！");
		} else{
			jQuery("#dataGrid").jqGrid('setGridParam',{  
	            postData:{
                	'carId':$("#carId").val(),
                	'applyType':$("#applyType").val(),
                	'applyDepartmentId':$("#applyDepartmentId").val(),
                	'status':$("#status").val(),
                	'startTime':$("#startTime").val(),
                	'endTime':$("#endTime").val()
                	<#if from?if_exists ="welcome" >,'from':'welcome'</#if>
	            }  
	        }).trigger('reloadGrid');
			$("#dialog").dialog("close");
			$("#dialog_iframe").attr("src","${gzUrl('page/blank.html')}");
		}
	}
	
	function del(id){
		$.get("${gzUrl('clgl/ycsq/del.do')}?id="+ id + "&randomNum=" + Math.random(), null, delCallback);
	}
	
	function delCallback(data){
		jQuery("#dataGrid").jqGrid('setGridParam',{  
            postData:{
            	'carId':$("#carId").val(),
            	'applyType':$("#applyType").val(),
            	'applyDepartmentId':$("#applyDepartmentId").val(),
            	'status':$("#status").val(),
            	'startTime':$("#startTime").val(),
            	'endTime':$("#endTime").val()
            }  
        }).trigger('reloadGrid');
	}
	
	function cancelObj(id){
		$.get("${gzUrl('clgl/ycsq/cancel.do')}?id="+ id + "&randomNum=" + Math.random(), null, cancelObjCallback);
	}
	
	function cancelObjCallback(data){
		jQuery("#dataGrid").jqGrid('setGridParam',{  
            postData:{
            	'carId':$("#carId").val(),
            	'applyType':$("#applyType").val(),
            	'applyDepartmentId':$("#applyDepartmentId").val(),
            	'status':$("#status").val(),
            	'startTime':$("#startTime").val(),
            	'endTime':$("#endTime").val()
            }  
        }).trigger('reloadGrid');
	}
	
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：车辆申请->用车申请->用车申请记录</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form" style="padding: 5px; ">
				<form action="" method="post">
					<table border="0" width="1100">
						<tr>
							<td width="300">
								<label for="applyType" class="query_condition_lbl">申请类别:</label>
								<select id="applyType" name="applyType" class="select01" style="width:151px;">
		                    		<option value="-100">全部</option>
		                    		<option value="0">新增</option>
		                    		<option value="1">拼车</option>
		                        </select>
							</td>
							<td width="300">
								<label for="status" class="query_condition_lbl">申请车辆:</label>
								<select id="carId" name="carId" class="select01" style="width:151px;">
		                    		<option value="-100">全部</option>
		                    		<#list carInfoList as carInfo>
		                    		<option value="${carInfo.id}">${carInfo.id_num}(${carInfo.brand_name}--${carInfo.brand_model})</option>
		                    		</#list>
		                        </select>
							</td>
							<td width="500">
								<label for="title" class="query_condition_lbl">申请日期:</label>
								<input type="text" id="createTime" name="createTime" class="text ui-widget-content ui-corner-all"/>
							</td>
						</tr>
						<tr>
							<td>
								<label for="applyDepartmentId" class="query_condition_lbl">申请部门:</label>
								<select id="applyDepartmentId" name="applyDepartmentId" class="select01" style="width:151px;">
		                    		<#if isDisplay('1_1_3')>
		                    			<option value="-100">不限</option>
			                    		<#list departmentInfoList as departmentInfo>
			                    			<option value="${departmentInfo.id}">${departmentInfo.name}</option>
			                    		</#list>
		                    		<#else>
		                    			<option value="${Session.currentUser.departmentId}">${Session.currentUser.departmentName}</option>
		                    		</#if>
		                        </select>
							</td>
							<td colspan="2">
								<label for="startTime" class="query_condition_lbl">用车时间:</label>
								<input type="text" id="startTime" name="startTime" class="text ui-widget-content ui-corner-all" />
								-
								<input type="text" id="endTime" name="endTime" class="text ui-widget-content ui-corner-all" />
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<label for="status" class="query_condition_lbl">申请结果:</label>
								<select id="status" name="status" class="select01">
		                    		<option value="-100" >全部</option>
		                    		<option value="0" >待审批</option>
		                    		<option value="-1" >驳回</option>
		                    		<option value="1" >通过</option>
		                        </select>
							</td>
						</tr>
				    	<tr>
							<td colspan="3">
								<input type="button" id="search" value="搜索申请记录" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
							  	<#if isDisplay('1_1_2')>		
								<input type="button" id="create" value="点击发起申请" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
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
	<div id="dialog" title="用车申请明细" style="padding: 0px;">
		<iframe id="dialog_iframe" name="dialog_iframe" src="" frameborder="0" width="100%" height="100%" style="overflow: hidden;display: none;"></iframe>
	</div>
</body>
<#include "../../foot.ftl" />
