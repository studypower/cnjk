执行时必须按照脚本的顺序来操作。

在tomcat配置文件server.xml中的<Host>节点内配置一下内容，并创建文件夹D:\uploadFile\images，D:\uploadFile\file

<Context path="/file/imgUpload" docBase="D:\uploadFile\images" reloadable="true" />
<Context path="/file/fileUpload" docBase="D:\uploadFile\file" reloadable="true" />