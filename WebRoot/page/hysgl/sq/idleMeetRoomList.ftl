<#include "../../head.ftl" />
<script type="text/javascript">
	$(function(){
		var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: ["会议室名称","会议室地址","最大容纳人数","基础设备","操作"],
	        colModel: [
	            {name: "name",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	               	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "address",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
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
	            {name: "device_names",width:150,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines'] || key==null){
	            		return "";
	            	}
	            	return key;
	            }},
	            {name: "action",width:200,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(rowObject['isBlanklines']){
	            		return "";
	            	}
                    var html='';
                	html += '<a href="javascript:applyObj('+rowObject['id']+',0)" title="会议室申请">会议室申请</a>&nbsp;&nbsp;&nbsp;&nbsp;';	
            	    return html;
	            }}
	        ],
	        datatype: "local", //将这里改为使用JSON数据  
	        url:'${gzUrl('hysgl/sq/idleMeetRoomList.do')}', //这是Action的请求地址  
	        mtype: 'POST',
	        postData:{
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
			caption: "可用会议室列表"
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
	    		datatype:'json',
                postData:{
                	'meetingStartTime':$("#meetingStartTime").val(),
                	'meetingEndTime':$("#meetingEndTime").val()
                }  
            }).trigger('reloadGrid');    
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
		$("#carId").combobox();
		$("#applyType").combobox();
		$("#applyStaffId").combobox();
		$("#status").combobox();
		$("#pageloading").hide();
	});
	
	function deleteObj(id) {
		var goto = confirm("删除后，数据库中的数据也会做相应删除，此操作不可逆，确定要执行？");
		if(goto){
			window.location.href="${gzUrl('hysgl/sq/delete.do')}?id=" + id;
		}
	}
	
	function applyObj(meetingRoomId,id) {
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
    			 text:"递交申请",
    			 click:function(){
    			 	dialog_iframe.window.apply();
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
    	$("#dialog_iframe").attr("src","${gzUrl('hysgl/sq/initApply.do')}?&meetingRoomId=" + meetingRoomId + "&seatsNum=" + $("#seatsNum").val() + "&meetingStartTime=" + $("#meetingStartTime").val() + "&meetingEndTime=" + $("#meetingEndTime").val() + "&randomNum=" + Math.random());
	}
	
	function applyOK(){
		alert("申请成功");
		window.location.href = "${gzUrl('hysgl/sq/initList.do')}";
	}
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：会议室管理->会议室申请->可申请会议室列表</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form" style="padding: 5px; ">
				<form action="" method="post">
					<table border="0" width="730">
				    	<tr>
							<td colspan="2">
								<label for="startTime" class="edit_lbl">使用时间:</label>
								<input type="text" id="meetingStartTime" name="meetingStartTime" class="text ui-widget-content ui-corner-all" />
								-
								<input type="text" id="meetingEndTime" name="meetingEndTime" class="text ui-widget-content ui-corner-all" />
							</td>
						</tr>
				    	<tr>
							<td colspan="2">
								<input type="button" id="search" value="搜索可用会议室" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
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
