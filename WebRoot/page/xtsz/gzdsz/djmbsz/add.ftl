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
		$("#saveBtn").button().click(function( event ) {
	    	event.preventDefault();
	    	 if($("#name").val()==""){
			     alert("请填写模板名称");
			     return false;
			 }
	    	$("#form1").submit();
	    });
	    $("#columnType").combobox({
		});
	    $("#pageloading").hide();
	});
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：系统设置->工资单设置->单据模版设置</div>
		</div>
		<div class="osx-modal-close" style="display: block;cursor: pointer;">
			<div class="osx-modal-icon-back">
				<div class="osx-modal-title" style="text-align: right;line-height: 13px;">
				  <a href="javascript:history.go(-1);"><img src="${gzUrl('images/a_back.png')}" width="14" height="14" />返回</a>
				</div>  
			</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form_content">
				<div id="tabs">
					<ul>
						<li><a href="#main_content" style="font-size: ;font-family: 'yakov_wryh';">增加</a></li>
					</ul>
					<div id="main_content" style="overflow:auto;">
						<form id="form1" name="form1" action="${gzUrl('xtsz/gzdsz/djmbsz/add.do')}" method="post">
							<table border="0" width="800" style="overflow: hidden;">
								<tr>
									<td width="70px">
										<label for="name" class="edit_lbl">模板名称:</label>
									</td>
									<td colspan="3">
										<input type="text" id="name" name="name" class="text ui-widget-content ui-corner-all"/>
									</td>
								</tr>
								<tr>
									<td>
										<label for="remark" class="edit_lbl">模板描述:</label>
									</td>
									<td colspan="3">
										<textarea class="text ui-widget-content ui-corner-all" name="remark" id="remark" style="width: 494px;"></textarea>
									</td>
								</tr>
								<tr>
									<td colspan="4">
										<input type="button" id="saveBtn" value="保存" style="font-size: ;font-family: 'yakov_wryh';width: 120px;"/>
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
