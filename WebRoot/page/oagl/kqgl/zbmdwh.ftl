<#include "../../head.ftl" />
<link href="${gzUrl('script/artDialog4.1.7/skins/blue.css')}" type="text/css" rel="stylesheet" />
<script src="${gzUrl('script/artDialog4.1.7/jquery.artDialog.js')}" charset="utf-8"></script>
<script src="${gzUrl('script/My97DatePicker/WdatePicker.js')}" ></script>
</head>
<style>
*{font-size:12px;}
</style>
<body>
	<div id="pageloading"></div>
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：OA系统->值班管理->值班名单维护</div>
		</div>
		<div class='title' style="font-size:20px;width:100%;text-align:center;color:#3399FF;font-family: '微软雅黑 Bold', '微软雅黑';">值班名单维护</div>
	<div>
		<center>
		<table>
		   <#if isDisplay('10_4_1')>
				<tr>
					<td>
						<form action="${gzUrl('oagl/glgn/zhmdUpload.do')}" onsubmit="{return valdataSubmit(this);}" method="post" enctype="multipart/form-data" >
							<input name="fileType" value="1" type="hidden" />
							&nbsp;&nbsp;值班领导名单：<input type="file" name="file" /><button type="submit">上传</button><button type="button" onclick="{window.open('${gzUrl('page/oagl/kqgl/tpl/1.leaderList.xls')}'); }">下载模板</button>
						</form>
					</td>
				</tr>
		   </#if>
		   <#if isDisplay('10_4_2')>
			<tr>
				<td>
					<form action="${gzUrl('oagl/glgn/zhmdUpload.do')}" onsubmit="{return valdataSubmit(this);}" method="post" enctype="multipart/form-data" >
					<input name="fileType" value="2" type="hidden" />
					听班小分队名单：<input type="file" name="file" /><button type="submit">上传</button><button type="button" onclick="{window.open('${gzUrl('page/oagl/kqgl/tpl/2.smallDetachmentList.xls')}'); }">下载模板</button>
					</form>
			    </td>
			</tr>
			</#if>
			<#if isDisplay('10_4_3')>
			<tr>
			  <td>
				<form action="${gzUrl('oagl/glgn/zhmdUpload.do')}" onsubmit="{return valdataSubmit(this);}" method="post" enctype="multipart/form-data" >
				<input name="fileType" value="3" type="hidden" />
				&nbsp;&nbsp;&nbsp;&nbsp;总值班名单：<input type="file" name="file" /><button type="submit">上传</button><button type="button" onclick="{window.open('${gzUrl('page/oagl/kqgl/tpl/3.zongDutyList.xls')}'); }">下载模板</button>
				</form>
			  </td>
			</tr>
			</#if>
		</table>
		</center>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		$("input").change(function(){
			var value = this.value;
			if(value!=""){
			var l = value.lastIndexOf(".");
				if(l!=-1){
					var endstr = value.substring(l + 1);
					if(endstr.toUpperCase() != "XLS"){
						alert("请选择XLS类型文件！");
						this.value = "";
					}
				}
		     }
		});
		$("button,input").button();
		$("#pageloading").hide();
	});
	
	function valdataSubmit(form){
		var value = $("input:file",form).val();
		if(value==""){
			alert("上传内容不能为空！");
			return false;
		}
		return true;
	}
	
</script>
<#include "../../foot.ftl" />