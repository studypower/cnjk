<#include "../../head.ftl" />
<link href="${gzUrl('script/ueditor1_4_3-utf8-jsp/themes/default/css/ueditor.css')}" type="text/css" rel="stylesheet" />
<link href="${gzUrl('script/artDialog4.1.7/skins/blue.css')}" type="text/css" rel="stylesheet" />
<link href="${gzUrl('script/jquery-treeview/jquery.treeview.css')}" type="text/css" rel="stylesheet" />
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
	border: 1px solid silver;
	width: 98%;
	margin: 3px;
}

.from_div table tr td {
	border: 1px solid silver;
	padding: 2px;
	border-left:0px;
	border-top: 0px;
}

.filetree {
	font-size: 12px;
}

.aui_content {
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

.jsr{
	list-style-type: none;
	margin: 0px;
	padding: 0px;
}
.jsr li{
	float: left;
	margin-left: 2px;
	border: 1px green solid;
}
</style>
<script>
	var imgError = function(s){
		 s.src="${gzUrl('images/iocn-file/def.png')}";
	  }
</script>
</head>
<body>
	<div id="pageloading"></div>
	<input name="id" value="${notice.id }" type="hidden" />
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：OA系统->通知公告->查看通知公告</div>
		</div>
		<div class="osx-modal-content" id="osx-modal-content">
			<div class="from_div" id="form" >
				<center>
					<table cellpadding="0" cellspacing="0" style="width:1024px">
						<tr>
							<td colspan="10" style="height:45px;text-align: center;color:#3399ff;font-size: 25px;border-right:0px;font-weight: bold;">${notice.notice }</td>
						</tr>
						<tr style="height:30px;">
							<td style="width: 80px;text-align: right;"><b>发布人：</b></td>
							<td style="width: 120px;text-align: left;"><b>${notice.username}</b></td>
							<td style="width: 100px;text-align: right;"><b>接收对象：</b></td>
							<td style="width: 100px;text-align: left;"><b><#if notice.isSendAll==1 >所有</#if><#if notice.isSendAll==0 ><a href="###" id="chakansjr">查看</a></#if></b> </td>
							<td style="width: 80px;text-align: right;"><b>状态：</b></td>
							<td style="width: 80px;text-align: left;">
								<b><#if notice.status=="1" >已发布</#if>
								<#if notice.status=="2" >草稿</#if></b>
							</td>
							<td style="width: 80px;text-align: right;"><b>阅读次数：</b></td>
							<td style="width: 80px;text-align: left;"><b>${notice.read_count }</b></td>
							<td style="width: 80px;text-align: right;"><b>关键字：</b></td>
							<td style="border-right:0px"><b>${notice.keyword }</b></td>
						</tr>
						<tr>
							<td colspan="10" style="height: 380px;vertical-align:top;border-right:0px;">
								<div style="width: 1000px;word-wrap: break-word; word-break: normal;margin:5px">${notice.notice_content}</div>
							</td>
						</tr>
						<tr>
							<td style="width: 80px;text-align: right;border-bottom:0px;height:25px;"><b>发布时间：</b></td>
							<td style="width: 80px;text-align: left;border-bottom:0px;" <#if notice.files?size==0>colspan="9"</#if>>${notice.publish_date?string("yyyy-MM-dd HH:mm:ss")}</td>
							<#if notice.files?size!=0>
								<td style="width: 80px;text-align: right;border-bottom:0px;"><b>附件：</b></td>
								<td colspan="7" style="border-right:0px;border-bottom:0px;">
									<ul class="files">
										<#list notice.files as file>
											<li>
												<img onerror='imgError(this)' src='${gzUrl('images/iocn-file/')}${file.fileExt?if_exists}.png' style='width:19px;height:19px'/>
												<a href="${file.atachment_path}" style="font-size:16px;" target="_blank" >${file.atachment_name}</a>&nbsp;
											</li>
										</#list>
									</ul>
								</td>
							</#if>
						</tr>
					</table>
				</center>
			</div>
		</div>
	</div>
	<div id="treeview" class="filetree" style="display: none;float: left;overflow: overlay;height:300px;width:100%">
			<#if departmentList?exists>
			<ul id="treeL">
				<li><span>所有</span>
					<ul>
						<#list departmentList as department>
							<li><span type="deptspan" vdd="${department.id}">${department.name}</span>
								<#if department.userList?size!=0>
								<ul>
									<#list department.userList as user>
										<#if user.name !='' >
											<li>
												<span type="userspan" d="${department.id}" v="${user.id}" >${user.username}</span>
											</li>
										</#if>
									</#list>
								</ul>
								</#if>
							</li>
						</#list>
					</ul></li>
			    </ul>
			</#if>
		</div>
	<script type="text/javascript">
		var users = {};
		<#list notice.accepts as ept>
			users["${ept.accept_id}"]=true;
		</#list>
	
		$("#chakansjr").click(function() {
			art.dialog({
				id:"dialog",
				content:document.getElementById("treeview"),
				padding:0,
				width:400,
				lock:true,
				cancel:true
			});
		});
		$("#treeview li span[type=userspan]").each(function() {
			var userid = $(this).attr("v");
			if(!users[userid]){
				$(this).parent().remove();
			}
		});
		$("#treeview li span[type=deptspan]").each(function(){
			var li = $(this).parent();
			if($("ul li",li).length==0){
				li.remove();
			}
		});
		$("#treeview").treeview({
			collapsed : true
		});
		$("#pageloading").hide();
	</script>
</body>
<#include "../../foot.ftl" />
