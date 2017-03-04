<#include "head.ftl" />
<script type="text/javascript">
	$(function(){
		$("#tabs" ).tabs();
		$("#tabs").height(300);
		$("#tabs > div").height(300);
		$(window).resize(function(){
			var height=$(window).height();
			$("#tabs").height(height);
			$("#tabs > div").height(height);
		});
		$("#saveBtn").button().click(function( event ) {
	    	event.preventDefault();
	    	$("#form1").submit();
	    });
	    $("#pageloading").hide();
	});
	
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form_content">
				<div id="tabs">
					<div id="main_content" style="overflow:auto;">
						<table border="0" width="650" style="overflow: hidden;">
							<tr>
								<td width="80px">
									<label for="" class="edit_lbl">消息标题:</label>
								</td>
								<td colspan="3">
									<input type="text" id="" name="" class="text ui-widget-content ui-corner-all" value="${msgInfo.msg_title?if_exists}" readonly/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="" class="edit_lbl">消息时间:</label>
								</td>
								<td colspan="3">
									<input type="text" id="" name="" class="text ui-widget-content ui-corner-all" value="${msgInfo.msg_time?if_exists}" readonly/>
								</td>
							</tr>
							<tr>
								<td valign="top">
									<label for="" class="edit_lbl">消息内容:</label>
								</td>
								<td colspan="3">
									<textarea class="text ui-widget-content ui-corner-all" name="" id="" style="width: 494px;" rows="5" readonly>${msgInfo.msg_content?if_exists}</textarea>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<#include "foot.ftl" />