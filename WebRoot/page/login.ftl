<#include "base_lib.ftl" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${SYSTEM_NAME?if_exists}</title>
<link href="${gzUrl('css/topcss.css')}" type="text/css"  rel="stylesheet"/>
<link href="${gzUrl('css/login.css')}" type="text/css"  rel="stylesheet"/>
<link href="${gzUrl('css/table.css')}" type="text/css"  rel="stylesheet"/>
<script type="text/javascript" src="${gzUrl('script/jquery-1.9.1.js')}"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#text01").focus();
	});
</script>
</head>

<body>
<div id="top">
  <div id="centerlogo">
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${SYSTEM_NAME?if_exists}</p>  	
  </div>
</div>
<div id="loginbox" <#if msg?exists>style="height:280px;"<#else>style="height:230px;"</#if>>
    <div class="box-header">
      <span class="titlelogin" style="float: none;">
      	帐号登录
      </span>
    </div>
    <div class="box-center">
     <form action="${gzUrl('login.do')}" method="post">
      <table width="240" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td colspan="2" align="center" valign="middle"><span class="tiprad">${msg?if_exists}</span></td>
        </tr>
        <tr>
          <td width="70" align="right">帐号名称</td>
          <td width="160" align="left"><input type="text" id="text01" name="name"  class="input_01" /></td>
        </tr>
        <tr>
          <td align="right">帐号密码</td>
          <td align="left"><input type="password" id="text01" name="pwd"  class="input_01" /></td>
        </tr>
        <tr>
          <td align="right">&nbsp;</td>
          <td><input id="butn1" class="btn_03" type="submit"  value="登　录" name="butn1"></td>
        </tr>
        <#--
        <tr>
          <td align="center" colspan="2"><a href="${gzUrl('Mozilla_Firefox_28.0.exe')}">建议使用火狐浏览器，点此下载！</a></td>
        </tr>
        -->
      </table>
      </form>
    </div>
  </div>
	<div id="bottom" style="position:absolute; bottom:0px;_position:absolute; _bottom:0px;_position:absolute; _bottom:0px;">版权所有：&copy; ${SYSTEM_NAME?if_exists}</div>
</body>
</html>
