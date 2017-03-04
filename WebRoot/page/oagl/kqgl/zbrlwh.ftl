<#include "../../head.ftl" />
<link href="${gzUrl('script/artDialog4.1.7/skins/blue.css')}" type="text/css" rel="stylesheet" />
<script src="${gzUrl('script/artDialog4.1.7/jquery.artDialog.js')}" charset="utf-8"></script>
<script src="${gzUrl('script/My97DatePicker/WdatePicker.js')}" ></script>
</head>
<style>
*{
	font-size:14px;
}
body{
	overflow: overlay;
		overflow:scroll;
}
.topDiv{
	border-bottom: 1px solid #AAA;
}

.wekTable {
	width: 150px;
	border-left: 1px solid #5C9CCC;
	border-top: 1px solid #5C9CCC;
	border-left: 1px solid #5C9CCC;
}

.wekTable tr {
	height: 25px;
}

.wekTable .wekValue {
	width: 30px;
	vertical-align: middle;
	text-align: center;
}

.wekTable .wektitle {
	text-align: center;
	background-color: #E0E0E0;
}

.wekTable tr td {
	border: 1px solid #5C9CCC;
	border-left: 0;
	border-top: 0;
}

.wekTable.sxr {
	background-color: #F0F0F0;
}

.wekTable .wekCont {
	cursor: pointer;
	width: 44px;
}
.wekCont{
	text-align: center;
}

.wekValue{
	cursor: pointer;
}
.wekCont.status1{
	background-color: #8C5F99;
}
.wekCont.status2{
	background-color: #9B77DC;
}
.wekCont.status3{
	background-color: #98AD73;
}
.wekCont.status4{
	background-color: #E0D2A2;
}
.wekCont.status5{
	background-color: #F9AF95;
}
.wekValue:HOVER{
	background-color: #FFF4C1;
}
.wekTable .wekCont:HOVER {
	background-color: #6FB7B7;
}
</style>
<body>
	<div id="pageloading"></div>
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：OA系统->值班管理->值班日历<#if preview?if_exists=="true">预览</#if><#if preview?if_exists!="true">维护</#if></div></div>
		</div>
		<div class='title' style="font-size:20px;width:100%;text-align:center;color:#3399FF;font-family: '微软雅黑 Bold', '微软雅黑';">值班日历<#if preview?if_exists=="true">预览</#if><#if preview?if_exists!="true">维护</#if></div>
	<div class="topDiv">
		<table class="topTable">
			<tr>
				<td>
					<select id="selectDay" style="width:70px;height:25px;">年</select>
				</td>
				<td>
					<select id="selectMoh" style="width:45px;height:25px;">月</select>
				</td>
			</tr>
		</table>
	</div>
	<div>
	<!-- 日历显示区域 -->
	<table cellpadding="0" cellspacing="1">
		<tr>
			<td>
				<table class="wekTable" cellpadding="0" cellspacing="0">
					<tr>
						<td colspan="3" class="wektitle ui-widget-header"><b style="font-size: 18px">星期一</b></td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="1">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="8">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="15">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="22">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="29">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="36">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
				</table>
			</td>
			<td>
				<table class="wekTable" cellpadding="0" cellspacing="0">
					<tr>
						<td colspan="3" class="wektitle ui-widget-header"><b style="font-size: 18px">星期二</b></td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="2">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="9">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="16">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="23">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="30">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="37">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
				</table>
			</td>
			<td>
				<table class="wekTable" cellpadding="0" cellspacing="0">
					<tr>
						<td colspan="3" class="wektitle ui-widget-header"><b style="font-size: 18px">星期三</b></td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="3">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="10">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="17">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="24">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="31">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="38">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
				</table>
			</td>
			<td>
				<table class="wekTable" cellpadding="0" cellspacing="0">
					<tr>
						<td colspan="3" class="wektitle ui-widget-header"><b style="font-size: 18px">星期四</b></td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="4">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="11">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="18">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="25">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="32">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="40">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
				</table>
			</td>
			<td>
				<table class="wekTable" cellpadding="0" cellspacing="0">
					<tr>
						<td colspan="3" class="wektitle ui-widget-header"><b style="font-size: 18px">星期五</b></td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="5">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="12">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="19">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="26">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="33">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="40">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
				</table>
			</td>
			<td>
				<table class="wekTable sxr" cellpadding="0" cellspacing="0">
					<tr>
						<td colspan="3" class="wektitle ui-widget-header"><b style="font-size: 18px">星期六</b></td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="6">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="13">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="20">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="27">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="34">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="41">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
				</table>
			</td>
			<td>
				<table class="wekTable sxr" cellpadding="0" cellspacing="0">
					<tr>
						<td colspan="3" class="wektitle ui-widget-header"><b style="font-size: 18px">星期日</b></td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="7">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="14">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="21">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="28">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="35">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="3" class="wekValue" ddv="42">&nbsp;</td>
						<td class="wekCont" colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont">&nbsp;</td>
						<td class="wekCont">&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</div>
	<div id="div_tpl" style="display:none">
		<table>
			<tr>
				<td style="text-align:right">部门：</td>
				<td style="text-align:left">
					<select id="deptList" style="width:100px;height:25px;">
						<option value="-1">请选择</option>
						<#if deptList?exists>
							<#list deptList as department>
								<option value="${department.id}">${department.name}</option>
							</#list>
						</#if>
					</select>
				</td>
				<td style="text-align:right">名称：</td>
				<td style="text-align:left">
					<select id="userList" style="width:70px;height:25px;">
						<option value="-1">请选择</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="text-align:right">日期：</td>
				<td style="text-align:left">
					<input type="text" id="riqi" style="width:105px;height:25px;" class="Wdate text ui-widget-content ui-corner-all" onfocus="WdatePicker({minDate:'${prevMoh}'})"/>
				</td>
				<td colspan='2'>
					<button name="prevDay" value="-1" class="jsriqi" >前一天</button>
					<button name="today" value="${toDay}" class="jsriqi" >今天</button>
					<button name="nextDay" value="1" class="jsriqi" >后一天</button>
				</td>
			</tr>
			<tr>
				<td style="text-align:right">状态：</td>
				<td style="text-align:left"><input value="值班" style="width:105px;" disabled=disabled /></td>
				<td style="text-align:right">结算：</td>
				<td>
					<select id='jiesuanOptions' style="height:25px" >
						<!-- <option value='1' >待确认</option> -->
						<option value='2' >调休</option>
						<option value='3' >值班费</option>
					</select>
				</td>
			</tr>
			<tr>
				<td style="text-align:right">备注：</td>
				<td style="text-align:left" colspan="3" ><textarea id='remarks' rows='4' cols='50'></textarea></td>
			</tr>
		</table>
	</div>
	</div>
	<div id="optionUsers" style="display:none">
		<select>
		<#if deptList?exists>
			<#list deptList as department>
				<#if department.userList?exists>
					<#list department.userList as user>
						<option value="${user.id}" n="${user.name }" d="${department.id}" staffid="${user.staff_id}" t="ud" >${user.username}</option>
					</#list>
				</#if>
			</#list>
		</#if>
		</select>
	</div>
</body>
<script type="text/javascript">
	var preview = "${preview?if_exists}" 
	var method = "${method?if_exists}"; 
	var curYear = new Date().getYear() + 1900;
	if(curYear>3000){
		curYear = new Date().getYear();
	}
	var curMoh = new Date().getMonth() + 1;
	var curDay = new Date().getDate();
	var curD = curYear+ "-"+ (curMoh<10?"0":"") + curMoh + "-" + (curDay<10?"0":"") + curDay;
	$(function(){
		var selectDay = $("#selectDay");
		for(var initYear = 2014;initYear<=2020;initYear++){
			if(initYear==curYear){
				selectDay.append("<option selected>"+initYear+"</option>");
			}else{
				selectDay.append("<option >"+initYear+"</option>");
			}
		}
		var selectMoh = $("#selectMoh");
		
		for(var initMoh = 1;initMoh<=12;initMoh++){
			if(initMoh==curMoh){
				selectMoh.append("<option selected>"+initMoh+"</option>");
			}else{
				selectMoh.append("<option >"+initMoh+"</option>");
			}
		}
		
		var emap = {
			"星期一" : 1,
			"星期二" : 2,
			"星期三" : 3,
			"星期四" : 4,
			"星期五" : 5,
			"星期六" : 6,
			"星期日" : 7,
			"Monday":1,
			"Tuesday":2,
			"Wednesday":3,
			"Thursday":4,
			"Friday":5,
			"Saturday":6,
			"Sunday":7
		}
		
		//初始化日历
		var loadRiliTable = function(y,m){
			//清除原有记录
			$(".wekTable td.wekValue,.wekTable td.wekCont").each(function(){
				var s = $(this);
				if(s.hasClass("wekValue")){
					s.removeAttr("vvd").html("");
				}else{
					s.html("");
					for(var i=1;i<7;i++)s.removeClass("status"+i);
				}
			});
			
			$.getJSON("${gzUrl('oagl/glgn/getEAndLastDay.do')}",{"year":y,"moh":m},function(json){
				var E = json.E;
				var lastDay = json.lastDay;
				for (var i = 1, j = emap[E]; i <= lastDay; i++) {
					var vvd = y + "-" + (m<10?"0":"") + m + "-" + (i<10?"0":"")+ i;
					var td = $("td[ddv=" + (j++) + "]").html("<b style='font-size:16px'>" + (i < 10 ? "0" : "") + i + "</b>").attr("vvd",vvd);                   
					if(vvd==curD){
						td.css("background-color","#FFF4C1");
					}else{
						td.css("background-color","");
					}
				}
				$.post("${gzUrl('oagl/glgn/findZbrl.do')}",{"year":y,"moh":m},function(j){
					for(var i in j){
						var o = j[i];
						var td1 = $(".wekValue[vvd="+o.on_duty_time+"]");
						var td2 = td1.next("td");
						var td3 = td1.parent("tr").next().find("td:eq(0)");
						var td4 = td1.parent("tr").next().find("td:eq(1)");
						var td5 = td1.parent("tr").next().next().find("td:eq(0)");
						var td6 = td1.parent("tr").next().next().find("td:eq(1)");
						var m = {"1":[td2],"2":[td5,td6],"3":[td3,td4]};
						if(o.on_duty_type == "1"){
							m["1"][0].addClass("status1").html("<span v='"+o.id+"' title='"+o.department_name+"' >"+o.staff_name+"</span>");
						}else{
							var t = m[o.on_duty_type][0].text();
							if($.trim(t).length==0){
								m[o.on_duty_type][0].addClass("status" + o.on_duty_type).html("<span v='"+o.id+"' title='"+o.department_name+"'>"+o.staff_name+"</span>");
							}else{
								m[o.on_duty_type][1].addClass("status" + o.on_duty_type).html("<span v='"+o.id+"' title='"+o.department_name+"'>"+o.staff_name+"</span>");
							}
						}
					}
				},"json");
			});
		};
		
		$("#selectDay,#selectMoh").change(function(){
			var y=selectDay.val();
			var m=selectMoh.val();
			loadRiliTable(y,m);
		});
		
		loadRiliTable(selectDay.val(),selectMoh.val());
		
		$(".wekCont").click(function(){
			var s = $(this);
			var id = s.find("span").attr("v");
			var tr = s.parent("tr");
			var td = tr.find("td.wekValue");
			if(td.length==0){
				td = tr.prev("tr").find("td.wekValue");
				if(td.length==0){
					td = tr.prev("tr").prev("tr").find("td.wekValue");
				}
			}
			var vvd = td.attr("vvd");
			if(vvd){
				var td2 = td.next("td");
				var td3 = td.parent("tr").next().find("td:eq(0)");
				var td4 = td.parent("tr").next().find("td:eq(1)");
				var td5 = td.parent("tr").next().next().find("td:eq(0)");
				var td6 = td.parent("tr").next().next().find("td:eq(1)");
				var m = {"1":[td2],"2":[td5,td6],"3":[td3,td4]};
				var m_= [td2,td5,td6,td3,td4,];
				var curDuty = 0;
				for(var i in m_){
					if(s.is(m_[i])){
						if(i<1){
							curDuty=1;break;
						}else if(i<3){
							curDuty=2;break;
						}else{
							curDuty=3;break;
						}
					}
				}
				var html = "<div id='D01'>" + $("#div_tpl").html() + "</div>";
				art.dialog({
					id : "dialog",
					content : html,
					title:"值班日历维护",
					padding : "10px",
					lock : true,
					init:function(){
						var options = $("#optionUsers option");
						var userList = $("#userList","#D01");
						$("#deptList","#D01").change(function(){
						var value = $(this).val();
						userList.find("option[t=ud]").remove();
						if(value != -1){
							options.each(function(){
								if($(this).attr("d")==value){
									userList.append($(this).clone());
								}
							});
						}else{
							options.each(function(){
								userList.append($(this).clone());
							});
						}
					});
					
					if(curDuty!="3"){//总值班可以选择结算方式
						$("#jiesuanOptions","#D01").attr("disabled","disabled");
					}
					
					$(".jsriqi","#D01").button().click(function(){
						var s = $(this);
						if(this.name!="today"){
							var day = $("#riqi","#D01").val();
							var val = this.value;
							if(day!=""&&day<="${prevMoh}"){
								alert("可以选择的日期不能小于：${prevMoh}");
								return false;
							}
							$.post("${gzUrl('oagl/glgn/jisuanRiqi.do')}",{day:day,value:val},function(j){
								$("#riqi","#D01").val(j);
							});
						}else{
							$("#riqi","#D01").val(this.value);
						}
					});
					$(".aui_state_highlight").show();
					if(id!=null){
						$.post("${gzUrl('oagl/glgn/getZbrl.do')}",{id:id},function(j){
							$("#riqi","#D01").val(j.on_duty_time).attr("disabled","disabled");
							$(".jsriqi","#D01").attr("disabled","disabled");
							$("#deptList","#D01").val(j.department_id).change();
							$("#userList","#D01").val($("#userList option[staffid="+j.staff_info_id+"]","#D01").attr("value"));
							$("#remarks","#D01").val(j.remarks);
							$("#jiesuanOptions","#D01").val(j.dalance_status);
						},"json");
					 }else{
					 	$("#riqi","#D01").val(vvd);
					 	if((vvd!=""&&vvd<"${prevMoh}")||method=="search"){
					 		$("#riqi","#D01").attr("disabled","disabled");
					 		$(".jsriqi","#D01").attr("disabled","disabled");
					 		$("#remarks","#D01").attr("disabled","disabled");
					 		$("#deptList","#D01").attr("disabled","disabled");
					 		$("#userList","#D01").attr("disabled","disabled");
					 		$("#jiesuanOptions","#D01").attr("disabled","disabled");
					 		$(".aui_state_highlight").hide();
					 	}
					 }
					 
					 if(method=="search"){
				 		$("#riqi","#D01").attr("disabled","disabled");
				 		$(".jsriqi","#D01").attr("disabled","disabled");
				 		$("#remarks","#D01").attr("disabled","disabled");
				 		$("#deptList","#D01").attr("disabled","disabled");
				 		$("#userList","#D01").attr("disabled","disabled");
				 		$("#jiesuanOptions","#D01").attr("disabled","disabled");
				 		$(".aui_state_highlight").hide();
					 }
					},
					ok : function() {
							var riqi = $("#riqi","#D01").val();
							var deptid = $("#deptList","#D01").val();
							var userid = $("#userList","#D01").val();
							var staffid = $("#userList option[value="+userid+"]","#D01").attr("staffid");
							var remarks = $("#remarks","#D01").val();
							var jiesuanOptions = $("#jiesuanOptions","#D01").val();
							var map = {riqi:riqi,department_id:deptid,userid:userid,staff_id:staffid,remarks:remarks,jiesuanOptions:jiesuanOptions,id:id,dutyType:curDuty};
							if(deptid=="-1"){
								alert("部门不能为空");
								return false;
							}
							if(userid=="-1"){
								alert("名称不能为空");
								return false;
							}
							if(remarks.length>200){
								alert("备注长度不能超过200个字符");
								return false;
							}
							$.post("${gzUrl('oagl/glgn/saveZb.do')}",map,function(j){
								if(j=="true"){
									$("#selectMoh").change();
									var list = art.dialog.list;
									for(var l in list){
										list[l].close();
									}
								}else if(j=="error1"){
									alert("设置的人员在这天已经存在！");
								}
							},"text");
						return false;
					},
					cancel : true
				});
			}
		});
		$("#pageloading").hide();
		
	});
</script>
<#include "../../foot.ftl" />