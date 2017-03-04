<#include "../../head.ftl" />
<script type="text/javascript">
	var setting = {
		check: {
			enable: true,
			showLine: true,
			selectedMulti: false 
		},
		data: {
			simpleData: {
				enable:true,
				idKey: "key",
				pIdKey: "parent_key",
				rootPId: null 
			}
		},
		callback: {
			onCheck: function(e,treeId, treeNode) {
				var menuKeys = "";
				var treeNodes = $.fn.zTree.getZTreeObj("menuTree").getCheckedNodes();
				for(var index in treeNodes){
					if(menuKeys!=""){
						menuKeys+=",";
					}
					menuKeys += treeNodes[index].key;
				}
				document.getElementById('menuKeys').value = menuKeys;
			}
		} 
	};
	
	var zNodes = ${menuInfoList};
	
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
	    	var menuKeys = "";
			var treeNodes = $.fn.zTree.getZTreeObj("menuTree").getCheckedNodes();
			for(var index in treeNodes){
				if(menuKeys!=""){
					menuKeys+=",";
				}
				menuKeys += treeNodes[index].key;
			}
	    	if($("#name").val()==""){
	    	   alert("请填写项帐号名");
	    	   return false;
	    	}
	    	if($("#pwd").val()==""){
	    	   alert("请填写密码");
	    	   return false;
	    	}
	    	if($("#departmentId").val()==0){
	    	   alert("请选择科室");
	    	   return false;
	    	}
	    	$("#userForm").submit();
	    });
	    $("#form_content select").combobox();
		$("#pageloading").hide();
		$("#roleId").combobox({
			select:function() {
				if($("#roleId").val()!=0){
					$.get("${gzUrl('xtsz/jssz/getRoleMenuList.do')}?id="+ $("#roleId").val()+"&timestamp="+Date.parse(new Date()), null, callback);
				}
			}
		});
		$.fn.zTree.init($("#menuTree"), setting, zNodes);
		var zTree = $.fn.zTree.getZTreeObj("menuTree");
		zTree.setting.check.chkboxType = { "Y" : "ps", "N" : "ps" };
	});
	

	function callback(data){
		if(data!=null && data!=""){
			$.fn.zTree.init($("#menuTree"), setting, eval("("+data+")"));
			var zTree = $.fn.zTree.getZTreeObj("menuTree");
			zTree.setting.check.chkboxType = { "Y" : "ps", "N" : "ps" };
		}
	}
</script>
<body>
	<div id="pageloading"></div> 
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：系统设置->帐号设置</div>
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
						<li><a href="#userInfo" style="font-size: ;font-family: 'yakov_wryh';">增加</a></li>
					</ul>
					<div id="userInfo" style="overflow:auto;">
						<form id="userForm" name="userForm" action="${gzUrl('xtsz/yhgl/add.do')}" method="post">
							<table border="0" width="800" style="overflow: hidden;">
								<tr>
									<td width="100px">
										<label for="name" class="edit_lbl">帐号名:</label>
									</td>
									<td colspan="3">
										<input type="text" id="name" name="name" class="text ui-widget-content ui-corner-all"/>
									</td>
								</tr>
								<tr>
									<td>
										<label for="name" class="edit_lbl">帐号密码:</label>
									</td>
									<td colspan="3">
										<input type="password" id="pwd" name="pwd" class="text ui-widget-content ui-corner-all"/>
									</td>
								</tr>
								<tr>
									<td>
										<label for="staffId" class="edit_lbl">职工姓名:</label>
									</td>
									<td colspan="3">
										<select id="staffId" name="staffId" class="select01">
					                		<option value="0">不绑定职工</option>
					                		<#list staffInfoList as staffInfo>
					                			<option value="${staffInfo.id}">${staffInfo.name}--${staffInfo.departmentName?if_exists}</option>
					                		</#list>
					                	</select>
									</td>
								</tr>
								<tr>
									<td>
										<label for="roleId" class="edit_lbl">权限级别:</label>
									</td>
									<td colspan="3">
										<select id="roleId" name="roleId">
					                		<option value="0">尚未套用权限级别</option>
					                		<#list roleInfoList as roleInfo>
					                			<option value="${roleInfo.id}" <#if form.roleId?exists && roleInfo.id==form.roleId>selected</#if>>${roleInfo.name}</option>
					                		</#list>
					                	</select>
									</td>
								</tr>
								<tr>
									<td style="vertical-align:top;">
										<label for="fee" class="edit_lbl">独立权限设置:</label>
									</td>
									<td colspan="3">
										<ul id="menuTree" class="ztree"></ul>
									</td>
								</tr>
								<tr>
									<td colspan="4">
										<input type="hidden" id="menuKeys" name="menuKeys" />
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
