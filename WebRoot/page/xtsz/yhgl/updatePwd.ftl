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
	    	if($("#pwd").val()==""){
	    	   alert("请填写旧密码");
	    	   return false;
	    	}
	    	if($("#newPwd").val()==""){
	    	   alert("请填写新密码");
	    	   return false;
	    	}
	    	if($("#rePwd").val()==""){
	    	   alert("请确认密码");
	    	   return false;
	    	}
	    	if($("#newPwd").val()!=$("#rePwd").val()){
	    	   alert("两次密码输入不一致");
	    	   return false;
	    	}
	    	$("#userForm").submit();
	    });
	    $("#form_content select").combobox();
		$("#pageloading").hide();
	});
	
	<#if result?exists>
	   <#if result==1>
	     alert("密码修改成功");
	   <#elseif result==-1>
	     alert("密码修改失败，旧密码错误");
	   <#elseif result==0>
	     alert("密码修改失败");
	   </#if>       
	</#if>
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：修改密码</div>
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
						<li><a href="#userInfo" style="font-size: ;font-family: 'yakov_wryh';">修改</a></li>
					</ul>
					<div id="userInfo" style="overflow:auto;">
						<form id="userForm" name="userForm" action="${gzUrl('xtsz/yhgl/updatePwd.do')}" method="post">
							<table border="0" width="800" style="overflow: hidden;">
								<tr>
									<td width="100px">
										<label for="pwd" class="edit_lbl">旧密码:</label>
									</td>
									<td colspan="3">
										<input type="password" id="pwd" name="pwd" class="text ui-widget-content ui-corner-all"/>
									</td>
								</tr>
								<tr>
									<td>
										<label for="newPwd" class="edit_lbl">新密码:</label>
									</td>
									<td colspan="3">
										<input type="password" id="newPwd" name="newPwd" class="text ui-widget-content ui-corner-all"/>
									</td>
								</tr>
					             <tr>
									<td>
										<label for="rePwd" class="edit_lbl">确认密码:</label>
									</td>
									<td colspan="3">
										<input type="password" id="rePwd" name="rePwd" class="text ui-widget-content ui-corner-all"/>
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
