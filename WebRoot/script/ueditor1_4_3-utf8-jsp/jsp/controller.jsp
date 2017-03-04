<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.baidu.ueditor.ActionEnter" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setHeader("Content-Type", "text/html");
	String rootPath = application.getRealPath("/");
	String jsonObj = new ActionEnter(request, rootPath).exec();
	jsonObj = jsonObj.replaceAll("\"/ueditor", "\"" + request.getContextPath() + "/ueditor");
	out.write(jsonObj);
%>