<#include "../../head.ftl" />
<script type="text/javascript">
	$(function(){
		$("#tabs" ).tabs();
		$("#tabs").height($(window).height()-35);
		$("#tabs > div").height($(window).height()-102);
		$(window).resize(function(){
			var height=$(window).height();
			$("#tabs").height(height-35);
			$("#tabs > div").height(height-102);
		});
		$("#save").button().click(function( event ) {
	    	event.preventDefault();
	        if($("#brandName").val()==""){
	    	   alert("请填写车辆名称");
	    	   return false;
	    	}
	    	if($("#brandModel").val()==""){
	    	   alert("请填写车辆型号");
	    	   return false;
	    	}
	    	if($("#idNum").val()==""){
	    	   alert("请填写车牌号");
	    	   return false;
	    	}
	    	if($("#seats").val()==""){
	    	   alert("请填写座位数");
	    	   return false;
	    	}
	    	if($("#buyTime").val()==""){
	    	   alert("请填写购置日期");
	    	   return false;
	    	}
	    	if($("#startTime").val()==""){
	    	   alert("请填写有效起始日期");
	    	   return false;
	    	}
	    	if($("#endTime").val()==""){
	    	   alert("请填写有效结束日期");
	    	   return false;
	    	}
	    	$("#form1").submit();
	    });
	    $("#buyTime").datepicker({
			dateFormat: "yy-mm-dd"
		});
	    $("#startTime").datepicker({
			dateFormat: "yy-mm-dd"
		});
	    $("#endTime").datepicker({
			dateFormat: "yy-mm-dd"
		});
		$("#status").combobox();
		$("#pageloading").hide();
	});
</script>
<body>
<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：车辆申请->用车申请->用车申请记录</div>
		</div>
		<div class="osx-modal-close" style="display: block;cursor: pointer;">
			<div class="osx-modal-icon-back">
				<div class="osx-modal-title" style="text-align: right;line-height: 13px;"><a href="javascript:history.go(-1);">返回</a></div>
			</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form_content">
				<div id="tabs">
				     <ul>
						<li><a href="#add" style="font-size: ;font-family: 'yakov_wryh';">修改</a></li>
					</ul>
					<div id="project" style="overflow:auto;">
						<form id="form1" name="form1" action="${gzUrl('clgl/clxx/update.do')}" enctype="multipart/form-data" method="post">
							<table border="0" width="800" style="overflow: hidden;">
								<tr>
									<td>
										<label for="brandName" class="edit_lbl">车辆名称:</label>
									</td>
									<td>
										<input type="text" id="brandName" name="brandName" class="text ui-widget-content ui-corner-all" value="${carInfo.brand_name?if_exists}"/>
									</td>
								</tr>
			                    <tr>
									<td>
										<label for="brandModel" class="edit_lbl">车辆型号:</label>
									</td>
									<td>
										<input type="text" id="brandModel" name="brandModel" class="text ui-widget-content ui-corner-all" value="${carInfo.brand_model?if_exists}" />
									</td>
								</tr>
								<tr>
									<td>
										<label for="idNum" class="edit_lbl">车牌号:</label>
									</td>
									<td>
										<input type="text" id="idNum" name="idNum" class="text ui-widget-content ui-corner-all" value="${carInfo.id_num?if_exists}" />
									</td>
								</tr>
								<tr>
									<td>
										<label for="seatsNum" class="edit_lbl">座位数:</label>
									</td>
									<td>
										<input type="text" id="seatsNum" name="seatsNum" class="text ui-widget-content ui-corner-all" value="${carInfo.seats_num?if_exists}" />
									</td>
								</tr>
								<tr>
									<td>
										<label for="buyTime" class="edit_lbl">购置日期:</label>
									</td>
									<td>
										<input type="text" id="buyTime" name="buyTime" class="text ui-widget-content ui-corner-all" value="${carInfo.buy_time?if_exists}" />
									</td>
								</tr>
								<tr>
									<td>
										<label for="startTime" class="edit_lbl">有效日期:</label>
									</td>
									<td>
										<input type="text" id="startTime" name="startTime" class="text ui-widget-content ui-corner-all" value="${carInfo.start_time?if_exists}"/>
										~
										<input type="text" id="endTime" name="endTime" class="text ui-widget-content ui-corner-all" value="${carInfo.end_time?if_exists}" />
									</td>
								</tr>
								<tr>
									<td>
										<label for="status" class="edit_lbl">车辆状态:</label>
									</td>
									<td>
										<select id="status" name="status">
											<option value="1" <#if carInfo.status==1>selected</#if>>正常</option>
											<option value="0" <#if carInfo.status==0>selected</#if>>保养</option>
											<option value="-1" <#if carInfo.status==-1>selected</#if>>维修</option>
										</select>
									</td>
								</tr>
								<tr>
                                     <td><label for="remark" class="edit_lbl">说明:</label></td>
                                     <td>
                                     	<textarea id="remark" class="text ui-widget-content ui-corner-all" style="width: 494px;" name="remark">${carInfo.remark?if_exists}</textarea>
                                     </td>
                                </tr>
                                <tr>
									<td colspan="2">
										<input type="hidden" id="id" name="id" class="text ui-widget-content ui-corner-all" value="${carInfo.id?if_exists}" />
										<input type="button" id="save" value="保存" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<#include "../../foot.ftl" />
