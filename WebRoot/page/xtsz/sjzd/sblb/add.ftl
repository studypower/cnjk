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
	    	if($("#name").val()==""){
	    	   alert("请填设备类别名称");
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
			<div class="osx-modal-title">您现在所在的位置：系统设置->数据字典->设备类别设置</div>
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
						<li><a href="#add" style="font-size: ;font-family: 'yakov_wryh';">增加</a></li>
					</ul>
					<div id="add" style="overflow:auto;">
						<form id="form1" name="form1" action="${gzUrl('xtsz/sjzd/sblb/add.do')}" method="post">
							<table border="0" width="310" style="overflow: hidden;">
							   	<tr>
									<td>
										<label for="name" class="edit_lbl">设备类别名称:</label>
									</td>
									<td>
										<input type="text" id="name" name="name" class="text ui-widget-content ui-corner-all"/>
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
