<#include "../../head.ftl" />
<script type="text/javascript">
	$(function(){
		$("#tabs" ).tabs();
		$("#tabs").height(300);
		$("#tabs > div").height(300);
		$(document.body).css({"overflow-x":"auto","overflow-y":"auto"});
	    <#if !carUseApply?exists>
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
		</#if>
	    $("#pageloading").hide();
	});
	
	function apply(){
    	if($("#destination").val()=="" || $("#destination").val()==null){
    	   alert("请填写目的地");
    	   return false;
    	}
    	if($("#seatsNum").val()>${carInfo.seats_num}-${useSeatsNum}){
    		alert("可用座位不足，不可提交。");
    		return false;
    	}
    	<#if !carUseApply?exists>
    		var startTime = $("#startTime_ymd").val() + " " + $("#startTime_hm").val() + ":00";
    		$("#startTime").val(startTime);
    		var endTime = $("#endTime_ymd").val() + " " + $("#endTime_hm").val() + ":00";
    		$("#endTime").val(endTime);
    		if($("#startTime").val()>=$("#endTime").val()){
    			alert("发车时间不能晚于等于回车时间!");
    			return;
    		}
    	</#if>
		$("#form1").submit();
	}
	
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form_content">
				<div id="tabs">
					<div id="main_content" style="overflow:auto;">
						<form id="form1" name="form1" action="${gzUrl('clgl/ycsq/apply.do')}" method="post">
						<table border="0" width="650" style="overflow: hidden;">
							<tr>
								<td>
									<label class="edit_lbl">车辆名称:</label>
								</td>
								<td colspan="3">
									<input type="text" class="text ui-widget-content ui-corner-all" value="${carInfo.brand_name}" readonly/>
								</td>
							</tr>
							<tr>
								<td width="80px">
									<label class="edit_lbl">申请部门:</label>
								</td>
								<td>
									<input type="text" class="text ui-widget-content ui-corner-all" value="${Session.currentUser.departmentName}" readonly/>
								</td>
								<td width="80px">
									<label class="edit_lbl">申请人:</label>
								</td>
								<td>
									<input type="text" class="text ui-widget-content ui-corner-all" value="${Session.currentUser.staffName}" readonly/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="seatsNum" class="edit_lbl">使用人数:</label>
								</td>
								<td>
									<input type="text" id="seatsNum" name="seatsNum" class="text ui-widget-content ui-corner-all" value="${seatsNum?if_exists}" style="width:80px;"/>(可用座位：${carInfo.seats_num-useSeatsNum})
								</td>
								<td>
									<label for="destination" class="edit_lbl">目的地:</label>
								</td>
								<td>
									<input type="text" id="destination" name="destination" class="text ui-widget-content ui-corner-all"/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="freight" class="edit_lbl">携带货物:</label>
								</td>
								<td>
									<input type="radio" name="freight" value="0" checked/><span class="edit_lbl">否</span>
									<input type="radio" name="freight" value="1" /><span class="edit_lbl">是</span>
								</td>
								<td>
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
							</tr>
							<#if carUseApply?exists>
							<tr>
								<td>
									<label for="startTime" class="edit_lbl">发车时间:</label>
								</td>
								<td>
									<input type="text" id="startTime" name="startTime" class="text ui-widget-content ui-corner-all" value="${startTime?datetime}" readonly/>
								</td>
								<td>
									<label for="endTime" class="edit_lbl">回车时间:</label>
								</td>
								<td>
									<input type="text" id="endTime" name="endTime" class="text ui-widget-content ui-corner-all" value="${endTime?datetime}" readonly/>
								</td>
							</tr>
							<#else>
							<tr>
								<td>
									<label for="startTime" class="edit_lbl">发车时间:</label>
								</td>
								<td colspan="3">
									<input type="hidden" id="startTime" name="startTime" class="text ui-widget-content ui-corner-all" readonly/>
									<input type="text" id="startTime_ymd" name="startTime_ymd" class="text ui-widget-content ui-corner-all" value="${startTime?date}" readonly/>
									<select id="startTime_hm" name="startTime_hm">
										<#if 600 gte startTime?datetime?string('HHmm')?number>
										<option>06:00</option>
										</#if>
										<#if 630 gte startTime?datetime?string('HHmm')?number>
										<option>06:30</option>
										</#if>
										<#if 700 gte startTime?datetime?string('HHmm')?number>
										<option>07:00</option>
										</#if>
										<#if 730 gte startTime?datetime?string('HHmm')?number>
										<option>07:30</option>
										</#if>
										<#if 800 gte startTime?datetime?string('HHmm')?number>
										<option>08:00</option>
										</#if>
										<#if 830 gte startTime?datetime?string('HHmm')?number>
										<option>08:30</option>
										</#if>
										<#if 900 gte startTime?datetime?string('HHmm')?number>
										<option>09:00</option>
										</#if>
										<#if 930 gte startTime?datetime?string('HHmm')?number>
										<option>09:30</option>
										</#if>
										<#if 1000 gte startTime?datetime?string('HHmm')?number>
										<option>10:00</option>
										</#if>
										<#if 1030 gte startTime?datetime?string('HHmm')?number>
										<option>10:30</option>
										</#if>
										<#if 1100 gte startTime?datetime?string('HHmm')?number>
										<option>11:00</option>
										</#if>
										<#if 1130 gte startTime?datetime?string('HHmm')?number>
										<option>11:30</option>
										</#if>
										<#if 1200 gte startTime?datetime?string('HHmm')?number>
										<option>12:00</option>
										</#if>
										<#if 1230 gte startTime?datetime?string('HHmm')?number>
										<option>12:30</option>
										</#if>
										<#if 1300 gte startTime?datetime?string('HHmm')?number>
										<option>13:00</option>
										</#if>
										<#if 1330 gte startTime?datetime?string('HHmm')?number>
										<option>13:30</option>
										</#if>
										<#if 1400 gte startTime?datetime?string('HHmm')?number>
										<option>14:00</option>
										</#if>
										<#if 1430 gte startTime?datetime?string('HHmm')?number>
										<option>14:30</option>
										</#if>
										<#if 1500 gte startTime?datetime?string('HHmm')?number>
										<option>15:00</option>
										</#if>
										<#if 1530 gte startTime?datetime?string('HHmm')?number>
										<option>15:30</option>
										</#if>
										<#if 1600 gte startTime?datetime?string('HHmm')?number>
										<option>16:00</option>
										</#if>
										<#if 1630 gte startTime?datetime?string('HHmm')?number>
										<option>16:30</option>
										</#if>
										<#if 1700 gte startTime?datetime?string('HHmm')?number>
										<option>17:00</option>
										</#if>
										<#if 1730 gte startTime?datetime?string('HHmm')?number>
										<option>17:30</option>
										</#if>
										<#if 1800 gte startTime?datetime?string('HHmm')?number>
										<option>18:00</option>
										</#if>
										<#if 1830 gte startTime?datetime?string('HHmm')?number>
										<option>18:30</option>
										</#if>
										<#if 1900 gte startTime?datetime?string('HHmm')?number>
										<option>19:00</option>
										</#if>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<label for="endTime" class="edit_lbl">回车时间:</label>
								</td>
								<td colspan="3">
									<input type="hidden" id="endTime" name="endTime" class="text ui-widget-content ui-corner-all" readonly/>
									<input type="text" id="endTime_ymd" name="endTime_ymd" class="text ui-widget-content ui-corner-all" value="${endTime?date}" readonly/>
									<select id="endTime_hm" name="endTime_hm">
										<#if 600 gte endTime?datetime?string('HHmm')?number>
										<option>06:00</option>
										</#if>
										<#if 630 gte endTime?datetime?string('HHmm')?number>
										<option>06:30</option>
										</#if>
										<#if 700 gte endTime?datetime?string('HHmm')?number>
										<option>07:00</option>
										</#if>
										<#if 730 gte endTime?datetime?string('HHmm')?number>
										<option>07:30</option>
										</#if>
										<#if 800 gte endTime?datetime?string('HHmm')?number>
										<option>08:00</option>
										</#if>
										<#if 830 gte endTime?datetime?string('HHmm')?number>
										<option>08:30</option>
										</#if>
										<#if 900 gte endTime?datetime?string('HHmm')?number>
										<option>09:00</option>
										</#if>
										<#if 930 gte endTime?datetime?string('HHmm')?number>
										<option>09:30</option>
										</#if>
										<#if 1000 gte endTime?datetime?string('HHmm')?number>
										<option>10:00</option>
										</#if>
										<#if 1030 gte endTime?datetime?string('HHmm')?number>
										<option>10:30</option>
										</#if>
										<#if 1100 gte endTime?datetime?string('HHmm')?number>
										<option>11:00</option>
										</#if>
										<#if 1130 gte endTime?datetime?string('HHmm')?number>
										<option>11:30</option>
										</#if>
										<#if 1200 gte endTime?datetime?string('HHmm')?number>
										<option>12:00</option>
										</#if>
										<#if 1230 gte endTime?datetime?string('HHmm')?number>
										<option>12:30</option>
										</#if>
										<#if 1300 gte endTime?datetime?string('HHmm')?number>
										<option>13:00</option>
										</#if>
										<#if 1330 gte endTime?datetime?string('HHmm')?number>
										<option>13:30</option>
										</#if>
										<#if 1400 gte endTime?datetime?string('HHmm')?number>
										<option>14:00</option>
										</#if>
										<#if 1430 gte endTime?datetime?string('HHmm')?number>
										<option>14:30</option>
										</#if>
										<#if 1500 gte endTime?datetime?string('HHmm')?number>
										<option>15:00</option>
										</#if>
										<#if 1530 gte endTime?datetime?string('HHmm')?number>
										<option>15:30</option>
										</#if>
										<#if 1600 gte endTime?datetime?string('HHmm')?number>
										<option>16:00</option>
										</#if>
										<#if 1630 gte endTime?datetime?string('HHmm')?number>
										<option>16:30</option>
										</#if>
										<#if 1700 gte endTime?datetime?string('HHmm')?number>
										<option>17:00</option>
										</#if>
										<#if 1730 gte endTime?datetime?string('HHmm')?number>
										<option>17:30</option>
										</#if>
										<#if 1800 gte endTime?datetime?string('HHmm')?number>
										<option>18:00</option>
										</#if>
										<#if 1830 gte endTime?datetime?string('HHmm')?number>
										<option>18:30</option>
										</#if>
										<#if 1900 gte endTime?datetime?string('HHmm')?number>
										<option>19:00</option>
										</#if>
									</select>
								</td>
							</tr>
							</#if>
							<tr>
								<td>
									<label for="remark" class="edit_lbl">备注:</label>
								</td>
								<td colspan="3">
									<textarea class="text ui-widget-content ui-corner-all" name="remark" id="remark" style="width: 494px;"></textarea>
								</td>
							</tr>
						</table>
						<input type="hidden" id="applyType" name="applyType" value="${applyType}" />
						<input type="hidden" id="carId" name="carId" value="${carId}" />
						<#if isDisplay('1_1_3')>	
							<input type="hidden" id="status" name="status" value="1" />
						</#if>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<#include "../../foot.ftl" />
