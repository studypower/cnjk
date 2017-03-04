<#macro pagerShow reqUrl pager={}>
	<br/>
	<#if pager.retTotal gt 0>
		<script type="text/javascript">
			function goto(pageIndex){
			    if(pageIndex<=0){
			       pageIndex=1;
			    }
			    if(pageIndex>${pager.pageTotal}){
			       pageIndex=${pager.pageTotal};
			    }
				document.location.href = "${reqUrl}&pageIndex=" + pageIndex;
			}
		</script>
		<div class="page">
			共${pager.retTotal}条
			<input type="button" id="btn1" name="btn1" class="pagbtn" value="第一页" onClick="goto(1)"/>
			<input type="button" id="btn1" name="btn1" class="pagbtn" value="上一页" onClick="goto(${pager.pageIndex-1})"/>
			 跳至  <input type="text" id="text01" name="text01" class="input_page" /> 
			<input type="button" id="btn1" name="btn1" class="pagbtn" value="下一页" onClick="goto(${pager.pageIndex+1})"/>
			<input type="button" id="btn1" name="btn1" class="pagbtn" value="最后一页" onClick="goto(${pager.pageTotal})"/>
		</div>
	</#if>
</#macro>

<#function gzUrl url>
  <#if (gnizrConfiguration.webApplicationUrl)?exists>
    <#return (gnizrConfiguration.webApplicationUrl + url)/>
  <#else>
    <#return "http://" + request.serverName + ":" + request.serverPort?string("0.######") + request.contextPath + "/" + url/>
  </#if>
</#function>

<#function isDisplay key>
	<#if Session.currentUser?exists>
		<#if Session.currentUser.grade==1>
			<#return true />
		</#if>
		<#if Session.currentUser.keyList?exists>
			<#list Session.currentUser.keyList as _key>
				<#if _key?string==key>
					<#return true />
				</#if>
			</#list>
		</#if>
	</#if>
	<#return false />
</#function>

<#macro fileType fileUrl>
	<#if fileUrl?ends_with('.doc') || fileUrl?ends_with('.docx')>
		Word文档
	<#elseif fileUrl?ends_with('.xls') || fileUrl?ends_with('.xlsx')>
		Excel文档
	<#elseif fileUrl?ends_with('.jpg') || fileUrl?ends_with('.jpeg') ||  fileUrl?ends_with('.png') || fileUrl?ends_with('.gif')>
		图片
	</#if>
</#macro>

<#function isOfficeFile fileUrl>
	<#if fileUrl?ends_with('.doc') || fileUrl?ends_with('.docx') || fileUrl?ends_with('.xls') || fileUrl?ends_with('.xlsx')>
		<#return true />
	<#else>
		<#return false />
	</#if>
</#function>
