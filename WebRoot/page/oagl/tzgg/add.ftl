<#include "../../head.ftl" />
<link href="${gzUrl('script/ueditor1_4_3-utf8-jsp/themes/default/css/ueditor.css')}" type="text/css" rel="stylesheet" />
<link href="${gzUrl('script/artDialog4.1.7/skins/blue.css')}" type="text/css" rel="stylesheet" />
<link href="${gzUrl('script/jquery-treeview/jquery.treeview.css')}" type="text/css" rel="stylesheet" />
<script src="${gzUrl('script/xheditor-1.1.14/xheditor-1.1.14-zh-cn.min.js')}"></script>
<script src="${gzUrl('script/artDialog4.1.7/jquery.artDialog.js')}" charset="utf-8"></script>
<script src="${gzUrl('script/jquery-treeview/jquery.treeview.min.js')}" charset="utf-8"></script>
<style>
*{
	font-size:12px;
}
body{
	overflow: overlay;
		overflow:scroll;
}
.from_div table {
	width: 98%;
	margin: 3px;
}
.from_div table tr td {
	padding: 2px;
}
.filetree {
	font-size: 12px;
}
.aui_content{
	width: 100%;
}
.files{
	list-style-type: none;
	margin: 0px;
	padding: 0px;
}
.files li{
	float: left;
	margin-left: 2px;
	border: 1px green solid;
}
.attachmentClassName {
	background: transparent url(${gzUrl('script/xheditor-1.1.14/demos/img/plugin.gif')})
		no-repeat 16px 16px;
	background-position: 2px 2px;
}
</style>
</head>
<body>
	<div id="pageloading"></div>
	<form id="editForm" action="${gzUrl('oagl/tzgg/save.do')}" method="post" >
		<div class="osx-container">
			<div class="osx-modal-header">
				<div class="osx-modal-icon"></div>
				<div class="osx-modal-title">您现在所在的位置：OA系统->通知公告->编辑</div>
			</div>
			<div class="osx-modal-content" id="osx-modal-content">
				<div class="from_div" id="form">
					<table cellpadding="0" cellspacing="0">
						<tr>
							<td style="width: 80px;text-align: right;border: 1px solid #3CF;border-top: 1px solid #3CF;border-left: 1px solid #3CF;">标题：</td>
							<td colspan="5" style="border: 1px solid #3CF;border-top: 1px solid #3CF;border-left:0px;"><input id="notice" name="notice" class="text ui-widget-content ui-corner-all" maxlength="100" style="height: 20px;width: 500px" /></td>
						</tr>
						<tr>
							<td style="width: 80px;text-align: right;border: 1px solid #3CF;border-left: 1px solid #3CF;border-top:0px;">发布人：</td>
							<td style="width: 80px;text-align: left;border: 1px solid #3CF;border-top: 0px;border-left: 0px;">${currentUser.staffName}</td>
							<td style="width: 100px;text-align: right;border: 1px solid #3CF;border-top: 0px;border-left: 0px;">接收对象：</td>
							<td style="width: 100px;text-align: left;border: 1px solid #3CF;border-top: 0px;border-left: 0px;">
								<span style="color: silver;" id="accept_Y" value="true">所有</span>&nbsp;&nbsp;<a id="edit_a" href="###">修改</a>
								<input type="hidden" name="isSendAll" value="1" /><!-- 所有 -->
							</td>
							<td style="width: 80px;text-align: right;border: 1px solid #3CF;border-top: 0px;border-left: 0px;">关键字：</td>
							<td style="border: 1px solid #3CF;border-top: 0px;border-left: 0px;"><input id="keyword" name="keyword" class="text ui-widget-content ui-corner-all" maxlength="50" style="height: 20px;width: 180px" /></td>
						</tr>
						<tr>
							<td colspan="6" style="height: 200px;border: 1px solid #3CF;border-top: 0px;border-left: 1px solid #3CF;">
								<div style="width: 1000px;">
									<textarea id="content" name="content"></textarea>
								</div>
							</td>
						</tr>
						<tr id="filetr" style="display:none" >
							<td style="border: 1px solid #3CF;border-top: 0px;width: 80px;text-align: right;height:20px;border-left: 1px solid #3CF;">附件：</td>
							<td style="border: 1px solid #3CF;border-top: 0px;border-left: 0px;" colspan="5" id="uploadFile"><ul class="files"></ul></td>
						</tr>
						<tr>
							<td colspan="6" style="border: 1px solid #3CF;border-top: 0px;border-left: 1px solid #3CF;">
								<input name="saveType" value="1" type="hidden" />
								<input class="xbtn" type="button" value="暂存" hvalue="2" name="暂存" id="saveType_1" />
								<input class="xbtn" type="button" value="预览" hvalue="4" name="预览" id="saveType_2" />
								<input class="xbtn" type="button" value="发布" hvalue="5" name="发布" id="saveType_3" />
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<select id="department_id" name="department_id" style="display: none;">
			<option value="0">请选择</option><#if departmentList?exists> <#list departmentList as department>
			<option value="${department.id}">${department.name}</option> </#list> </#if>
		</select>
		<div id="treeview" class="filetree" style="display: none;float: left;overflow: overlay;height:300px;width:100%">
			<#if departmentList?exists>
				<ul>
					<li><input id="chhAll" type="checkbox" style="float: left;" /><span>所有</span>
						<ul>
							<#list departmentList as department>
								<li><input type="checkbox" /><span>${department.name}</span>
									<ul>
										<#list department.userList as user>
											<#if user.name !='' >
												<li><input type="checkbox" value="${user.id}:${user.name}:${user.username}" n="${user.name}" name="userCheckBox" /><span>${user.username}</span></li>
											</#if>
										</#list>
									</ul>
								</li>
							</#list>
						</ul>
					</li>
				</ul>
			</#if>
		</div>
	</form>
	<br/><br/>
	<script type="text/javascript">
		var displayBlockFileTr = function(){
			if($(".files li").length==0){
				$("#filetr").hide();
			}
		} 
		$("#edit_a").click(function() {
			art.dialog({
				id : "dialog",
				content : document.getElementById("treeview"),
				padding : 0,
				width : 400,
				title:'选择接收人',
				lock : true,
				button:[
					{
						name:'所有',
						callback:function(){
							$("#accept_Y").attr("value", "true").text("所有");
							$(".aui_content input[name=userCheckBox]").attr("checked","checked");
							$("input[name=isSendAll]").val("1");
							return true;
						}
					}
				],
				ok : function() {
					if ($("input[name=userCheckBox]:checked").length > 0) {
						$("#accept_Y").attr("value", "false").text("已选择");
						$("input[name=isSendAll]").val("0");
					} else {
						$("#accept_Y").attr("value", "true").text("所有");
						$("input[name=isSendAll]").val("1");
					}
				},
				cancel : true
			});
		});
		$("#treeview").treeview({
			collapsed : true
		});
		$("#treeview li input:checkbox").change(function() {
			var checked = this.checked;
			$("ul input:checkbox", $(this).parent()).each(function() {
				this.checked = checked;
			});
		});
		$("#chhAll").click();
		$("#accept_Y").attr("value", "false").text("所有");
		$(function() {
			$(".xbtn").button();
			$("input[id^=saveType_]").click(function() {
				$("input[name=saveType]").val($(this).attr("hvalue"));
				if ("true" == $("#accept_Y").attr("value")) {//如果接受者是所有人，则必须将所有人默认选中
					$("#chhAll").click();//触发全选功能
				}
				if($.trim($("#notice").val()).length==0){
					alert("标题不能为空");
					return;
				}
				if($.trim($("#notice").val()).length>100){
					alert("标题内容不能超过100个字符");
					return;
				}
				if($.trim($("#content").val()).length==0){
					alert("正文内容不能为空！");
					return;
				}
				
				$("#editForm").submit();
			});
			$("#pageloading").hide();
		});
	</script>
	
	<script type="text/javascript">
		$(function() {
			var tools = new Array();
			tools.push("Cut,Copy,Paste,Pastetext,");
			tools.push(",Blocktag,Fontface,FontSize,Bold,Italic,Underline,Strikethrough,FontColor,BackColor,Removeformat,");
			tools.push(",Align,List,Outdent,Indent,");
			tools.push(",Link,Unlink,Anchor,Img,attachment,Hr,Emot,Table,");
			tools.push(",Preview,Print,Fullscreen");
			$('#content').xheditor({
				tools : tools.join("|"),
				skin:'nostyle',
				width : '1000px',
				height : '375px',
				upBtnText : '上传',
				upMultiple : 1,
				upImgUrl : '${gzUrl('oagl/upload/imgUpload.do')}',
				plugins : {
					attachment : {
						t : '附件',
						c : 'attachmentClassName',
						e : function() {
							var _this = this;
							_this.saveBookmark();
							_this.showModal('上传附件', '<div style="padding:5px;">附件：<input type="file" id="attachmentFileInput" name="filedata" class="xheFile" /></div>', 300, 80);
							$("#attachmentFileInput").change(function() {//关闭弹出层
								_this.removeModal();
								arrMsg = [];
								_this.startUpload(this, "${gzUrl('oagl/upload/fileUpload.do')}", "", function(msg) {
									var tmp = msg[0].split("||");
									var src = tmp[0];
									var name = decodeURI(tmp[1]);
									var ext = tmp[2];
									$("#filetr").show();
									var files = $(".files");
									var fileInput = "<input name=\"fileNames\" value=\""+ name + ":" + src +"\" type=\"hidden\" />";
									files.append("<li><img onerror='imgError(this)' src='${gzUrl('images/iocn-file/"+ext+".png')}' style='width:19px;height:19px'/><a href=\""+src+"\" target=\"_blank\" >"+ name +"</a>&nbsp;<a href=\"###\" onclick=\"{$(this).parent().remove();displayBlockFileTr()}\">x</a>"+ fileInput +"</li>");
								});
							});
						}
					}
				}
			});
		});
		var imgError = function(s){
			s.src="${gzUrl('images/iocn-file/def.png')}";
		}
	</script>
</body>
<#include "../../foot.ftl" />