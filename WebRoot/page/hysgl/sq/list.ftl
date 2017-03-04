<#include "../../head.ftl" />
<script type="text/javascript">
	$(function(){
		var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: ["申请时间","会议室","会议主题","申请科室","申请人","会议时间","状态","操作"],
	        colModel: [
	            {name: "apply_time",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	var html = "";
	            	if(rowObject['status']==0){
	            		html += "<font color='red'>";	
	            	} else {
	            		html += "<font>";
	            	}
	            	html += rowObject['apply_time'].split(" ")[0] + "<br/>" + rowObject['apply_time'].split(" ")[1];
	            	html += "</font>";
	            	return html;
	            }},
	            {name: "meetingRoomName",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
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
	            {name: "meetingTheme",width:200,sortable:false,align:"center",formatter:function(key,options,rowObject){
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
	            {name: "departmentName",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
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
	            {name: "applyStaffName",width:80,sortable:false,align:"center",formatter:function(key,options,rowObject){
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
	            	html += rowObject['meeting_start_time'].split(" ")[0] + "<br/>(" + rowObject['meeting_start_time'].split(" ")[1] + "~" + rowObject['meeting_end_time'].split(" ")[1] + ")";
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
	            		return "驳回";
	            	}else if(key==-2){
	            		return "驳回/取消";
	            	} else{
	            		return "未知";
	            	}
	            }},
	            {name: "",width:100,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines']){
	            		return "";
	            	}
	                var html='';
	            	html += '<a href="javascript:infoObj('+rowObject['id']+')" title="详情">详情</a>';
	            	<#if isDisplay('8_1_3')>
	            	if(rowObject['status']==0){
	            		html += '&nbsp;&nbsp;<a href="javascript:auditObj('+rowObject['id']+')" title="审核">审核</a>';
	            	}
	            	</#if>
	            	if(${Session.currentUser.staffId} == rowObject['applyStaffId']){
	            	 	if(rowObject['status']==0){
	            		  html += '&nbsp;&nbsp;<a href="javascript:deleteObj('+rowObject['id']+')" title="删除">删除</a>';
	            		}
	            	}
	            	if(rowObject['status']==1){
	            		<#if isDisplay('8_1_3')>
		            		var date0 = new Date();
		            		var date1 = rowObject['meeting_start_time'].replace(/-/g, "/");
		            		if(Date.parse(date0) < Date.parse(date1)){
			            		html += '&nbsp;&nbsp;<a href="###" onclick="cancelObj('+rowObject['id']+')" title="取消">取消</a>';
		            		}
	            		</#if>
	            	}
	            	return html;
	            }}
	        ],
	        datatype: "json", //将这里改为使用JSON数据  
	        url:'${gzUrl('hysgl/sq/list.do')}', //这是Action的请求地址  
	        mtype: 'POST',
	        postData:{
	        	'meetingRoomId':$("#meetingRoomId").val(),
                'departmentId':$("#departmentId").val(),
                'meetingStartTime':$("#meetingStartTime").val(),
                'meetingEndTime':$("#meetingEndTime").val(),
                'status':$("#status").val()
                <#if from?if_exists="welcome" >,from:"${from}"</#if>
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
			caption: "会议室申请列表"
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
                	'meetingRoomId':$("#meetingRoomId").val(),
                	'departmentId':$("#departmentId").val(),
                	'meetingStartTime':$("#meetingStartTime").val(),
                	'meetingEndTime':$("#meetingEndTime").val(),
                	'status':$("#status").val()
                	<#if from?if_exists="welcome" >,from:"${from}"</#if>
                }  
            }).trigger('reloadGrid');    
	    });
	    $("#create").button().click(function( event ) {
	    	event.preventDefault();
	    	window.location.href="${gzUrl('hysgl/sq/initIdleMeetRoomList.do')}";
	    });
	    $("#audit").button().click(function( event ) {
	    	event.preventDefault();
	    	window.location.href="${gzUrl('hysgl/sq/initCalendar.do')}";
	    });
	    $("#meetingStartTime").datetimepicker({
			timeText: '时间',  
           	hourText: '小时',  
           	minuteText: '分钟',  
           	secondText: '秒',  
           	currentText: '现在',  
           	closeText: '完成',  
           	showSecond: false, //显示秒 
           	timeFormat: 'hh:mm:ss'//格式化时间  
		});
		$("#meetingEndTime").datetimepicker({
			timeText: '时间',  
           	hourText: '小时',  
           	minuteText: '分钟',  
           	secondText: '秒',  
           	currentText: '现在',  
           	closeText: '完成',  
           	showSecond: false, //显示秒 
           	timeFormat: 'hh:mm:ss'//格式化时间  
		});
		$("#meetingRoomId").combobox();
		$("#applyType").combobox();
		$("#status").combobox();
		$("#departmentId").combobox();
		$("#pageloading").hide();
	});
	
	function deleteObj(id) {
		var goto = confirm("删除后，数据库中的数据也会做相应删除，此操作不可逆，确定要执行？");
		if(goto){
			window.location.href="${gzUrl('hysgl/sq/del.do')}?id=" + id;
		}
	}
	
	function cancelObj(id){
		$.get("${gzUrl('/hysgl/sq/cancel.do')}?id="+ id + "&randomNum=" + Math.random(), null, cancelObjCallback);
	}
	
	function cancelObjCallback(data){
		jQuery("#dataGrid").jqGrid('setGridParam',{  
                postData:{
                	'meetingRoomId':$("#meetingRoomId").val(),
                	'departmentId':$("#departmentId").val(),
                	'meetingStartTime':$("#meetingStartTime").val(),
                	'meetingEndTime':$("#meetingEndTime").val(),
                	'status':$("#status").val()
                	<#if from?if_exists="welcome" >,from:"${from}"</#if>
              }  
        }).trigger('reloadGrid');
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
			            	'meetingRoomId':$("#meetingRoomId").val(),
		                	'departmentId':$("#departmentId").val(),
		                	'meetingStartTime':$("#meetingStartTime").val(),
		                	'meetingEndTime':$("#meetingEndTime").val(),
		                	'status':$("#status").val()
		                	<#if from?if_exists="welcome" >,from:"${from}"</#if>
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
	            	'meetingRoomId':$("#meetingRoomId").val(),
                	'departmentId':$("#departmentId").val(),
                	'meetingStartTime':$("#meetingStartTime").val(),
                	'meetingEndTime':$("#meetingEndTime").val(),
                	'status':$("#status").val()
                	<#if from?if_exists="welcome" >,from:"${from}"</#if>
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
			<div class="osx-modal-title">您现在所在的位置：会议室申请->会议室申请->会议室申请记录</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form" style="padding: 5px; ">
				<form action="" method="post">
					<table border="0" width="730">
						<tr>
							<td width="80px">
							  <label for="meetingRoomId" class="query_condition_lbl">会议室:&nbsp&nbsp&nbsp;</label>
							</td>
							<td width="200px">
								<select id="meetingRoomId" name="meetingRoomId" class="select01">
		                    		<option value="-100">全部</option>
		                    	   <#if MeetingRoomList?exists>	
		                    		<#list MeetingRoomList as MeetingRoom>
		                    		<option value="${MeetingRoom.id}">${MeetingRoom.name}</option>
		                    		</#list>
		                    	   </#if>	
		                        </select>
							</td>
							<td width="80px">
								<label for="startTime" class="query_condition_lbl">会议时间:</label>
							</td>
							<td width="400px">
								<input type="text" id="meetingStartTime" name="meetingStartTime" class="text ui-widget-content ui-corner-all" />
								-
								<input type="text" id="meetingEndTime" name="meetingEndTime" class="text ui-widget-content ui-corner-all" />
							</td>
						</tr>
						<tr>
							<td >
							  <label for="departmentId" class="query_condition_lbl">申请科室:</label>
							 </td>
							<td>
								<select id="departmentId" name="departmentId" class="select01">
									<#if isDisplay('8_1_3')>
		                    			<option value="-100">不限</option>
			                    		<#list departmentList as departmentInfo>
			                    			<option value="${departmentInfo.id}">${departmentInfo.name}</option>
			                    		</#list>
		                    		<#else>
		                    			<option value="${Session.currentUser.departmentId}">${Session.currentUser.departmentName}</option>
		                    		</#if>
		                        </select>
							</td>
							<td>
								<label for="status" class="query_condition_lbl">申请结果:</label>
							</td>
							<td>
								<select id="status" name="status" class="select01">
		                    		<option value="-100">全部</option>
		                    		<option value="0">待审批</option>
		                    		<option value="-1">驳回</option>
		                    		<option value="1">通过</option>
		                        </select>
							</td>
						</tr>
						<tr>
							<td colspan="4">
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
<#include "../../foot.ftl" />
