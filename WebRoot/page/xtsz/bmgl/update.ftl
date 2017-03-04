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
	    $("#form_content select").combobox();
		$("#pageloading").hide();
		$("#isKqsyShow").change(function(){
			if(this.checked){
				$("#kqsyOrder").removeAttr("disabled");
			}else{
				$("#kqsyOrder").attr("disabled","disabled");
			}
			$("#kqsyOrder").val("0");
		});
		$("#save").button().click(function( event ) {
	    	event.preventDefault();
	    	if($("#name").val()==""){
	    	   alert("请填写科室名称");
	    	   return false;
	    	}
	    	if($("#isKqsyShow").attr("checked")){
	    		var reg = new RegExp("^[0-9]*$");
	    		var kqsyOrderByVal = $("#kqsyOrder").val();
				if(kqsyOrderByVal==""){
			        alert("请输入数字!");
			    	return;
			    }
			    if(!reg.test(kqsyOrderByVal)){  
			        alert("请输入数字!");
			        return;
			    }  
			    if(!/^[0-9]*$/.test(kqsyOrderByVal)){  
			        alert("请输入数字!");
			        return;
			    }
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
			<div class="osx-modal-title">您现在所在的位置：系统设置->科室职位设置->科室管理</div>
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
						<form id="form1" name="form1" action="${gzUrl('xtsz/bmgl/update.do')}" method="post">
							<table border="0" width="320" style="overflow: hidden;">
							  <input type="hidden" id="baseId" name="baseId" class="text ui-widget-content ui-corner-all" value="${baseId?if_exists}"/>
							   <#if baseId?exists && baseId!=0>
							   	<tr>
									<td>
										<label for="name" class="edit_lbl">上级科室名称:</label>
									</td>
									<td colspan="3">
										<input type="text" class="text ui-widget-content ui-corner-all" value="${baseDepartment.name?if_exists}" readOnly/>
									</td>
								</tr>
							    </#if>	
								<tr>
									<td>
										<label for="name" class="edit_lbl">科室名称:</label>
									</td>
									<td colspan="3">
										<input type="text" id="name" name="name" class="text ui-widget-content ui-corner-all" value="${departmentInfo.name?if_exists}"/>
									</td>
								</tr>
								<tr>
									<td>
										<label for="isKqsyShow" class="edit_lbl">是否展示考勤首页:</label>
									</td>
									<td colspan="3">
										<input type="checkbox" id="isKqsyShow" name="isKqsyShow" <#if departmentInfo.isKqsyShow?exists&&departmentInfo.isKqsyShow?if_exists==1 >checked=checked</#if> value="1" class="checkbox ui-widget-content ui-corner-all"/>
									</td>
								</tr>
								<tr>
									<td>
										<label for="kqsyOrder" class="edit_lbl">考勤首页展示排序:</label>
									</td>
									<td colspan="3">
										<input type="text" id="kqsyOrder" name="kqsyOrder" value="${departmentInfo.kqsyOrder?if_exists}" class="text ui-widget-content ui-corner-all" style="width:28px" <#if departmentInfo.isKqsyShow?exists&&departmentInfo.isKqsyShow?if_exists!=1 >disabled=disabled</#if> />
									</td>
								</tr>
								<tr>
									<td colspan="4">
										<input type="hidden" id="id" name="id" class="input_01" value="${departmentInfo.id?if_exists}" />
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
<#include "../../foot.ftl" />
