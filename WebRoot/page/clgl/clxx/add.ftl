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
	    	if($("#seatsNum").val()==""){
	    	   alert("请填写座位数");
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
	<#if result?exists>
	     <#if result==0> 
	          alert("添加失败"); 
	     </#if>             
	</#if>
</script>
<body>
<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：车辆申请->车辆管理</div>
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
						<li><a href="#add" style="font-size: ;font-family: 'yakov_wryh';">增加</a></li>
					</ul>
					<div id="project" style="overflow:auto;">
						<form id="form1" name="form1" action="${gzUrl('clgl/clxx/add.do')}" enctype="multipart/form-data" method="post">
							<table border="0" width="600" style="overflow: hidden;">
								<tr>
									<td width="80px">
										<label for="brandName" class="edit_lbl">车辆名称:</label>
									</td>
									<td>
										<input type="text" id="brandName" name="brandName" class="text ui-widget-content ui-corner-all"/>
									</td>
									<td width="80px">
										<label for="brandModel" class="edit_lbl">车辆型号:</label>
									</td>
									<td>
										<input type="text" id="brandModel" name="brandModel" class="text ui-widget-content ui-corner-all" />
									</td>
								</tr>
								<tr>
									<td>
										<label for="idNum" class="edit_lbl">车牌号:</label>
									</td>
									<td>
										<input type="text" id="idNum" name="idNum" class="text ui-widget-content ui-corner-all" />
									</td>
									<td>
										<label for="seatsNum" class="edit_lbl">座位数:</label>
									</td>
									<td>
										<input type="text" id="seatsNum" name="seatsNum" class="text ui-widget-content ui-corner-all" />
									</td>
								</tr>
								<tr>
									<td>
										<label for="buyTime" class="edit_lbl">购置日期:</label>
									</td>
									<td>
										<input type="text" id="buyTime" name="buyTime" class="text ui-widget-content ui-corner-all" />
									</td>
									<td>
										<label for="status" class="edit_lbl">车辆状态:</label>
									</td>
									<td>
										<select id="status" name="status">
											<option value="1">正常</option>
											<option value="0">保养</option>
											<option value="-1">维修</option>
											<option value="-2">外借</option>
											<option value="-3">其他</option>
										</select>
									</td>
								</tr>
								<tr>
                                     <td><label for="remark" class="edit_lbl">备注:</label></td>
                                     <td colspan="3">
                                     	<textarea id="remark" class="text ui-widget-content ui-corner-all" style="width: 494px;" name="remark"></textarea>
                                     </td>
                                </tr>
								<tr>
									<td colspan="4">
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
