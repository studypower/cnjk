<#include "../../head.ftl" />
<script type="text/javascript">
	<#list dateList as date>
		var row_index${date_index} = 0;
	</#list>
	var carUseApplyListList = new Array();
	$(function(){
		var height=$(window).height();
		var width=$(window).width();
		$("#dataGrid").jqGrid({
	        colNames: ["车辆","时间",<#list dateList as date>"${date}",</#list>],
	        colModel: [
	            {name: "car_name",width:80,sortable:false,align:"center",formatter:function(key,options,rowObject){
		            if(key!=null){
		            	return "<div style=\"background:#F9F900;width:80px;height:50px;line-height:50px;overflow-x:hidden;overflow-y:hidden;\">" + key + "</div>";
		            } else{
		            	return "<div style=\"background:#DFEFFC;width:80px;height:50px;line-height:50px;overflow-x:hidden;overflow-y:hidden;\"></div>";
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
		            	carUseApplyListList[rowObject['car_id'] + rowObject['use_time'] + "${date}"] = key;
		            	var carUseApplyList = key;
		            	if(carUseApplyList==null || carUseApplyList.length==0){
		            		html= "<div style=\"background:#d1d1d1;width:120px;height:50px;line-height:25px;overflow-x:hidden;overflow-y:hidden;\">未申请<br/>（已过期）</div>";	
		            	} else{
		            		var carUseApplyId = carUseApplyList[0]['id'];
		            		var seatsNum = $("#seatsNum").val();
		            		var _seatsNum = 0;
		            		for(var index in carUseApplyList){
			            		_seatsNum += carUseApplyList[index]['seats_num'];
			            	}
		            		html= "<div style=\"background:#d1d1d1; text-align:center;vertical-align:middle;line-height:25px;width:120px;height:50px;overflow-x:hidden;overflow-y:hidden;\" onmouseover=\"m_over('" + rowObject['car_id'] + rowObject['use_time'] + "${date}" + "'," + rowObject['seats_num'] + ")\" onmouseout=\"m_out()\">已预定<br/>（已过期）";
		            		html += "</div>";
		            	}
	            		return html;
	            	}
	            	carUseApplyListList[rowObject['car_id'] + rowObject['use_time'] + "${date}"] = key;
	            	var carUseApplyList = key;
	            	if(carUseApplyList==null || carUseApplyList.length==0){
	            		var seatsNum = $("#seatsNum").val();
	            		if(rowObject['seats_num']-seatsNum>=0){
	            			html= "<a href=\"#\"><div style=\"width:120px;height:50px;line-height:50px;overflow-x:hidden;overflow-y:hidden;\" onclick=\"applyObj(0,"+ rowObject['car_id'] + ",'" +startTime + "','" + endTime + "',0)\">未申请</div></a>";	
	            		} else{
	            			html= "<div style=\"background:#FF0000;width:120px;height:50px;line-height:50px;overflow-x:hidden;overflow-y:hidden;\">无法预定</div>";
	            		}
	            	} else{
	            		var pending = 0;
	            		var pending_apply_id = 0;
	            		for(var _index in carUseApplyList){
							if(carUseApplyList[_index]['status']==0){
								pending=1;
								pending_apply_id=carUseApplyList[_index]['id'];
								break;
							}
				    	}
				    	if(pending==1){
				    		html= "<div style=\"background:#F9F900; text-align:center;vertical-align:middle;line-height:50px;width:120px;height:50px;overflow-x:hidden;overflow-y:hidden;\" onmouseover=\"m_over('" + rowObject['car_id'] + rowObject['use_time'] + "${date}" + "'," + rowObject['seats_num'] + ")\" onmouseout=\"m_out()\"<#if isDisplay('1_1_3')>	onclick=\"auditObj(" + pending_apply_id + ")\"</#if>>待审核";
				    		html += "</div>";
				    		return html;
				    	}
				    	var myApply = 0;
				    	for(var _index in carUseApplyList){
							if(carUseApplyList[_index]['apply_staff_id']==${Session.currentUser.staffId}){
								myApply = 1;
								break;
							}
				    	}
				    	if(myApply==1){
				    		html= "<div style=\"background:#00DB00; text-align:center;vertical-align:middle;line-height:50px;width:120px;height:50px;overflow-x:hidden;overflow-y:hidden;\" onmouseover=\"m_over('" + rowObject['car_id'] + rowObject['use_time'] + "${date}" + "'," + rowObject['seats_num'] + ")\" onmouseout=\"m_out()\">已预定";
		            		html += "</div>";
				    		return html;
				    	}
	            		var carUseApplyId = carUseApplyList[0]['id'];
	            		var seatsNum = $("#seatsNum").val();
	            		var _seatsNum = 0;
	            		for(var index in carUseApplyList){
		            		_seatsNum += carUseApplyList[index]['seats_num'];
		            	}
		            	if(rowObject['seats_num'] - _seatsNum >= seatsNum){
		            		html= "<div style=\"background:#FFA042;text-align:center;vertical-align:middle;line-height:50px;width:120px;height:50px;overflow-x:hidden;overflow-y:hidden;\" onmouseover=\"m_over('" + rowObject['car_id'] + rowObject['use_time'] + "${date}" + "'," + rowObject['seats_num'] + ")\" onmouseout=\"m_out()\" onclick=\"applyObj(1,"+ rowObject['car_id'] + ",'" +startTime + "','" + endTime + "'," + carUseApplyList[0]['id'] + ")\">可拼车";
		            		html += "(" + (rowObject['seats_num'] - _seatsNum) + ")";
		            		html += "</div>";
		            	} else{
		            		html= "<div style=\"background:#FF0000; text-align:center;vertical-align:middle;line-height:50px;width:120px;height:50px;overflow-x:hidden;overflow-y:hidden;\" onmouseover=\"m_over('" + rowObject['car_id'] + rowObject['use_time'] + "${date}" + "'," + rowObject['seats_num'] + ")\" onmouseout=\"m_out()\">已预定";
		            		html += "</div>";
		            	}
	            	}
	            	return html;
	            }},
	            </#list>
	        ],
	        datatype: "json", //将这里改为使用JSON数据  
	        url:'${gzUrl('clgl/ycsq/calendar.do')}', //这是Action的请求地址  
	        mtype: 'POST',
	        postData:{
	        	'startTime':$("#startTime").val()
            },
	        rowNum:60,
	        shrinkToFit:false,
	        rownumbers:false,
	        hidegrid:false,
	        multiselect: false,
	        viewrecords:true,
	        height:"100%",
	        width: '100%',
			caption: "用车日历"
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
            window.location.href="${gzUrl('clgl/ycsq/initCalendar.do?day=')}" + $("#day").val() + "&seatsNum=" + $("#seatsNum").val();  
	    });
	    $("#create").button().click(function( event ) {
	    	event.preventDefault();
	    	window.location.href="${gzUrl('clgl/ycsq/initAdd.do')}";
	    });
	    $("#button_week_0").button().click(function( event ) {
	    	$("#day").val(new Number($("#day").val()) - 7);
	    	window.location.href="${gzUrl('clgl/ycsq/initCalendar.do?day=')}" + $("#day").val() + "&seatsNum=" + $("#seatsNum").val();  
	    });
	    $("#button_week_1").button().click(function( event ) {
	    	$("#day").val(0);
	    	window.location.href="${gzUrl('clgl/ycsq/initCalendar.do?day=')}" + $("#day").val() + "&seatsNum=" + $("#seatsNum").val();  
	    });
	    $("#button_week_2").button().click(function( event ) {
	    	$("#day").val(new Number($("#day").val()) + 7);
	    	window.location.href="${gzUrl('clgl/ycsq/initCalendar.do?day=')}" + $("#day").val() + "&seatsNum=" + $("#seatsNum").val();  
	    });
		$(document).mousemove(function(event){
		    $("#carUseApplyLogDiv").css("top",(event.pageY - 10) + "px").css("left",(event.pageX + 10) + "px").fadeIn("slow");
		    $("#carUseApplyLogDiv").css("position","absolute");
		    $("#carUseApplyLogDiv").css("background","#F5FBEF");
		});   
		$("#pageloading").hide();
	});
	
	function m_out(){
		$("#carUseApplyLogDiv").html('');
		$("#carUseApplyLogDiv").hide();
	}
	
	function m_over(key,car_seats_num){
		var carUseApplyList = carUseApplyListList[key];
		var divHtml = "";
		if(carUseApplyList.length==0){
			divHtml = "无用车申请信息";
		} else{
			for(var index in carUseApplyList){
				car_seats_num = car_seats_num - carUseApplyList[index]['seats_num'];
				divHtml += "申请类型:";
				if(carUseApplyList[index]['apply_type']==0){
					divHtml += "用车申请";
				} else{
					divHtml += "拼车申请";
				}
				if(carUseApplyList[index]['status']==0){
					divHtml += "（未审批）";
				}
				divHtml += "<br/>申请科室:" + carUseApplyList[index]['department_name'];
				divHtml += "<br/>申请人:" + carUseApplyList[index]['staff_name'];
				divHtml += "<br/>目的地:" + carUseApplyList[index]['destination'];
				divHtml += "<br/>用车人数:" + carUseApplyList[index]['seats_num'];
				divHtml += "<br/>剩余座位:" + car_seats_num;
	    		divHtml += "<br/>发车时间:" + carUseApplyList[index]['start_time'];
	    		divHtml += "<br/>回车时间:" + carUseApplyList[index]['end_time'];
	    		divHtml += "<br/>是否货物:"; if(carUseApplyList[index]['freight']==0){divHtml += "否";}else{divHtml += "是";}
	    		divHtml += "<br/><br/>";
	    	}
		}
		$("#carUseApplyLogDiv").html(divHtml);
		$("#carUseApplyLogDiv").show();
	}
	
	function applyObj(applyType,carId,startTime,endTime,carUseApplyId) {
		$("#dialog").dialog();
		if(carUseApplyId == 0){
			$("#dialog").dialog( "option", "title", "用车申请明细" );
		}else{
			$("#dialog").dialog( "option", "title", "拼车申请明细" );
		}
		
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
			            	'startTime':$("#startTime").val()
			            }  
			        }).trigger('reloadGrid');
    				$(this).dialog("close");
    				$("#dialog_iframe").attr("src","${gzUrl('page/blank.html')}");
    			 }
    		 }]
    	});
    	$("#dialog_iframe").css("display","block");
    	$("#dialog_iframe").attr("src","${gzUrl('clgl/ycsq/initApply.do')}?applyType=" + applyType + "&carId=" + carId + "&seatsNum=" + $("#seatsNum").val() + "&startTime=" + startTime + "&endTime=" + endTime + "&id=" + carUseApplyId + "&randomNum=" + Math.random());
	}
	
	function applyOK(){
		$("#dialog").dialog("close");
		alert("申请成功");
		//window.location.href = "${gzUrl('clgl/ycsq/initList.do')}";
		<#list dateList as date>
			row_index${date_index} = 0;
		</#list>
	 	jQuery("#dataGrid").jqGrid('setGridParam',{  
            postData:{
            	'startTime':$("#startTime").val()
            }  
        }).trigger('reloadGrid');
	}
	
	function applyError_1(){
	 	$("#dialog").dialog("close");
		alert("所申请的用车时间（或部分时段）已被预订，无法申请用车!");
		<#list dateList as date>
			row_index${date_index} = 0;
		</#list>
	 	jQuery("#dataGrid").jqGrid('setGridParam',{  
            postData:{
            	'startTime':$("#startTime").val()
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
    	$("#dialog_iframe").attr("src","${gzUrl('clgl/ycsq/info.do')}?id=" + id + "&randomNum=" + Math.random());
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
	            	'startTime':$("#startTime").val()
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
			<div class="osx-modal-title">您现在所在的位置：车辆申请->用车申请->发起申请</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form" style="padding: 5px; ">
				<form action="" method="post">
					<table border="0" width="800">
						<tr>
							<td width="300">
								<label for="seatsNum" class="query_condition_lbl">预计使用人数:</label>
								<input type="text" id="seatsNum" name="seatsNum" class="text ui-widget-content ui-corner-all" value="<#if seatsNum?exists && seatsNum!=0>${seatsNum}<#else>1</#if>"/>
							</td>
							<td width="500">
								<input type="hidden" id="day" name="day" class="text ui-widget-content ui-corner-all" value="${day}"/>
								<input type="hidden" id="startTime" name="startTime" class="text ui-widget-content ui-corner-all" value="${startTime?if_exists?string("yyyy-MM-dd")}" />
								<input type="button" id="button_week_0" value="上一周" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>&nbsp;&nbsp;
								<input type="button" id="button_week_1" value="本周" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>&nbsp;&nbsp;
								<input type="button" id="button_week_2" value="下一周" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
							</td>
						</tr>
				    	<tr>
							<td colspan="2">
								<input type="button" id="search" value="刷新日历" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
							</td>
				    	</tr>
					</table>
				</form>
			</div>
			<table id="dataGrid"></table>
			<div id="pager"></div>
		</div>
	</div>
	<div id="carUseApplyLogDiv" style="padding:0px;display:none;"></div>
	<div id="dialog" title="申请明细" style="padding:0px;display:none;">
		<iframe id="dialog_iframe" name="dialog_iframe" src="" frameborder="0" width="100%" height="100%" style="overflow: hidden;display: none;"></iframe>
	</div>
</body>
<#include "../../foot.ftl" />
