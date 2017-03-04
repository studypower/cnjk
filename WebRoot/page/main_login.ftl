<#include "base_lib.ftl" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>EMS企业信息管理平台</title>
<link href="${gzUrl('css/topcss.css')}" type="text/css"  rel="stylesheet"/>
<link href="${gzUrl('css/login.css')}" type="text/css"  rel="stylesheet"/>
<link href="${gzUrl('css/table.css')}" type="text/css"  rel="stylesheet"/>

</head>

<body>
<script>
	alert("登陆失效，请重新登陆!");
	parent.location.href = "${gzUrl('initLogin.do')}";
</script>
</body>
</html>
