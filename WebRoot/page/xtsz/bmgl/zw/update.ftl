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
	    	if($("#positionId").val()==0){
	    	   alert("请选择职位");
	    	   return false;
	    	}
	    	$("#form1").submit();
	    });
	});
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置： 系统设置->科室职位设置->科室职位</div>
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
						<form id="form1" name="form1" action="${gzUrl('xtsz/bmgl/zw/update.do')}" method="post">
							<table border="0" width="280" style="overflow: hidden;">
								<tr>
									<td>
										<label class="edit_lbl">科室名称:</label>
									</td>
									<td colspan="3">
										<input type="text" class="text ui-widget-content ui-corner-all" value="${departmentInfo.name}" readonly/>
										<input id="departmentId" name="departmentId" type="hidden" value="${departmentInfo.id}"/>
										<input id="id" name="id" type="hidden" value="${departmentPosition.id}"/>
									</td>
								</tr>
								<tr>
									<td>
										<label for="positionId" class="edit_lbl">职位名称:</label>
									</td>
									<td colspan="3">
										<select id="positionId" name="positionId" class="select01">
					                  		<option value="0"></option>
					                		<#list positionInfoList as positionInfo>
					                			<#assign num=0 />
					                			<#list departmentPositionList as departmentPosition>
					                				<#if positionInfo.id==departmentPosition.position_id>
					                					<#break />
					                				</#if>
					                				<#assign num = num+1 />
					                			</#list>
					                			<#if num == departmentPositionList.size() || positionInfo.id==departmentPosition.position_id>
					                				<option value="${positionInfo.id}" <#if (form.positionId?exists && positionInfo.id==form.positionId) || positionInfo.id==departmentPosition.position_id>selected</#if>>${positionInfo.name}</option>
					                			</#if>
					                		</#list>
					                	</select>
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
<#include "../../../foot.ftl" />
