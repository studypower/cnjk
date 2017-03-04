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
			<div class="osx-modal-title">您现在所在的位置：OA系统->值班管理->值班日历预览</div>
		</div>
		<div class='title' style="font-size:20px;width:100%;text-align:center;color:#3399FF;font-family: '微软雅黑 Bold', '微软雅黑';">值班日历预览</div>
	<div class="topDiv">
	<table class="topTable">
		<tr>
			<td>
				<select id="selectDay" style="width:70px;height:25px;"></select>年
			</td> 
			<td>
				<select id="selectMoh" style="width:45px;height:25px;"></select>月
				,只能对未来已存在的预览值班人员进行修改。
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
	<div id="formTpl" style="display:none">
		<table cellpadding="0" cellspacing="0">
			<tr>
				<td style="width:65px;text-align: right;">部门:</td>
				<td style="text-align: left;">
					<select style="width:120px" id="deptSelect1">
						<#if departmentList?exists>
							<#list departmentList as dept>
								<option value="${dept.id}">${dept.name}</option>
							</#list>
						</#if>
					</select>
				</td>
				</tr>
				<tr>
				<td style="text-align: right;">值班人员:</td>
				<td style="text-align: left;">
					<select style="width:120px" id="userSelect1"></select>
				</td>
			</tr>
		</table>
	</div>
	<div style="display:none" id="optionUsersTpl">
		<select style="width:90px">
			<#if departmentList?exists>
				<#list departmentList as dept>
					<#if dept.userList?exists>
						<#list dept.userList as user>
							<option dept="${dept.id}" value="${user.staff_id}">${user.username}</option>
						</#list>
					</#if>
				</#list>
			</#if>
		</select>
	</div>
</body>
<script type="text/javascript">
	var method = "${method?if_exists}"; 
	var curYear = new Date().getYear() + 1900;
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
					for(var i=1;i<4;i++)s.removeClass("status"+i);
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
				
				$.post("${gzUrl('oagl/glgn/zbRiliPreviewData.do')}",{"year":y,"moh":m},function(j){
					for(var i in j){
						var o = j[i];
						var td1 = $(".wekValue[vvd="+o.on_duty_time+"]");
						var td2 = td1.next("td");
						var td3 = td1.parent("tr").next().find("td:eq(0)");
						var td4 = td1.parent("tr").next().find("td:eq(1)");
						var td5 = td1.parent("tr").next().next().find("td:eq(0)");
						var td6 = td1.parent("tr").next().next().find("td:eq(1)");
						var m = {"1":[td2],"2":[td3,td4],"3":[td5,td6]};
						m[o.onduty_type][0].addClass("status" + o.onduty_type).html("<span v='"+o.id+"' staffid='"+o.ondutystaffId1+"' field='1' onduty_type='"+o.onduty_type+"' on_duty_time='"+o.on_duty_time+"'>"+o.staff_name1+"</span>");
						if(o.ondutystaffId2!="-1"){
							m[o.onduty_type][1].addClass("status" + o.onduty_type).html("<span v='"+o.id+"' staffid='"+o.ondutystaffId2+"' field='2' onduty_type='"+o.onduty_type+"' on_duty_time='"+o.on_duty_time+"' >"+o.staff_name2+"</span>");
						}
					}
				},"json");
			});
		};
		$("#selectDay").change(function(){
			selectMoh.val("1");
			$("#selectMoh").change();
		});
		$("#selectMoh").change(function(){
			var y=selectDay.val();
			var m=selectMoh.val();
			loadRiliTable(y,m);
		});
		var mydialog;
		$(".wekCont").click(function(){
			var this_ = $(this);
			var this_span = this_.find("span");
			if(mydialog)mydialog.close();
			if(this_span&&this_span[0]){
				var on_duty_time=this_span.attr("on_duty_time");
				if(on_duty_time.split("-").join("")>"${today}".split("-").join("")){
					var htmlTpl = $("#formTpl").html();
					var staffid = this_span.attr("staffid");
					mydialog = art.dialog({
						id : "dialog",
						content : "<div id='dialog_content_html'>"+htmlTpl+"<div>",
						padding : "0px",
						width : 200,
						title:'维护',
						follow:this,
						init:function(){
							var deptSelect1 = $("#dialog_content_html #deptSelect1").change(function(){
								var deptId = this.value;
								var eleId = this.id;
								var optionUsers = $("#optionUsersTpl option[dept="+deptId+"]").clone();
								if(eleId=="deptSelect1"){
									$("#dialog_content_html #userSelect1").append(optionUsers);
								}
							});
							var deptid = $("#optionUsersTpl option[value="+staffid+"]").attr("dept");
							deptSelect1.val(deptid).change();
							$("#dialog_content_html #userSelect1").val(staffid);
						},
						ok : function(){
							var pid = this_span.attr("v");
							var onduty_type = this_span.attr("onduty_type");
							var field=this_span.attr("field");
							var staffIdNew = $("#dialog_content_html #userSelect1").val();
							$.post("${gzUrl('oagl/glgn/zbRiliPreviewUpd.do')}",{
								id:pid,
								onduty_type:onduty_type,
								field:field,
								staffId:staffIdNew
							},function(resp){
								if(resp=='true'){
									artDialog.tips('操作成功!');
									mydialog.close();
									$("#selectMoh").change();
								}else{
									artDialog.tips('操作失败!');
								}
							});
							return false;
						},
						okVal:'修改',
						cancel : true,
						cancelVal:'关闭'
					});
				}
			}
		});
		loadRiliTable(selectDay.val(),selectMoh.val());
		$("#pageloading").hide();
	});
</script>
<#include "../../foot.ftl" />