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
	width: 160px;
	border-left: 1px solid #5C9CCC;
	border-top: 1px solid #5C9CCC;
	border-left: 1px solid #5C9CCC;
}

.wekTable tr {
	height: 28px;
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
	background-color: #FFFFFF;
}
.wekCont.status2{
	background-color: #FFFF33;
}
.wekCont.status3{
	background-color: #FF6600;
}
.wekCont.status4{
	background-color: #FF0000;
}
.wekCont.status5{
	background-color: #66FF00;
}
.wekValue:HOVER{
	background-color: #FFF4C1;
}
.wekTable .wekCont:HOVER {
	background-color: #6FB7B7;
}
.weekEnds{
	background-color: #AAA;
}
</style>
<body>
	<div id="pageloading"></div>
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：OA系统->考勤管理->
				<#if myStatus = "true">我的状态</#if>
				<#if myStatus = "false">状态维护</#if>
				<#if myStatus = "search">状态日历查询</#if>
			</div>
		</div>
	<div class="topDiv">
		<div class='title' style="font-size:20px;width:100%;text-align:center;color:#3399FF;font-family: '微软雅黑 Bold', '微软雅黑';">
			<#if myStatus = "true">我的状态</#if>
			<#if myStatus = "false">状态维护</#if>
			<#if myStatus = "search">状态日历查询</#if>
		</div>
		<table class="topTable">
			<tr>
				<td>
					<select id="selectDay" style="width:70px;height: 25px;">年</select>
				</td>
				<td>
					<select id="selectMoh" style="width:45px;height: 25px;">月</select>
				</td>
				<td>部门:<select id="deptList" style="width:100px;height: 25px;">
						<option value="-1">请选择</option>
						<#if deptList?exists>
							<#list deptList as department>
								<option value="${department.id}">${department.name}</option>
							</#list>
						</#if>
					</select>
				</td>
				<td style="width:180px">姓名:
					<select id="userList" style="width:70px">
						<option value="-1">请选择</option>
					</select>
					<div id="optionUsers" style="display:none">
						<#if deptList?exists>
							<select>
							<#list deptList as department>
								<#if department.userList?exists>
									<#list department.userList as user>
										<option value="${user.id}" n="${user.name }" d="${department.id}" staffid="${user.staff_id}" t="ud" >${user.username}</option>
									</#list>
								</#if>
							</#list>
						   </select>
						</#if>
					</div>
				</td>
				<td>&nbsp;<button id="seachBtn" onclick="{$('#selectDay').change()}" style="width:100px;">查询</button></td>
				<td>&nbsp;<button id="addNewBtn" style="width:100px;" >新增</button></td>
				<#if (myStatus = "true"&&isDisplay('10_1_2'))||forEdit?if_exists=="true">
					<td id="myStatusInfo"></td>
				</#if>
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
						<td rowspan="2" class="wekValue" ddv="1">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="8">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="15">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="22">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="29">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="36">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
				</table>
			</td>
			<td>
				<table class="wekTable" cellpadding="0" cellspacing="0">
					<tr>
						<td colspan="3" class="wektitle ui-widget-header"><b style="font-size: 18px">星期二</b></td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="2">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="9">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="16">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="23">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="30">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="37">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
				</table>
			</td>
			<td>
				<table class="wekTable" cellpadding="0" cellspacing="0">
					<tr>
						<td colspan="3" class="wektitle ui-widget-header"><b style="font-size: 18px">星期三</b></td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="3">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="10">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="17">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="24">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="31">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="38">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
				</table>
			</td>
			<td>
				<table class="wekTable" cellpadding="0" cellspacing="0">
					<tr>
						<td colspan="3" class="wektitle ui-widget-header"><b style="font-size: 18px">星期四</b></td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="4">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="11">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="18">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="25">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="32">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="40">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
				</table>
			</td>
			<td>
				<table class="wekTable" cellpadding="0" cellspacing="0">
					<tr>
						<td colspan="3" class="wektitle ui-widget-header"><b style="font-size: 18px">星期五</b></td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="5">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="12">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="19">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="26">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="33">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="40">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
				</table>
			</td>
			<td>
				<table class="wekTable sxr" cellpadding="0" cellspacing="0">
					<tr>
						<td colspan="3" class="wektitle ui-widget-header"><b style="font-size: 18px">星期六</b></td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="6">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="13">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="20">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="27">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="34">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="41">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
				</table>
			</td>
			<td>
				<table class="wekTable sxr" cellpadding="0" cellspacing="0">
					<tr>
						<td colspan="3" class="wektitle ui-widget-header"><b style="font-size: 18px">星期日</b></td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="7">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="14">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="21">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="28">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="35">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
					<tr>
						<td rowspan="2" class="wekValue" ddv="42">&nbsp;</td>
						<td class="wekCont" tdIdx="1" >&nbsp;</td>
						<td class="wekCont" tdIdx="2" >&nbsp;</td>
					</tr>
					<tr>
						<td class="wekCont" tdIdx="3" >&nbsp;</td>
						<td class="wekCont" tdIdx="4" >&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</div>
	</div>
</body>
<script type="text/javascript">
	var curYear = new Date().getYear() + 1900;
	if(curYear>"2200"){//兼容IE
		curYear = new Date().getYear();
	}
	var curMoh = new Date().getMonth() + 1;
	var curDay = new Date().getDate();
	var curD = curYear+ "-"+ (curMoh<10?"0":"") + curMoh + "-" + (curDay<10?"0":"") + curDay;
	var curGrade = "${currentUser.grade}";
	var myStatus_  = "${myStatus}";
	var curGrade_ = curGrade;
	var role1_ = (myStatus_=="true"&&curGrade!="1");//我的状态中普通用户只能修改当前日期的状态
	//让权限10_2_3或10_2_4的人具有管理员的权限
	<#if isDisplay('10_2_3')||isDisplay('10_2_4')>
		curGrade='1';
	</#if>
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
		var yyyz = "${year?if_exists}";
		if($.trim(yyyz).length>0){
			selectDay.val(yyyz);
		}
		var mmmz = "${moh?if_exists}";
		if($.trim(mmmz).length>0){
			selectMoh.val(mmmz);
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
		//读取查询月的状态描述信息
		var myStatusZbfInfo = function(){
			var userid = $("#userList").val();
			var userOpt = $("#userList option[value="+ userid +"]");
			var staffid = userOpt.attr("staffid");
			$.post("${gzUrl('oagl/zhcx/myStatusZbfInfo.do')}",{
					 year:selectDay.val(),
					 moh:selectMoh.val(),
					 staffid:staffid
				},function(j){
					var text = new Array();
					if(j.sumCount>0){
						text.push("当月我已值班<font color=red><b>"+j.sumCount+"</b></font>天");
						var count_=0;
						var count2_=0;
						var count_1=0;
						var count_2=0;
						for(var i in j.tiaoxiu){
							if(i==0){
							  text.push("其中");
							}
							var o = j.tiaoxiu[i];
							if(o.status=='1'||o.status=='3'){
								count_ += o.count;
							}else{
								count_1 = o.count;
								//text.push("<font color=red ><b>"+o.count + "</b></font>天值班结算为调休<font color=red><b>0.5</b></font>天");
							}
							count2_+= o.count;
						}
						if(count_>0){
							count_2=count_;
							//text.push("<font color=red><b>"+count_ + "</b></font>天值班结算为调休<font color=red><b>1.5</b></font>天");
						}
						
						if((count_1+count_2)>0){
							text.push("<font color=red><b>"+(count_1+count_2) + "</b></font>天值班结算为调休<font color=red><b>"+((count_1*0.5)+(count_2*1.5))+"</b></font>天");
						}
						
						if(j.butieCount>0){
							text.push("<font color=red><b>"+j.butieCount+"</b></font>天值班结算为值班费<font color=red><b>"+j.feiyong+"</b></font>元");
						}
						if(j.sumCount>(count2_+j.butieCount)){//未设置结算方式的天数
							text.push("另外有<font color=red><b>"+(j.sumCount-(count2_+j.butieCount))+"</b></font>天未设置结算");
						}
						$("#myStatusInfo").html((text.join(",") + "。").replace("其中,","其中"));
					}else{
						$("#myStatusInfo").html("");
					}
				},"json");
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
			$("td.weekEnds").removeClass("weekEnds").html("");//清除所有日期内的日期值
			$(".wekValue").css("background-color","");//清除日期内中的背景色彩
			$.getJSON("${gzUrl('oagl/glgn/getEAndLastDay.do')}",{"year":y,"moh":m},function(json){
				var E = json.E;
				var lastDay = json.lastDay;
				var weekEnds = json.weekEnds;
				for (var i = 1, j = emap[E]; i <= lastDay; i++) {
					var vvd = y + "-" + (m<10?"0":"") + m + "-" + (i<10?"0":"")+ i;
					var td = $("td[ddv=" + (j++) + "]").html("<b style='font-size:16px'>" + (i < 10 ? "0" : "") + i + "</b>").attr("vvd",vvd); 
					if(weekEnds){//周末数据
						for(var l in weekEnds){//循环迭代节假数据（此时节假中包含双休和三薪日）
							if(weekEnds[l].day_time==vvd){//判断是否属于节假
								td.addClass("weekEnds");
								td.next("td").addClass("weekEnds").text("节假").next("td").addClass("weekEnds").text("节假");
								td.parent("tr").next("tr").find("td").addClass("weekEnds").text("节假");
								break;
							}
						}
					}
					if(vvd==curD){
						td.css("background-color","#FFF4C1");
					}else{
						td.css("background-color","");
					}
				}
				
				var userid = $("#userList").val();
				var userOpt = $("#userList option[value="+ userid +"]");
				var staffid = userOpt.attr("staffid");
				var deptid = userOpt.attr("d");
				$.post("${gzUrl('oagl/glgn/findZt.do')}",{//查询状态
					"year":y,
					"moh":m,
					"deptid":deptid=="-1"?"":deptid,
					"staffid":staffid=="-1"?"":staffid
				},function(j){
					for(var i in j){
						var o = j[i];
						var d0 = $("td[vvd="+o.attendance_time+"]");
						var nd = d0.parent("tr").next("tr").find("td");
						var d1 = d0.next("td");
						var d2 = d1.next("td");
						var d3 = $(nd[0]);
						var d4 = $(nd[1]);
						var m = {1:d1,2:d2,3:d3,4:d4};
						var html = "<span vd='"+ o.id +"' s='"+ o.attendance_status +"'>"+o.attendance_statusName+"</span>";
						m[o.order_num].addClass("status" + o.attendance_status).html(html);
					}
					if(staffid&&staffid!="-1"){
							$("td.wekValue").each(function(){
									var d0 = $(this);
									var vvvd = d0.attr("vvd");
									if(vvvd){
										//console.log("N="+vvvd.split("-").join(""));
										//console.log("C="+curD.split("-").join(""));
									}
									if(vvvd&&vvvd.split("-").join("")>=curD.split("-").join("")){
										var nd = d0.parent("tr").next("tr").find("td");
										var arr = new Array();
										arr.push(d0.next("td"));
										arr.push(arr[0].next("td"));
										arr.push($(nd[0]));
										arr.push($(nd[1]));
										$(arr).each(function(){
											if($.trim($(this).text()).length==0){
												$(this).addClass("status1").html("<span>在岗</span>");//为来默认在岗值的设置
											}
										});
								}
							});
					}
				},"json");
			});
			myStatusZbfInfo();
		};
		
		$("#selectDay,#selectMoh").change(function(){
			var y=selectDay.val();
			var m=selectMoh.val();
			loadRiliTable(y,m);
		});
		
		var options = $("#optionUsers option");
		var userList = $("#userList");
		
		$("#deptList").change(function(){
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
		}).change();

		$("#userList").change(function(){
			var y=selectDay.val();
			var m=selectMoh.val();
			loadRiliTable(y,m);
		});
		
		var showAddZt = function(vvd,tdIndex){
			var userid = $("#userList").val();
			var userOpt = $("#userList option[value="+ userid +"]");
			var staffid = userOpt.attr("staffid");
			var deptid = userOpt.attr("d");
			var deptName = $("#deptList option[value="+deptid+"]").text();
			var userName = $("#userList option[value="+userid+"]").text();
			if((curD<=vvd||curGrade=="1")&&deptid!=-1&&userid!=-1){
				var html="";
					html +="<table id='abcTab01' cellpadding=0 cellspacing=1>";
					html +="<tr>";
					html +="<td style='text-align: right;'>姓名:</td>";
					html +="<td><input type='text' disabled style='width:100px;' value='"+userName+"' /></td>";
					html +="<td style='text-align: right;'>&nbsp;&nbsp;部门:</td>";
					html +="<td><input type='text' disabled style='width:100px;' value='"+deptName+"' /></td>";
					html +="</tr>";
					
					html +="<tr>";
					html +="<td style='text-align: right;' >状态:</td>";
					html +="<td colspan=3 ><select id='addOptions' style='height:22px'></select></td>";
					html +="</tr>";
					
					html +="<tr>";
					html +="<td style='text-align: right;'>日期:</td>";
					html +="<td><input type='text' id='kqriqi1' disabled style='width:105px;' value='"+vvd+"' onFocus=\"WdatePicker({maxDate:'#F{$dp.$D(\\'kqriqi2\\')}'})\" class=\"Wdate\" /></td>";
					html +="<td style='text-align: right;'>到日期:</td>";
					html +="<td><input type='text' id='kqriqi2' style='width:105px;' value='"+vvd+"' onFocus=\"WdatePicker({minDate:'#F{$dp.$D(\\'kqriqi1\\')}'})\" class=\"Wdate\" /></td>";
					html +="</tr>";
					
					html +="<tr>";
					html +="<td style='text-align: right;' >时间:</td>";
					html +="<td>";
					html +="<select id='timeSelect1' style='height:22px'>";
					<#if timesModelList?exists>
						<#list timesModelList as model>
							html +="<option value='${model.id}-${model.type}' >${model.model_name}</option>";
						</#list>
					</#if>
					html +="</select>";
					html +="</td>"; 
					html +="<td style='text-align: right;' >时间:</td>";
					html +="<td>";
					html +="<select id='timeSelect2' style='height:22px'>";
					<#if timesModelList?exists>
						<#list timesModelList as model>
							html +="<option value='${model.id}-${model.type}' >${model.model_name}</option>";
						</#list>
					</#if>
					html +="</select>";
					
					html +="</td>"; 
					html +="</tr>";
				<#if forEdit?if_exists=="true"||isDisplay('10_1_3')||isDisplay('10_2_3')||isDisplay('10_2_4')>
					html +="<tr>";
					html +="<td style='text-align: right;' >备注:</td>";
					html +="<td colspan=3 ><textarea id='remarks' rows='4' cols='45'></textarea></td>";
					html +="</tr>";
				</#if>
					html +="</table>";
					
				art.dialog({
					id : "dialog",
					content : html,
					title:"新增工作状态",
					padding : "15px",
					lock : true,
					init:function(){
						var addOptions = $("#addOptions","#abcTab01");
						<#if dictList?exists>
							<#list dictList as dict>
								addOptions.append("<option value='${dict.code}'>${dict.name}</option>");
							</#list>
						</#if>
						
						var optionList = $("#timeSelect2 option:last","#abcTab01");
						$("#timeSelect2","#abcTab01").val(optionList.attr("value"));
						//判断是否为管理员
						if(curGrade=="1"){//管理员
							$("#kqriqi1","#abcTab01").removeAttr("disabled");
						}
						
						if(tdIndex&&tdIndex>'0'){//假如tdIndex存在值，将已经tdIndex值来设定添加内容中时间段内容的默认选项
							$("#timeSelect1","#abcTab01").val($("#timeSelect1 option:eq("+(parseInt(tdIndex)-1)+")","#abcTab01").attr("value"));
							$("#timeSelect2","#abcTab01").val($("#timeSelect2 option:eq("+(parseInt(tdIndex)-1)+")","#abcTab01").attr("value"));
						}
						
					}<#if forEdit?if_exists=="true"||((isDisplay('10_2_3')||isDisplay('10_2_4'))&&(myStatus="false"||forEdit?if_exists=="true"))||(myStatus != "search"&&(isDisplay('10_2_3')||isDisplay('10_2_4'))) >,
					ok : function() {
						var abcTab01 = $("#abcTab01");
						var status = $("#addOptions",abcTab01).val();
						var riqi1 = $("#kqriqi1",abcTab01).val();
						var riqi2 = $("#kqriqi2",abcTab01).val();
						
						var timeModelId1 = $("#timeSelect1",abcTab01).val();
						var timeModelName1 = $("#timeSelect1 option[value=" + timeModelId1 + "]",abcTab01).text();
						
						var timeModelId2 = $("#timeSelect2",abcTab01).val();
						var timeModelName2 = $("#timeSelect2 option[value=" + timeModelId2 + "]",abcTab01).text();
						
						var remarks = $("#remarks",abcTab01).val();
						if(remarks.length>300){
							alert("备注长度在300个字符以内");
							return;
						}
						$("#pageloading").show();
						$.post("${gzUrl('oagl/glgn/saveZt.do')}",{
							status:status,
							riqi1:riqi1,
							riqi2:riqi2,
							timeModelId1:timeModelId1,
							timeModelName1:timeModelName1,
							timeModelId2:timeModelId2,
							timeModelName2:timeModelName2,
							remarks:remarks,
							deptid:deptid,
							staffid:staffid
						},function(text){
							$("#pageloading").hide();
							if($.trim(text).length>0&&$.trim(text)=="true"){
							}else{
								alert("时间区间内，发现值班状态内容，已自动跳过！");
							}
							$("#selectMoh").change();
							var list = art.dialog.list;
								for(var l in list){
									list[l].close();
								}
						},'text');
						return false;
					},
					cancel : true</#if>
				});
			}else{
				if(userid==-1){
					alert("维护新状态时，请选择姓名。");
					return;
				}else if(curD>vvd&&curGrade!="1"){
					alert("非管理员(科室或单位管理员)不能修改已过去时间的人员状态。");
					return;
				}
			}
		};
		
		//修改或查看
		var showUpdOrView = function(vvd,id,status){
			var userid = $("#userList").val();
			var userOpt = $("#userList option[value="+ userid +"]");
			var staffid = userOpt.attr("staffid");
			var deptid = userOpt.attr("d");
			var deptName = $("#deptList option[value="+deptid+"]").text();
			var userName = $("#userList option[value="+userid+"]").text();
			//管理员始终显示修改页面
			//普通人员在小于当期天时，显示查看页面，大于等于当前天是显示修改页面
			if(deptid==-1||userid==-1||!deptid||!userid)return;
			
			var updateOrView = "view";//默认为查看
			if((curD<=vvd||curGrade=="1")&&deptid!=-1&&userid!=-1){
				updateOrView = "update";//允许修改操作
			}
			
			$.post("${gzUrl('oagl/glgn/getZt.do')}",{"id":id},function(j){
				var html  ="";
					html +="<table id='abcTab02' cellpadding='0' cellspacing='1' >";
					html +="<tr>";
					html +="<td style='text-align: right;'>姓名:</td>";
					html +="<td><input type='text' disabled style='width:100px;' value='"+ userName +"' /></td>";
					html +="<td style='text-align: right;'>&nbsp;&nbsp;部门:</td>";
					html +="<td><input type='text' disabled style='width:100px;' value='"+ deptName +"' /></td>";
					html +="</tr>";
					
					if(status==5){//值班类型
						html +="<tr>";
						html +="<td style='text-align: right;' >状态:</td>";
						html +="<td ><select id='addOptions' style='height:22px' ></select></td>";
						html +="<td style='text-align: right;' >结算:</td>";
						html +="<td><select id='jiesuanOptions' style='height:22px' >";
						//html +="<option value='1' >待确认</option>";
						html +="<option value='2' >调休</option>";
						html +="<option value='3' >值班费</option>";
						html +="</select></td>";
						html +="</tr>";
					}else{
						html +="<tr>";
						html +="<td style='text-align: right;' >状态:</td>";
						html +="<td colspan=3 ><select id='addOptions' style='height:22px'></select></td>";
						html +="</tr>";
					}
					
					if(status!=5){//值班类型
						html +="<tr>";
						html +="<td style='text-align: right;'>日期:</td>";
						html +="<td><input type='text' id='kqriqi' disabled style='width:100px;' value='"+vvd+"' /></td>";
						html +="<td style='text-align: right;' >时间:</td>";
						html +="<td>";
						html +="<select id='timeSelect' style='height:22px'>";
						<#if timesModelList?exists>
							<#list timesModelList as model>
								html +="<option value='${model.id}-${model.type}' >${model.model_name}</option>";
							</#list>
						</#if>
						html +="</select>";
						html +="</td>"; 
						html +="</tr>";
					}else{
						html +="<tr>";
						html +="<td style='text-align: right;'>日期:</td>";
						html +="<td colspan=3><input type='text' id='kqriqi' disabled style='width:100px;' value='"+vvd+"' /></td>";
						html +="</tr>";
					}
					<#if forEdit?if_exists=="true"||isDisplay('10_1_3')||isDisplay('10_2_3')||isDisplay('10_2_4')>
						html +="<tr>";
						html +="<td style='text-align: right;' >备注:</td>";
						html +="<td colspan=3 ><textarea id='remarks' rows='4' cols='45'></textarea></td>";
						html +="</tr>";
					</#if>
					html +="</table>";
					
				art.dialog({
					id : "dialog",
					content : html,
					title:"<#if myStatus = "false">编辑</#if>工作状态",
					padding : "15px",
					lock : true,
					init:function(){
						var addOptions = $("#addOptions","#abcTab02");
						<#if dictList?exists>
							<#list dictList as dict>
								addOptions.append("<option value='${dict.code}'>${dict.name}</option>");
							</#list>
						</#if>
						$("#timeSelect","#abcTab02").attr("disabled","disabled").val(j.model_id+"-"+j.order_num);
						$("#remarks","#abcTab02").val(j.remarks);
						if(updateOrView=="view"){
							$("#remarks","#abcTab02").attr("disabled","disabled");
							addOptions.attr("disabled","disabled");
						}
						<#if myStatus != "false"&&forEdit?if_exists!="true">
							$("#jiesuanOptions","#abcTab02").attr("disabled","disabled");
							$("#remarks","#abcTab02").attr("disabled","disabled");
							$("#addOptions","#abcTab02").attr("disabled","disabled");
						</#if>
						<#if (isDisplay('10_2_3')||isDisplay('10_2_4'))&&forEdit?if_exists=="true">
							$("#addOptions","#abcTab02").removeAttr("disabled");
							$("#remarks","#abcTab02").removeAttr("disabled");
						</#if>
						<#if myStatus == "search">
							$("#addOptions","#abcTab02").attr("disabled","disabled");
							$("#remarks","#abcTab02").attr("disabled","disabled");
						</#if>
						if(status==5){//值班类型
							addOptions.append("<option value='"+status+"'>值班</option>");
							addOptions.attr("disabled","disabled");
							$("#jiesuanOptions","#abcTab02").val(j.balance_status);
						}
						addOptions.val(j.attendance_status);
						if(status==5&&j.onduty_type=='3'){//如果是总值班则允许修改结算方式
							$("#jiesuanOptions","#abcTab02").attr("disabled","disabled");
							$("#remarks","#abcTab02").attr("disabled","disabled");
							<#if myStatus ="true"&&gotoType?if_exists=="leftMenu">
								if(curD<=vvd){
									$("#jiesuanOptions","#abcTab02").removeAttr("disabled");
									$("#remarks","#abcTab02").removeAttr("disabled");
								}
							</#if>
						}else{
							$("#jiesuanOptions","#abcTab02").attr("disabled","disabled");
						}
						
						if(role1_&&curD>vvd){
							addOptions.attr("disabled","disabled");
							$("#remarks","#abcTab02").attr("disabled","disabled");
						}
					}<#if forEdit?if_exists=="true"||((isDisplay('10_2_3')||isDisplay('10_2_4'))&&(myStatus="false"||forEdit?if_exists=="true"))||(myStatus != "search"&&(isDisplay('10_2_3')||isDisplay('10_2_4'))) >,
					ok : function() {
						var abcTab02 = $("#abcTab02");
						var status = $("#addOptions",abcTab02).val();
						var riqi = $("#kqriqi",abcTab02).val();
						var timeModelId = $("#timeSelect",abcTab02).val();
						var timeModelName = $("#timeSelect option[value=" + timeModelId + "]",abcTab02).text();
						var remarks = $("#remarks",abcTab02).val();
						var jiesuan = $("#jiesuanOptions",abcTab02).val();
						
						if(remarks.length>300){
							alert("备注长度在300个字符以内!");
							return false;
						}
						$.post("${gzUrl('oagl/glgn/saveZt.do')}",{
							id:id,
							status:status,
							riqi:riqi,
							timeModelId:timeModelId,
							remarks:remarks,
							timeModelName:timeModelName,
							deptid:deptid,
							staffid:staffid,
							jiesuan:jiesuan
						},function(text){
							if($.trim(text).length>0&&$.trim(text)=="true"){
								$("#userList").change();
								var list = art.dialog.list;
								for(var l in list){
									list[l].close();
								}
							}
						},'text');
						return false;
					},
					cancel : true
					</#if>
				});
			},"json");
		}
		
		$(".wekCont").click(function(){
			var s = $(this);
			if(s.hasClass("weekEnds")&&s.find("span").attr("s")!='5'){//周末不能修改,除值班状态以外
				return;
			}
			var tr1 = s.parent("tr")
			var tr2	= tr1.prev("tr");
			var w1 = tr1.find("td.wekValue");
			var w2 = tr2.find("td.wekValue");
			var vvd;
			if(w1.length>0){
				vvd = w1.attr("vvd");
			}else{
				vvd = w2.attr("vvd");
			}
			
			if(vvd){
				/*if(role1_&&curD!=vvd){
					return;//我的状态中普通用户只能修改当前日期的状态
				}*/
				var span = s.find("span");
				var id = span.attr("vd");
				var status = span.attr("s");
				if($.trim(s.text()).length>0&&id){
					showUpdOrView(vvd,id,status);
				}else{
					<#if myStatus = "false"||forEdit?if_exists=="true">
						showAddZt(vvd,s.attr("tdIdx"));//状态维护
					</#if>
				}
			}
			
		}).attr("title","单击可新增状态或查看状态");
		
		<#if myStatus = "true">
			$("#deptList").parent().hide();
			$("#userList").parent().hide();
			$("#seachBtn").hide();
			$("#addNewBtn").hide();
			
			var staffid_ = "${staffid_?if_exists}";
			if($.trim(staffid_).length>0){
				var option = $("#optionUsers option[staffid = "+ staffid_ +"]");
				var staffName = option.text();
				$(".title").text(staffName + "的状态");
				$("#userList").val(option.attr("value"));
			}else{
				$("#userList").val("${currentUser.id}");
			}
			$("#userList").change();
			<#if (myStatus = "true"&&isDisplay('10_1_2'))||forEdit?if_exists=="true">
				myStatusZbfInfo();
			</#if>
		</#if>
		<#if myStatus = "false">
			$("#userList").combobox();
			$("#seachBtn").button();
			$("#addNewBtn").button().click(function(){
				showAddZt(curD);
			});
			$("#userList").change();
		</#if>
		<#if myStatus = "search">
			$("#userList").combobox();
			$("#seachBtn").button();
			$("#addNewBtn").hide();
			$("#userList").change();
		</#if>
		
		$("#pageloading").hide();
	});
</script>
<#include "../../foot.ftl" />