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
	    	if($("#key").val()==""){
	    	   alert("请填写导航Key");
	    	   return false;
	    	}
	        if($("#name").val()==0){
	    	   alert("请填写导航名称");
	    	   return false;
	    	}
	    	$("#form1").submit();
	    });
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
			<div class="osx-modal-title">您现在所在的位置： 系统设置->导航设置</div>
		</div>
		<div class="osx-modal-close" style="display: block;cursor: pointer;">
			<div class="osx-modal-icon-back">
				<div class="osx-modal-title" style="text-align: right;line-height: 13px;">
				   <#if parentMenuInfo?exists>
				       <a href="javascript:history.go(-1);"><img src="${gzUrl('images/a_back.png')}" width="14" height="14" />返回</a>
				   <#else>
				        <a href="javascript:history.go(-1);"><img src="${gzUrl('images/a_back.png')}" width="14" height="14" />返回</a> 
				   </#if>
				</div>
			</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div id="form_content">
				<div id="tabs">
					<ul>
						<li><a href="#add" style="font-size: ;font-family: 'yakov_wryh';">修改</a></li>
					</ul>
					<div id="add" style="overflow:auto;">
						<form id="form1" name="form1" action="${gzUrl('xtsz/dhsz/update.do')}" method="post">
							<table border="0" width="600" style="overflow: hidden;">
							  <#if parentMenuInfo?exists>
								<tr>
									<td width="100">
										<label for="parentKey" class="edit_lbl">上级导航key:</label>
									</td>
									<td colspan="3">
									    <input type="hidden" id="parentKey" name="parentKey"  class="text ui-widget-content ui-corner-all" value="${parentMenuInfo.key?if_exists}"/>
										<input type="text" class="text ui-widget-content ui-corner-all" value="${parentMenuInfo.key?if_exists}" readonly/>
									</td>
								</tr>
								<tr>
									<td>
										<label for="name" class="edit_lbl">上级导航名称:</label>
									</td>
									<td colspan="3">
										<input type="text" class="text ui-widget-content ui-corner-all" value="${parentMenuInfo.name?if_exists}" readonly/>
									</td>
								</tr>
							</#if>
								
								<tr>
									<td width="70">
										<label for="key" class="edit_lbl">导航key:</label>
									</td>
									<td colspan="3">
										<input type="text" class="text ui-widget-content ui-corner-all" name="key" id="key" value="${menuInfo.key?if_exists}"/>
									</td>
								</tr>
								
								<tr>
									<td>
										<label for="name" class="edit_lbl">导航名称:</label>
									</td>
									<td colspan="3">
										<input type="text" class="text ui-widget-content ui-corner-all" id="name" name="name" value="${menuInfo.name?if_exists}"/>
									</td>
								</tr>
							  <#if menuInfo.countChild == 0>
								<tr>
									<td>
										<label for="url" class="edit_lbl">导航url:</label>
									</td>
									<td colspan="3">
										<input type="text" class="text ui-widget-content ui-corner-all" id="url" name="url"  style="width:400px;" value="${menuInfo.url?if_exists}"/>
									</td>
								</tr>
							  </#if>
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
