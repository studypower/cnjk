<#include "../../../head.ftl" />
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
	    $("#form_content select").combobox();
		$("#pageloading").hide();
		$("#save").button().click(function( event ) {
	    	event.preventDefault();
	    	if($("#startTime").val()==""){
	    	   alert("请填写开始时间");
	    	   return false;
	    	}
	    	if($("#endTime").val()==""){
	    	   alert("请填写结束时间");
	    	   return false;
	    	}
	    	$("#form1").submit();
	    });
	});
	<#if result?exists>
	  <#if result==0>
	    alert("修改失败");
	   </#if>  
	</#if>
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：用车申请->数据字典->用车时间设置</div>
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
						<li><a href="#add" style="font-size: ;font-family: 'yakov_wryh';">修改</a></li>
					</ul>
					<div id="add" style="overflow:auto;">
						<form id="form1" name="form1" action="${gzUrl('xtsz/sjzd/ycsj/update.do')}" method="post">
							<table border="0" width="310" style="overflow: hidden;">
							  <input type="hidden" id="id" name="id" class="text ui-widget-content ui-corner-all" value="${dataCarUseTime.id}"/>
							   	<tr>
									<td>
										<label for="startTime" class="edit_lbl">开始时间:</label>
									</td>
									<td colspan="3">
										<select id="startTime" name="startTime">
											<option <#if "06:00" == dataCarUseTime.start_time>selected</#if>>06:00</option>
											<option <#if "06:30" == dataCarUseTime.start_time>selected</#if>>06:30</option>
											<option <#if "07:00" == dataCarUseTime.start_time>selected</#if>>07:00</option>
											<option <#if "07:30" == dataCarUseTime.start_time>selected</#if>>07:30</option>
											<option <#if "08:00" == dataCarUseTime.start_time>selected</#if>>08:00</option>
											<option <#if "08:30" == dataCarUseTime.start_time>selected</#if>>08:30</option>
											<option <#if "09:00" == dataCarUseTime.start_time>selected</#if>>09:00</option>
											<option <#if "09:30" == dataCarUseTime.start_time>selected</#if>>09:30</option>
											<option <#if "10:00" == dataCarUseTime.start_time>selected</#if>>10:00</option>
											<option <#if "10:30" == dataCarUseTime.start_time>selected</#if>>10:30</option>
											<option <#if "11:00" == dataCarUseTime.start_time>selected</#if>>11:00</option>
											<option <#if "11:30" == dataCarUseTime.start_time>selected</#if>>11:30</option>
											<option <#if "12:00" == dataCarUseTime.start_time>selected</#if>>12:00</option>
											<option <#if "12:30" == dataCarUseTime.start_time>selected</#if>>12:30</option>
											<option <#if "13:00" == dataCarUseTime.start_time>selected</#if>>13:00</option>
											<option <#if "13:30" == dataCarUseTime.start_time>selected</#if>>13:30</option>
											<option <#if "14:00" == dataCarUseTime.start_time>selected</#if>>14:00</option>
											<option <#if "14:30" == dataCarUseTime.start_time>selected</#if>>14:30</option>
											<option <#if "15:00" == dataCarUseTime.start_time>selected</#if>>15:00</option>
											<option <#if "15:30" == dataCarUseTime.start_time>selected</#if>>15:30</option>
											<option <#if "16:00" == dataCarUseTime.start_time>selected</#if>>16:00</option>
											<option <#if "16:30" == dataCarUseTime.start_time>selected</#if>>16:30</option>
											<option <#if "17:00" == dataCarUseTime.start_time>selected</#if>>17:00</option>
											<option <#if "17:30" == dataCarUseTime.start_time>selected</#if>>17:30</option>
											<option <#if "18:00" == dataCarUseTime.start_time>selected</#if>>18:00</option>
											<option <#if "18:30" == dataCarUseTime.start_time>selected</#if>>18:30</option>
											<option <#if "19:00" == dataCarUseTime.start_time>selected</#if>>19:00</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>
										<label for="endTime" class="edit_lbl">结束时间:</label>
									</td>
									<td colspan="3">
										<select id="endTime" name="endTime">
											<option <#if "06:00" == dataCarUseTime.end_time>selected</#if>>06:00</option>
											<option <#if "06:30" == dataCarUseTime.end_time>selected</#if>>06:30</option>
											<option <#if "07:00" == dataCarUseTime.end_time>selected</#if>>07:00</option>
											<option <#if "07:30" == dataCarUseTime.end_time>selected</#if>>07:30</option>
											<option <#if "08:00" == dataCarUseTime.end_time>selected</#if>>08:00</option>
											<option <#if "08:30" == dataCarUseTime.end_time>selected</#if>>08:30</option>
											<option <#if "09:00" == dataCarUseTime.end_time>selected</#if>>09:00</option>
											<option <#if "09:30" == dataCarUseTime.end_time>selected</#if>>09:30</option>
											<option <#if "10:00" == dataCarUseTime.end_time>selected</#if>>10:00</option>
											<option <#if "10:30" == dataCarUseTime.end_time>selected</#if>>10:30</option>
											<option <#if "11:00" == dataCarUseTime.end_time>selected</#if>>11:00</option>
											<option <#if "11:30" == dataCarUseTime.end_time>selected</#if>>11:30</option>
											<option <#if "12:00" == dataCarUseTime.end_time>selected</#if>>12:00</option>
											<option <#if "12:30" == dataCarUseTime.end_time>selected</#if>>12:30</option>
											<option <#if "13:00" == dataCarUseTime.end_time>selected</#if>>13:00</option>
											<option <#if "13:30" == dataCarUseTime.end_time>selected</#if>>13:30</option>
											<option <#if "14:00" == dataCarUseTime.end_time>selected</#if>>14:00</option>
											<option <#if "14:30" == dataCarUseTime.end_time>selected</#if>>14:30</option>
											<option <#if "15:00" == dataCarUseTime.end_time>selected</#if>>15:00</option>
											<option <#if "15:30" == dataCarUseTime.end_time>selected</#if>>15:30</option>
											<option <#if "16:00" == dataCarUseTime.end_time>selected</#if>>16:00</option>
											<option <#if "16:30" == dataCarUseTime.end_time>selected</#if>>16:30</option>
											<option <#if "17:00" == dataCarUseTime.end_time>selected</#if>>17:00</option>
											<option <#if "17:30" == dataCarUseTime.end_time>selected</#if>>17:30</option>
											<option <#if "18:00" == dataCarUseTime.end_time>selected</#if>>18:00</option>
											<option <#if "18:30" == dataCarUseTime.end_time>selected</#if>>18:30</option>
											<option <#if "19:00" == dataCarUseTime.end_time>selected</#if>>19:00</option>
										</select>
									</td>
								</tr>
								<tr>
									<td colspan="4">
										<input type="button" id="save" value="修改" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
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
<#include "../../../foot.ftl" />
