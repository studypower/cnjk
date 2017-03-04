<#include "../../head.ftl" />
<script type="text/javascript">
	$(function(){
		$("#tabs" ).tabs();
		$("#tabs").height($(window).height());
		$("#tabs > div").height($(window).height());
		$(window).resize(function(){
			var height=$(window).height();
			$("#tabs").height(height);
			$("#tabs > div").height(height);
		});
		$("#startTime").datepicker({
			dateFormat: "yy-mm-dd"
		});
		$("#endTime").datepicker({
			dateFormat: "yy-mm-dd"
		});
		$("#searchButton").button().click(function( event ) {
	    	event.preventDefault();
	    	if($("#startTime").val()==null || $("#startTime").val()==""){
	    		alert("起始时间不能为空");
	    		return;
	    	}
	    	if($("#endTime").val()==null || $("#endTime").val()==""){
	    		alert("结束时间不能为空");
	    		return;
	    	}
	    	$("#form1").submit();
	    });
	    $("#tableId").combobox({
		});
		$("#csv").customFileInput();
	    $("#pageloading").hide();
	});
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：电子工资单->我的工资单总计</div>
		</div>
		<div class="osx-modal-close" style="display: block;cursor: pointer;">
			<div class="osx-modal-icon-back">
				<div class="osx-modal-title" style="text-align: right;line-height: 13px;"><a href="javascript:history.go(-1);"><img src="${gzUrl('images/a_back.png')}" width="14" height="14" />返回</a></div>
			</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form_content">
				<div id="tabs">
				    <ul>
						<li><a href="#add" class="query_condition_lbl">增加</a></li>
					</ul>
					<div id="main_content" style="overflow:auto;">
						<form id="form1" action="${gzUrl('dzgzd/gzdtj/wageSum.do')}" method="post">
						<table border="0" width="680" style="overflow: hidden;">
							<tr>
								<td width="180px">
									<label for="起始时间" class="query_condition_lbl">起始时间设置:</label>
								</td>
								<td width="200px">
									<input type="text" id="startTime" name="startTime" class="text ui-widget-content ui-corner-all" value="<#if startTime?exists>${startTime?date}</#if>" readonly/>
								</td>
								<td width="300px"></td>
							</tr>
							<tr>
								<td>
									<label for="结束时间" class="query_condition_lbl">结束时间设置:</label>
								</td>
								<td>
									<input type="text" id="endTime" name="endTime" class="text ui-widget-content ui-corner-all" value="<#if startTime?exists>${endTime?date}</#if>" readonly/>
								</td>
								<td></td>
							</tr>
							<tr>
								<td colspan="3">
									<label class="query_condition_lbl">输入起始和结束时间，点击查询按钮查询此段时间内的工资总计。</label>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<input type="button" id="searchButton" value="开始统计" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<br/><br/>
								</td>
							</tr>
							<#if wageSumMap?exists && startTime?exists>
							<tr>
								<td>
									<label for="统计结果" class="query_condition_lbl">05号工资总计:</label>
								</td>
								<td>
									<input type="text" id="wageSum" name="wageSum" class="text ui-widget-content ui-corner-all" value="${wageSumMap.wage_sum4?if_exists?string('0.00')}" readonly/>
								</td>
								<td></td>
							</tr>
							<tr>
								<td>
									<label for="统计结果" class="query_condition_lbl">20号奖金（加发）总计:</label>
								</td>
								<td>
									<input type="text" id="wageSum" name="wageSum" class="text ui-widget-content ui-corner-all" value="${wageSumMap.wage_sum5?if_exists?string('0.00')}" readonly/>
								</td>
								<td></td>
							</tr>
							<tr>
								<td>
									<label for="统计结果" class="query_condition_lbl">20号奖金总计:</label>
								</td>
								<td>
									<input type="text" id="wageSum" name="wageSum" class="text ui-widget-content ui-corner-all" value="${wageSumMap.wage_sum6?if_exists?string('0.00')}" readonly/>
								</td>
								<td></td>
							</tr>
							<tr>
								<td>
									<label for="统计结果" class="query_condition_lbl">所有金额总计:</label>
								</td>
								<td>
									<input type="text" id="wageSum" name="wageSum" class="text ui-widget-content ui-corner-all" value="${(wageSumMap.wage_sum-wageSumMap.wage_sum5)?if_exists?string('0.00')}" readonly/>
								</td>
								<td></td>
							</tr>
							</#if>
						</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<#include "../../foot.ftl" />
