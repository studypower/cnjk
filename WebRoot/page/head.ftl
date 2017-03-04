<#include "base_lib.ftl" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>${SYSTEM_NAME?if_exists}</title>
	<script>var ctx="${base}";</script>
	<link href="${gzUrl('css/css.css')}" rel="stylesheet" type="text/css" />
	<link href="${gzUrl('script/jqgrid/css/ui.jqgrid.css')}" rel="stylesheet" type="text/css" />
	<link href="${gzUrl('script/jqgrid/plugins/ui.multiselect.css')}" rel="stylesheet" type="text/css" />
	<link href="${gzUrl('script/themes/redmond/jquery-ui.css')}" rel="stylesheet" type="text/css" />
	<link href="${gzUrl('css/combobox.css')}" rel="stylesheet" type="text/css" />
	<link href="${gzUrl('css/upload.css')}" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="${gzUrl('css/zTreeStyle/zTreeStyle.css')}" />
	<script type="text/javascript" src="${gzUrl('script/jquery-1.7.js')}" ></script>
	<script type="text/javascript" src="${gzUrl('script/jquery-ui.js')}" ></script>
	<script type="text/javascript" src="${gzUrl('script/jqgrid/plugins/ui.multiselect.js')}" ></script>
	<script type="text/javascript" src="${gzUrl('script/jqgrid/js/jquery.jqGrid.src.js')}" ></script>
	<script type="text/javascript" src="${gzUrl('script/jqgrid/js/i18n/grid.locale-cn.js')}" ></script>
	<script type="text/javascript" src="${gzUrl('script/jqgrid/plugins/jquery.contextmenu.js')}" ></script>
	<script type="text/javascript" src="${gzUrl('script/jqgrid/plugins/jquery.tablednd.js')}" ></script>
	<script type="text/javascript" src="${gzUrl('script/jquery.ui.datepicker-zh-CN.js')}" ></script>
	<script type="text/javascript" src="${gzUrl('script/timepicker.js')}"></script>
	<script type="text/javascript" src="${gzUrl('script/combobox.js')}"></script>
	<script type="text/javascript" src="${gzUrl('script/jQuery.fileinput.js')}" ></script>
	<script type="text/javascript" src="${gzUrl('script/zTree/jquery.ztree.core-3.5.js')}"></script>
	<script type="text/javascript" src="${gzUrl('script/zTree/jquery.ztree.excheck-3.5.js')}"></script>
	<script type="text/javascript" src="${gzUrl('script/common.js')}" ></script>
	<style type="text/css">
		.osx-container
		{
			margin-left:10px;
		}
		.osx-container .osx-modal-header {
			background-color: #;
			border-bottom: 1px solid #CCCCCC;
		}
		.osx-container .osx-modal-title{
			color: #000000;
			font-weight: bold;
			padding: 3.5px 8px;
			text-shadow: 0 1px 0 #F4F4F4;
			font-size:14px;
			font-family: "微软雅黑";
		}
		.osx-container .osx-modal-close {
			display: none;
			position: absolute;
			right: 0;
			top: 0;
		}
		.osx-container .osx-modal-close span {
			color: #777777;
			display: block;
			font-weight: bold;
			padding: 3.5px 12px 0;
			text-decoration: none;
			text-shadow: 0 1px 0 #F4F4F4;
			font-size: 14px;
			font-family: "微软雅黑";
		}
		.osx-container .osx-modal-icon {
			background: url("${gzUrl('script/icon/application_view_list.png')}") no-repeat scroll center center transparent;
			float: left;
			height: 20px;
			overflow: hidden;
			position: relative;
			margin:0 3px 0 10px;
			right: 3px;
			top: 3px;
			width: 20px;
		}
		.ui-datepicker-div, .ui-datepicker-inline, #ui-datepicker-div {
			font-size: 70%;
			font-family: 'yakov_wryh';
		}
		.ui-dialog .ui-dialog-title{
			font-size: 14px;
			font-family: 'yakov_wryh';
			line-height: 1.2;
			float: left;
			margin: 0.1em 16px 0.1em 0;
		}
		.ui-button .ui-button-text {
			font-size: 14px;
			font-family: 'yakov_wryh';
			display: block;
			line-height: 1.2;
		}
		.custom-combobox > INPUT {
			width: 105px;
		}
		.custom-combobox50 > INPUT {
			width: 50px;
		}
		.custom-combobox100 > INPUT {
			width: 100px;
		}
		a {
			text-decoration:none; 
		} 
	</style>
</head>