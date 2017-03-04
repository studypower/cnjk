<#include "../../head.ftl" />
<script type="text/javascript">
	<#list dateList as date>
		var row_index${date_index} = 0;
	</#list>
	var roomUseApplyListList = new Array();
	$(function(){
		var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: ["会议室","时间",<#list dateList as date>"${date}",</#list>],
	        colModel: [
	            {name: "",width:140,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	 if(rowObject['meeting_room_name']!=null){
		            	return "<div style=\"background:#F9F900;width:140px;height:50px;line-height:50px;overflow-x:hidden;overflow-y:hidden;\">" + rowObject['meeting_room_name'] + "(" + rowObject['max_count_use'] + ")" + "</div>";
		            } else{
		            	return "<div style=\"background:#DFEFFC;width:140px;height:50px;line-height:50px;overflow-x:hidden;overflow-y:hidden;\"></div>";
		            }
	            }},
	            {name: "use_time_title",width:120,sortable:false,align:"center",formatter:function(key,options,rowObject){
	               	if(key!=null){
		            	return "<div style=\"background:#DFEFFC;width:120px;height:50px;line-height:25px;overflow-x:hidden;overflow-y:hidden;\">"+key+"</div>";;
		            } else{
		            	return "<div style=\"background:#DFEFFC;width:120px;height:50px;line-height:50px;overflow-x:hidden;overflow-y:hidden;\"></div>";
		            }
	            }},
	            <#list dateList as date>
	            {name: "${date}",width:120,sortable:false,align:"center",formatter:function(key,options,rowObject){
	            	if(key==null){
	            		return "<div style=\"background:#DFEFFC;width:120px;height:50px;line-height:50px;overflow-x:hidden;overflow-y:hidden;\"></div>";
	            	}
	            	if(row_index${date_index}==0){
	            		row_index${date_index} ++;
	            		return "<div style=\"background:#DFEFFC;width:120px;height:50px;line-height:50px;overflow-x:hidden;overflow-y:hidden;\">" + key + "</div>";
	            	}
	            	var startTime = "${date} " + rowObject['use_start_time'] + ":00";
	            	var endTime = "${date} " + rowObject['use_end_time'] + ":00";
	            	var html = "";
	            	var date0 = new Date(endTime.replace(/-/g, "/"));
	            	var date1 = new Date('${nowTime}'.replace(/-/g, "/"));
	            	if(Date.parse(date0) < Date.parse(date1)){	
	            	    roomUseApplyListList[rowObject['meeting_room_id'] + rowObject['use_time'] + "${date}"] = key;
		            	var roomUseApplyList = key;
		            	if(roomUseApplyList==null || roomUseApplyList.length==0){
		            		html= "<div style=\"background:#d1d1d1;width:120px;height:50px;line-height:25px;overflow-x:hidden;overflow-y:hidden;\">未申请<br/>（已过期）</div>";	
		            	}else{
		            		var roomUseApplyId = roomUseApplyList[0]['id'];
			            	html= "<div style=\"background:#666666; text-align:center;vertical-align:middle;line-height:25px;width:120px;height:50px;overflow-x:hidden;overflow-y:hidden;\" onmouseover=\"m_over('" + rowObject['meeting_room_id'] + rowObject['use_time'] + "${date}" + "')\" onmouseout=\"m_out()\">已预定<br/>（已过期）";
			            	html += "</div>";
		            	}
		            	return html; 
	            	}
	            	roomUseApplyListList[rowObject['meeting_room_id'] + rowObject['use_time'] + "${date}"] = key;
	            	var roomUseApplyList = key;
	            	if(roomUseApplyList==null || roomUseApplyList.length==0){
	            	   html= "<div style=\"width:120px;height:50px;line-height:50px;overflow-x:hidden;overflow-y:hidden;\" onclick=\"applyObj('"+ rowObject['meeting_room_id'] + "','" +startTime + "','" + endTime + "')\">未申请</div>";	
	            	} else{
	            		var pending = 0;
	            		var pending_apply_id = 0;
	            		var _pending_apply_id = 0;
	            		for(var _index in roomUseApplyList){
							if(roomUseApplyList[_index]['status']==0){
								pending=1;
								pending_apply_id=roomUseApplyList[_index]['id'];
								break;
							}
							_pending_apply_id = roomUseApplyList[_index]['id'];
				    	}
				    	if(pending==1){
				    		html= "<div style=\"background:#F9F900; text-align:center;vertical-align:middle;line-height:50px;width:120px;height:50px;overflow-x:hidden;overflow-y:hidden;\" onmouseover=\"m_over('" + rowObject['meeting_room_id'] + rowObject['use_time'] + "${date}" + "')\" onmouseout=\"m_out()\"<#if isDisplay('8_1_3')> onclick=\"auditObj(" + pending_apply_id + ")\"</#if>>待审核";
				    		html += "</div>";
				    		return html;
				    	}
				    	var myApply = 0;
				    	for(var _index in roomUseApplyList){
							if(roomUseApplyList[_index]['apply_staff_id']==${Session.currentUser.staffId}){
								myApply = 1;
								break;
							}
				    	}
				    	if(myApply==1){
				    		html= "<div style=\"background:#00DB00; text-align:center;vertical-align:middle;line-height:50px;width:120px;height:50px;overflow-x:hidden;overflow-y:hidden;\" onmouseover=\"m_over('" + rowObject['meeting_room_id'] + rowObject['use_time'] + "${date}" + "')\" onmouseout=\"m_out()\" onclick=\"infoObj(" + _pending_apply_id + ")\">已预定";
		            		html += "</div>";
				    		return html;
				    	}
	            		var roomUseApplyId = roomUseApplyList[0]['id'];
		            	html= "<div style=\"background:#FF0000; text-align:center;vertical-align:middle;line-height:50px;width:120px;height:50px;overflow-x:hidden;overflow-y:hidden;\" onmouseover=\"m_over('" + rowObject['meeting_room_id'] + rowObject['use_time'] + "${date}" + "')\" onmouseout=\"m_out()\"<#if isDisplay('8_1_3')> onclick=\"infoObj(" + _pending_apply_id + ")\"</#if>>已预定";
		            	html += "</div>";
	            	}
	            	return html;
	            }},
	            </#list>
	        ],
	        datatype: "json", //将这里改为使用JSON数据  
	        url:'${gzUrl('hysgl/sq/calendar.do')}', //这是Action的请求地址  
	        mtype: 'POST',
	        postData:{
	        	'meetingStartTime':$("#startTime").val()
            },
	        rowNum:60,
	        shrinkToFit:false,
	        rownumbers:false,
	        hidegrid:false,
	        multiselect: false,
	        viewrecords:true,
	        height:"100%",
	        width: '100%',
			caption: "会议室日历"
	    });
		$("#dataGrid").navGrid("#pager",{edit:false,add:false,del:false,refresh:true,search:false});
		$(document.body).css({"overflow-x":"auto","overflow-y":"auto"});
	    $(window).resize(function(){
	    	var $window=$(window);
			$("#dataGrid").setGridHeight("100%");
			$("#dataGrid").setGridWidth("100%");
		});
	    <#--
		$("#search").button().click(function( event ) {
	    	event.preventDefault();
	    	if($("#startTime").val()==null || $("#startTime").val()==""){
	    		alert("请填写预计会议室使用日期");
	    	}
            window.location.href="${gzUrl('hysgl/sq/initCalendar.do?meetingStartTime=')}" + $("#startTime").val();  
	    });-->	
	    $("#create").button().click(function( event ) {
	    	event.preventDefault();
	    	window.location.href="${gzUrl('hysgl/sq/initAdd.do')}";
	    });
	    $("#button_week_0").button().click(function( event ) {
	    	$("#day").val(new Number($("#day").val()) - 7);
	    	window.location.href="${gzUrl('hysgl/sq/initCalendar.do?day=')}" + $("#day").val();  
	    });
	    $("#button_week_1").button().click(function( event ) {
	    	$("#day").val(0);
	    	window.location.href="${gzUrl('hysgl/sq/initCalendar.do?day=')}" + $("#day").val();  
	    });
	    $("#button_week_2").button().click(function( event ) {
	    	$("#day").val(new Number($("#day").val()) + 7);
	    	window.location.href="${gzUrl('hysgl/sq/initCalendar.do?day=')}" + $("#day").val();  
	    });
		$("#startTime").datepicker({
			dateFormat: "yy-mm-dd"
		});
		$(document).mousemove(function(event){
		    $("#carUseApplyLogDiv").css("top",(event.pageY - 10) + "px").css("left",(event.pageX + 10) + "px").fadeIn("slow");
		    $("#carUseApplyLogDiv").css("position","absolute");
		    $("#carUseApplyLogDiv").css("background","#F5FBEF");
		    //$("#carUseApplyLogDiv").css("display","none");
		});   
		$("#pageloading").hide();
	});
	
	function m_out(){
		$("#carUseApplyLogDiv").html('');
		$("#carUseApplyLogDiv").hide();
	}
	
	function m_over(key){
		var roomUseApplyList = roomUseApplyListList[key];
		var divHtml = "";
		if(roomUseApplyList.length==0){
			divHtml = "无会议室申请信息";
		} else{
			for(var index in roomUseApplyList){
			    var key="";
			    if(roomUseApplyList[index]['status']==0){
			        key="待审核";
			    }else if(roomUseApplyList[index]['status']==1){
			        key="审核成功";
			    }
			    divHtml += "会议室查看 ";
				divHtml += "<br/>申请科室:" + roomUseApplyList[index]['department_name'];
				divHtml += "<br/>申请人:" + roomUseApplyList[index]['staff_name'];
				divHtml += "<br/>会议主题:" + roomUseApplyList[index]['meeting_theme'];
				divHtml += "<br/>申请时间:" + roomUseApplyList[index]['apply_time'];
				divHtml += "<br/>状态:" +key;
	    		divHtml += "<br/>会议开始时间:" + roomUseApplyList[index]['meeting_start_time'];
	    		divHtml += "<br/>会议结束时间:" + roomUseApplyList[index]['meeting_end_time'];
	    		divHtml += "<br/><br/>";
	    	}
		}
		$("#carUseApplyLogDiv").html(divHtml);
		$("#carUseApplyLogDiv").show();
	}
	
	function applyObj(meetingRoomId,startTime,endTime) {
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
    			 	 <#list dateList as date>
						row_index${date_index} = 0;
					</#list>
    			 	jQuery("#dataGrid").jqGrid('setGridParam',{  
			            postData:{
			            	'meetingStartTime':$("#startTime").val()
			            }  
			        }).trigger('reloadGrid');
    				$(this).dialog("close");
    				$("#dialog_iframe").attr("src","${gzUrl('page/blank.html')}");
    			 }
    		 }]
    	});
    	$("#dialog_iframe").css("display","block");
    	$("#dialog_iframe").attr("src","${gzUrl('hysgl/sq/initApply.do')}?" + "meetingRoomId=" + meetingRoomId + "&meetingStartTime=" + startTime + "&meetingEndTime=" + endTime + "&randomNum=" + Math.random());
	}
	
	function applyOK(){
		$("#dialog").dialog("close");
		alert("申请成功");
		//window.location.href = "${gzUrl('hysgl/sq/initList.do')}";
		<#list dateList as date>
			row_index${date_index} = 0;
		</#list>
	 	jQuery("#dataGrid").jqGrid('setGridParam',{  
            postData:{
            	'meetingStartTime':$("#startTime").val()
            }  
        }).trigger('reloadGrid');
	}
	
	function applyError_1(){
	 	$("#dialog").dialog("close");
		alert("所申请的会议室时间（或部分时段）已被预订，无法申请会议室!");
		<#list dateList as date>
			row_index${date_index} = 0;
		</#list>
	 	jQuery("#dataGrid").jqGrid('setGridParam',{  
            postData:{
            	'meetingStartTime':$("#startTime").val()
            }  
        }).trigger('reloadGrid');
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
    			 	<#list dateList as date>
						row_index${date_index} = 0;
					</#list>
				 	jQuery("#dataGrid").jqGrid('setGridParam',{  
			            postData:{
			            	'startTime':$("#startTime").val()
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
    			 	<#list dateList as date>
						row_index${date_index} = 0;
					</#list>
				 	jQuery("#dataGrid").jqGrid('setGridParam',{  
			            postData:{
			            	'startTime':$("#startTime").val()
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
			<#list dateList as date>
				row_index${date_index} = 0;
			</#list>
		 	jQuery("#dataGrid").jqGrid('setGridParam',{  
	            postData:{
	            'meetingStartTime':$("#startTime").val()
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
			<div class="osx-modal-title">您现在所在的位置：会议室申请->会议室申请->发起申请</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form" style="padding: 5px; ">
				<form action="" method="post">
					<table border="0" width="600">
						<tr>
							<td width="500">
								<input type="hidden" id="day" name="day" class="text ui-widget-content ui-corner-all" value="${day}"/>
								<input type="hidden" id="startTime" name="startTime" class="text ui-widget-content ui-corner-all" value="${meetingStartTime?if_exists?string("yyyy-MM-dd")}" />
								<input type="button" id="button_week_0" value="上一周" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>&nbsp;&nbsp;
								<input type="button" id="button_week_1" value="本周" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>&nbsp;&nbsp;
								<input type="button" id="button_week_2" value="下一周" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
							</td>
						</tr>
					 <#--
				    	<tr>
							<td>
								<input type="button" id="search" value="刷新日历" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
							</td>
				    	</tr>-->
					</table>
				</form>
			</div>
			<table id="dataGrid"></table>
			<div id="pager"></div>
		</div>
	</div>
	<div id="carUseApplyLogDiv" style="padding:0px;display:none;"></div>
	<div id="dialog" title="会议室申请明细" style="padding:0px;display:none;">
		<iframe id="dialog_iframe" name="dialog_iframe" src="" frameborder="0" width="100%" height="100%" style="overflow: hidden;display: none;"></iframe>
	</div>
</body>
<#include "../../foot.ftl" />
