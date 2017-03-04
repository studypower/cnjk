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
		$("#save").button().click(function( event ) {
	    	event.preventDefault();
	    	if($("#name").val()==""){
	    	   alert("请填写职位名称");
	    	   return false;
	    	}
	    	$("#form1").submit();
	    });
	   $("#constructionData").datepicker({
	    dateFormat: "yy-mm-dd"
      });
		$("#datum").customFileInput();
	});
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：系统设置->科室职位设置->职位管理</div>
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
						<li><a href="#userInfo" style="font-size: ;font-family: 'yakov_wryh';">修改</a></li>
					</ul>
					<div id="userInfo" style="overflow:auto;">
						<form id="form1" name="form1" action="${gzUrl('xtsz/zwgl/update.do')}" method="post">
							<table border="0" width="800" style="overflow: hidden;">
							    <input type="hidden" id="id" name="id" class="text ui-widget-content ui-corner-all" value="${positionInfo.id?if_exists}"/>
								<tr>
									<td width="70px">
										<label for="name" class="edit_lbl">职位名称:</label>
									</td>
									<td colspan="3">
										<input type="text" id="name" name="name" class="text ui-widget-content ui-corner-all" value="${positionInfo.name?if_exists}"/>
									</td>
								</tr>
								  <tr>
									<td>
										<label for="status" class="edit_lbl">职位状态:</label>
									</td>
									<td colspan="3">
										 <select id="status" name="status"  class="select01">
										         <option value="0" <#if positionInfo.status?if_exists==0>selected</#if>>禁用</option>
										         <option value="1" <#if positionInfo.status?if_exists==1>selected</#if>>启用</option>
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
<#include "../../foot.ftl" />