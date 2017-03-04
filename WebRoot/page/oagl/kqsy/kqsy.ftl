<#include "../../head.ftl" />
<link href="${gzUrl('script/artDialog4.1.7/skins/blue.css')}" type="text/css" rel="stylesheet" />
<script src="${gzUrl('script/artDialog4.1.7/jquery.artDialog.js')}" charset="utf-8"></script>
<script src="${gzUrl('script/My97DatePicker/WdatePicker.js')}" ></script>
<script type="text/javascript" src="${gzUrl('script/Highcharts-2.1.9/js/highcharts.js')}"></script>
<style>
*{
	font-size:14px;
}
body{
	overflow: overlay;
		overflow:scroll;
}
#tbar{
	margin: 3px;
	width:750px;
}

tr.topTable .td1{
	font-family: '应用字体 Bold', '应用字体';
	height:30px;
	border: 1px solid silver;
	font-size:20px;
	text-align:center;
	color: white;
	background-color:#009DDA
}
tr.topTable td.tdBtn.active{
	background-color: #FF6600;
}
tr.topTable td.tdBtn{
	width:60px;
	cursor: pointer;
}
tr.topTable td.tdBtn:HOVER{
	background-color: #FF6600;
}
#tbar .content{
	border: 1px solid #5C9CCC;
}
#tbar .content div.c1{
	width:100%;
	display:none;
}
#tbar .content div.active{
	display:block;
}
#tongjiTable{
	width:100%;
}
#tongjiTable tr td.td1{
	font-size:15px;
	border-top: 1px solid #5C9CCC;
	border-left: 1px solid #5C9CCC;
	padding-left:15px;
	height:22px;
}
#tongjiTable tr:FIRST-CHILD td{
	border-top: 0px;
}
#tongjiTable tr td:FIRST-CHILD{
	border-left: 0px;
}
#tongjiTable .lastTd:HOVER{
	background-color: #FFF4C1;
}
#tongjiTable .lastTd{
	cursor: pointer;
}
.after_{
}
.after_ .td1{
	padding: 0px;
	padding-left: 0px
}
.after_ table tr td{
	border-top: 1px solid silver;
	border-left: 1px solid silver;
}
.ulist li{
	cursor: pointer;
	text-align:center;
}
.ulist li:HOVER{
	background-color: #FFF4C1
}
.pTr:hover{
	background-color: #FFF4C1;
}

.wekCont_status1{
	padding: 3px;
	padding-left: 10px;
	padding-right: 10px;
	border: 1px solid silver;
	background-color: #FFFFFF;
}
.wekCont_status2{
	padding: 3px;
	padding-left: 10px;
	padding-right: 10px;
	border: 1px solid silver;
	background-color: #FFFF33;
}
.wekCont_status3{
	padding: 3px;
	padding-left: 10px;
	padding-right: 10px;
	border: 1px solid silver;
	background-color: #FF6600;
}
.wekCont_status4{
	padding: 3px;
	padding-left: 10px;
	padding-right: 10px;
	border: 1px solid silver;
	background-color: #FF0000;
}
.wekCont_status5{
	padding: 3px;
	padding-left: 10px;
	padding-right: 10px;
	border: 1px solid silver;
	background-color: #66FF00;
}
</style>
</head>
<body>
	<div id="pageloading"></div>
	<div class="osx-container">
		<div class="osx-modal-header">
			<div class="osx-modal-icon"></div>
			<div class="osx-modal-title">您现在所在的位置：OA系统->考勤管理->考勤首页</div>
		</div>
		<table id="tbar" cellpadding="0" cellspacing="0">
			<tr>
				<td colspan="6" style="text-align:right;padding-right: 30px;">
					<button id="todayBtn" value="${today?if_exists}" >今天</button>
					<button id="nextDayBtn" >后一天</button>
					<input type="text" id="riqi" style="width:90px;" value="${today?if_exists}" class="text ui-widget-content ui-corner-all Wdate" onfocus="WdatePicker()"/>
					<select id="dictStatus">
						<#if timesModelList?exists>
							<#list timesModelList as model>
								<option value='${model.id}' <#if timesModelsValue?if_exists = model.id >selected=selected</#if> >${model.model_name}</option>
							</#list>
						</#if>
					</select>
				</td>
			</tr>
			<tr class="topTable">
				<td vvd="-1" v='-1' class="tdBtn td1 active" style="border-left:0px;border-bottom:0px;">所有</td>
				<td vvd="1" v='1' class="tdBtn td1" style="border-left:0px;border-bottom:0px;">在岗</td>
				<td vvd="2" v='1' class="tdBtn td1" style="border-left:0px;border-bottom:0px;">外出</td>
				<td vvd="3" v='1' class="tdBtn td1" style="border-left:0px;border-bottom:0px;">请假</td>
				<td vvd="5" v='1' class="tdBtn td1" style="border-left:0px;border-right:0px;border-bottom:0px;">值班</td>
				<td style="width:60%" class="td1" style="border-left:0px;border-right:0px;border-bottom:0px;">
					<table style="width:100%" cellpadding="0" cellspacing="0">
						<tr>
							<td style="width:60px;text-align:right;font-size:14px">&nbsp;&nbsp;</td>
							<td style="text-align:left;width:90px;">&nbsp;&nbsp;</td>
							<td style="width:60px;text-align:right;font-size:14px" id="nameTD1" >名称：</td>
							<td style="width:140px;text-align:left;font-size:14px" id="nameTD2" >
								<select id="userList">
									<option value="-1" ></option>
									<#if deptList?exists>
										<#list deptList as department>
											<#if department.userList?exists>
												<#list department.userList as user>
													<option value="${user.staff_id}" userid="${user.id}" n="${user.name }" d="${department.id}" staffid="${user.staff_id}" t="ud" >${user.username}</option>
												</#list>
											</#if>
										</#list>
									</#if>
								</select>
							</td>
							<td style="text-align:right;font-size:13px;"><button id="searchBtn">查看</button></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="6" class="content" style="border-top:0px;">
					<div to="-1" class="c1 active">
						<#if deptList?exists>
							<table id="tongjiTable" cellpadding="0" cellspacing="0" >
								<#list deptkqsyList as department>
									<tr class="noticeEO">
										<td style="width:165px" class="td1" deptid="${department.id}">${department.name}</td>
										<td class="lastTd td1">
											<table cellpadding="0" cellspacing="0">
												<tr>
													<td style="width:80px">在职 <span class="dept_${department.id} s0">${department.usersize}</span>人</td>
													<td style="width:80px"><div class="div_content">在岗 <span class="dept_${department.id} s1 vs">0</span>人</div></td>
													<td style="width:80px"><div class="div_content">外出 <span class="dept_${department.id} s2 vs">0</span>人</div></td>
													<td style="width:80px"><div class="div_content">请假 <span class="dept_${department.id} s3 vs">0</span>人</div></td>
													<td style="width:80px"><div class="div_content">值班 <span class="dept_${department.id} s5 vs">0</span>人</div></td>
												</tr>
											</table>
										</td>
									</tr>
								</#list>
							</table>
						</#if>
					</div>
					<div to="1" class="c1" style="padding: 3px;">
						<table id="dataGrid"></table>
						<div id="pager"></div>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div style="display:none" id="dvTpl" >
		<table cellpadding="0" cellspacing="0">
			<tr>
				<td style='text-align:right'>姓名:</td>
				<td id="staffName"></td>
				<td style='text-align:right'>部门：</td>
				<td id="deptName"></td>
			</tr>
			<tr>
				<td style='text-align:right'>日期:</td>
				<td>
					<input type="text" id="riqi_" style="width:90px;" class="Wdate" onfocus="WdatePicker()"/>
				</td>
				<td>
					<select id="dictStatus_" style="height:22px">
						<#if timesModelList?exists>
							<#list timesModelList as model>
								<option value='${model.id}' >${model.model_name}</option>
							</#list>
						</#if>
					</select>
				</td>
				<td><button id="todayBtn_" value="${today?if_exists}">今天</button></td>
			</tr>
			<tr>
				<td style='text-align:right'>状态:</td>
				<td><input type="text" id="status_" style="width:90px;" disabled=disabled /></td>
				<td><button id="yuelireadbtn">月历方式查看</button></td>
				<td><button id="nextDayBtn_">后一天</button></td>
			</tr>
			<tr>
				<td>备注:</td>
				<td colspan='3'>
					<textarea id="remarks" rows="4" cols="45" disabled=disabled ></textarea>
				</td>
			</tr>
		</table>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		var curvvd = 1;
		$(".topTable .tdBtn").click(function(){
			$(".topTable .tdBtn.active").removeClass("active");
			var vvd = $(this).addClass("active").attr("vvd");
			var vvv = $(this).addClass("active").attr("v");
			$("#tbar .content div.active").removeClass("active");
			$("#tbar .content div[to="+vvv+"]").addClass("active");
			if(vvv=="-1"){
				$("#nameTD1,#nameTD2").hide();
			}else{
				$("#nameTD1,#nameTD2").show();
			}
			curvvd = vvd;
			jQuery("#dataGrid").jqGrid('setGridParam', {
				postData : {
					staffid:$("#userList").val(),
			 		attendance_status:vvd,
					timeModelId:$("#dictStatus").val(),
			 		riqi:$("#riqi").val()
				}
			}).trigger('reloadGrid');
		});
		
		$("#searchBtn").button().click(function(){
			jQuery("#dataGrid").jqGrid('setGridParam', {
				postData : {
					staffid:$("#userList").val(),
			 		attendance_status:curvvd,
					timeModelId:$("#dictStatus").val(),
			 		riqi:$("#riqi").val()
				}
			}).trigger('reloadGrid');
			setkqsyZtcx();
		});
		
		$(".lastTd.td1").click(function(){
		
			/*****放弃饼状图暂时方式
			var ss = $(this);
			var tr = ss.parent();
			var td0 = ss.prev("td");
			if(tr.next("tr").is($(".after_"))){
				$(".after_").remove();
			}else{
			$(".after_").remove();
			var timeModelId = $("#dictStatus").val();
			var riqi = $("#riqi").val();
			var deptid = td0.attr("deptid");
			var deptName = td0.text();
			
			$.post("${gzUrl('oagl/kqsy/kqsysy.do')}",{riqi:riqi,deptid:deptid,timeModelId:timeModelId},function(j){
				var html = new Array();
				html.push("<tr class='after_' ><td class='td1' style='padding-left: 0px' colspan='2' >");
				html.push("<table style='width:100%;height:100%;' cellpadding=0 cellspacing=0 >");
				var h1= getHtmlUiList(j,"1");
				if(h1!=""){
					html.push("<tr style='height:20px' >");
					html.push("<td style='width: 180px;text-align:right;'>");
					html.push("在岗&nbsp;&nbsp;");
					html.push("</td>");
					html.push("<td style='margin: 0px;padding:1px'>");
					html.push(h1);
					html.push("</td>");
					html.push("</tr>");
				}
				var h2 = getHtmlUiList(j,"2");
				if(h2!=""){
					html.push("<tr style='height:20px'>");
					html.push("<td style='text-align:right;width: 180px;'>");
					html.push("外出&nbsp;&nbsp;");
					html.push("</td>");
					html.push("<td style='margin: 0px;padding:1px'>");
					html.push(h2);
					html.push("</td>");
					html.push("</tr>");
				}
				var h3 = getHtmlUiList(j,"3");
				if(h3!=""){
					html.push("<tr style='height:20px'>");
					html.push("<td style='text-align:right;width: 180px;'>");
					html.push("请假&nbsp;&nbsp;");
					html.push("</td>");
					html.push("<td style='margin: 0px;padding:1px'>");
					html.push(h3);
					html.push("</td>");
					html.push("</tr>");
				}
				var h5 = getHtmlUiList(j,"5")
				if(h5!=""){
					html.push("<tr style='height:20px'>");
					html.push("<td style='text-align:right;width: 180px;'>");
					html.push("值班&nbsp;&nbsp;");
					html.push("</td>");
					html.push("<td style='margin: 0px;padding:1px'>");
					html.push(h5);
					html.push("</td>");
					html.push("</tr>");
				}
				
				if(h1!=""||h2!=""||h3!=""||h5!=""){
					html.push("<tr >");
					html.push("<td colspan=2 >");
					html.push("<div id='container' style='height: 350px; margin: 0 auto'><div>");
					html.push("</td>");
					html.push("</tr>");
				}
				html.push("</table>");
				
				html.push("</td></tr>");
				if(h1!=""||h2!=""||h3!=""||h5!=""){
					tr.after(html.join(""));
				}
				
				$(".after_").show(350);
				
				if(h1!=""||h2!=""||h3!=""||h5!=""){
					arePie('container',$(".s0",ss).text(),
									   $(".s1",ss).text(),
									   $(".s2",ss).text(),
									   $(".s3",ss).text(),
									   $(".s5",ss).text());
				}else{
					//"没有查询到相关数据！"
					return;
				}
				$(".after_ .ulist li").click(function(){
					var staffid = $(this).attr("staffid");
					var staffName =$(this).text();
					var html = $("#dvTpl").html();
						art.dialog({
							content:"<div style='width:100%' id='artD'>"+ html+"</div>",
							title:"状态查看",
							lock:true,
							padding:4,
							init:function(){
								$("#staffName","#artD").text(staffName);
								$("#deptName","#artD").text(deptName);
								$("#riqi_","#artD").val(riqi);
								$("#dictStatus_","#artD").val(timeModelId);
								getInfoTop(riqi,timeModelId,deptid,staffid);
								$("#nextDayBtn_","#artD").button().click(function(){
									$.post("${gzUrl('oagl/glgn/jisuanRiqi.do')}",{day:$("#riqi_","#artD").val(),value:1},function(j){
										$("#riqi_","#artD").val(j);
										getInfoTop($("#riqi_","#artD").val(),$("#dictStatus_","#artD").val(),deptid,staffid);
									});
								});
								$("#todayBtn_","#artD").button().click(function(){
									$("#riqi_","#artD").val(this.value);
									getInfoTop($("#riqi_","#artD").val(),$("#dictStatus_","#artD").val(),deptid,staffid);
								});
								$("#riqi_,#dictStatus_","#artD").change(function(){
									getInfoTop($("#riqi_","#artD").val(),$("#dictStatus_","#artD").val(),deptid,staffid);
								});
								//使用月历的方式打开
								$("#yuelireadbtn","#artD").button().click(function(){
									var riqi = $("#riqi_","#artD").val();
									var riqis = riqi.split("-");
									var url = new Array("${gzUrl('oagl/glgn/ztwh.do?my=true')}");
									url.push("year=" + riqis[0]);
									url.push("moh=" + riqis[1]);
									url.push("staffid=" + staffid);
									open(url.join("&"),"","height=600,width=1200,top=0,left=0,boolbar=no,location=no,status=no");
								});
							},
							cancel:true
						});
				});
			},"json");
			}
			***********************************************************************/
			
			/*************************考勤首页：点击部门后，按人员，每人一行，显示当前日期的4个时间段的状态（按照我的状态中的显示）；取消目前的饼状图***********/	
			var ss = $(this);
			var tr = ss.parent();
			var td0 = ss.prev("td");
			if(tr.next("tr").is($(".after_"))){
				$(".after_").remove();
			}else{
				$(".after_").remove();
				var timeModelId = $("#dictStatus").val();
				var riqi = $("#riqi").val();
				var deptid = td0.attr("deptid");
				var deptName = td0.text();
				if(deptid!=""&&deptName!=""&&riqi!=""){
					$.post("${gzUrl('oagl/kqsy/kqsyContent.do')}",{deptid:deptid,riqi:riqi},function(j){
						if(j.length>1){
						var html = new Array();
							html.push("<tr class='after_ ' >");
							html.push("<td class='td1' style='padding-left: 0px' colspan='2' >");
							html.push("<table style='width:100%;height:100%;' cellpadding=0 cellspacing=0 >");
							var stautsList=undefined;
							for(var i in j){
								var o = j[i];
								if(i==0){//状态对照列表
									stautsList=o;
								}else{
									html.push("<tr style='height:20px' class='pTr'>");
									html.push("<td style='text-align:right;width: 165px;border-right: 1px solid #5C9CCC;' class='td1'>");
									html.push(o.staff_info_name+"&nbsp;&nbsp;");
									html.push("</td>");
									html.push("<td style='margin: 0px;padding:1px;border-left: 0px;' class='td1'>&nbsp;&nbsp;");
									html.push(getStatus(stautsList,1,o)+"&nbsp;");
									html.push(getStatus(stautsList,2,o)+"&nbsp;");
									html.push(getStatus(stautsList,3,o)+"&nbsp;");
									html.push(getStatus(stautsList,4,o)+"&nbsp;");
									html.push("</td>");
									html.push("</tr>");
								}
							}
							html.push("</table>");
							html.push("</td></tr>");
							tr.after(html.join(""));
							window.setTimeout(function(){
								$(".after_").show(0);
							},200);
						}
					},"json");
				}
			}
			/*****************************/	
		});
		
		
		var getStatus = function(statusList,timeType,dataInfo){
			var spanHtml = new Array();
			if(statusList&&dataInfo){
				var statusinfos = dataInfo.status_info.split(",");
				for(var s in statusinfos){
					var statusinfo = statusinfos[s];
					var sinfos = statusinfo.split(";");
					if(sinfos[1]==timeType){
						for(var j in statusList){
							if(statusList[j].code == sinfos[0]){
								spanHtml.push("<span statusType = '"+statusList[j].code+"' class='wekCont_status"+statusList[j].code+"' >");
								spanHtml.push(statusList[j].name);
								spanHtml.push("</span>");
								break;
							}
						}
						break;
					}
				}
			}
			var html = spanHtml.join("");
			if(html==""){
				return "<span>&nbsp;&nbsp;&nbsp;</span>";
			}
			return html;
		}
		
		var getInfoTop = function(riqi, timeModelId, deptid, staffId){
			$.post("${gzUrl('oagl/kqsy/kqsyInfo.do')}",
				{riqi:riqi,timeModelId:timeModelId,deptid:deptid,staffId:staffId}
				,function(j){
					if(j){
						$("#remarks","#artD").val(j.remarks);
						$("#status_","#artD").val(j.status);
					}else{
						alert(riqi+" 这天没有记录。");
					}
				},"json");
		}
		
		var getHtmlUiList = function(list,status){
			var html = new Array();
			html.push("<ul class='ulist' style='margin:0px;padding:0px;width:100%;' >");
			if(list!=null&&list.length>0){
				for(var i in list){
					var o = list[i];
					if(o.attendance_status==status){
						html.push("<li style='margin:0px;padding:2px;list-style:none;float:left;height:15px;width:45px;' staffid="+ o.staff_info_id +">"+ o.staff_name +"</li>");
					}
				}
			}
			html.push("</ul>");
			if(html.length>2){
				return html.join("");
			}
			return "";
		}
		
		var arePie = function(container,s0,s1,s2,s3,s5){
			s0 = parseInt(s0);
			s1 = parseInt(s1);
			s2 = parseInt(s2);
			s3 = parseInt(s3);
			s5 = parseInt(s5);
			var v1 = s1/s0;
			var v2 = s2/s0;
			var v3 = s3/s0;
			var v4 = s5/s0;
			var oo = s1 + s2 + s3 + s5;
			var v5 = oo<s0?((s0-oo)/s0):0;
			
			var chart = new Highcharts.Chart({
					chart: {
						renderTo: container,
						plotBackgroundColor: null,
						plotBorderWidth: null,
						plotShadow: false
					},
					title: {text: '状态统计图'},
					tooltip: {
						formatter: function() {
							var value = this.percentage*100;
							value = Math.round(value)/100;
							return '<b>'+ this.point.name +'</b>: '+ value +' %';
						}
					},
					plotOptions: {
						pie: {
							allowPointSelect: true,
							cursor: 'pointer',
							dataLabels: {
								enabled: true,
								color: '#000000',
								connectorColor: '#000000',
								formatter: function() {
									var value = this.percentage*100;
									value = Math.round(value)/100;
									return '<b>'+ this.point.name +'</b>: '+ value +' %';
								}
							}
						}
					},
				    series: [{
						type: 'pie',
						name: '状态统计',
						data: [
							{
								name: '在岗',    
								y: v1,
								sliced: true,
								selected: true
							},
							['外出', v2],
							['请假', v3],
							['值班', v4],
							['其它', v5]
						]
					}]
				});
		}
		
		$("#todayBtn").button().click(function(){
			$("#riqi").val(this.value);
		});
		
		$("#nextDayBtn").button().click(function(){
			$.post("${gzUrl('oagl/glgn/jisuanRiqi.do')}",{day:$("#riqi").val(),value:1},function(j){
				$("#riqi").val(j);
			});
		});
		
		var jqg = $("#dataGrid").jqGrid({
				colNames : [ "部门","员工编号","姓名","日期","备注" ],
				colModel : [ {	name:"department_name",index:"department_name",width:150,sortable:false,align:"left"	},
								  {name:"user_name",index:"user_name",width:100,sortable:false,align:"center"},
								  {name:"staff_name",index:"staff_name",width:100,sortable:false,align:"center"},
								  {name:"attendance_time",index:"attendance_time",width:120,sortable:false,align:"center"},
								  {name:"remarks",index:"remarks",width:300,sortable:false,align:"left"}],
				datatype : "json", //将这里改为使用JSON数据
				url : "${gzUrl('oagl/kqsy/kqList.do')}", //这是Action的请求地址
				mtype : 'POST',
				postData : {
				 	staffid:$("#userList").val(),
				 	attendance_status:"1",
					timeModelId:$("#dictStatus").val(),
				 	riqi:$("#riqi").val()
				},
				pager : $("#pager"),
				rowNum : 20,
				shrinkToFit : false,
				rownumbers : false,
				hidegrid : false,
				multiselect : false,
				viewrecords : true,
				height : "100%",
				width : '100%',
				rowList : [ 20, 40, 60 ]
			});
		
		//考勤首页的状态查询
		var setkqsyZtcx = function(){
			$.post("${gzUrl('oagl/kqsy/kqsyZtcx.do')}",{
				timeModelId:$("#dictStatus").val(),
			 	riqi:$("#riqi").val()
			 	},function(j){
			 	$("span.vs").html("0");
				for(var i in j){
					var o = j[i];
					$("span.dept_"+o.department_id+".s"+o.attendance_status).html(""+ o.attendance_count);
				}
				$(".div_content").show();
				if(($("#riqi").val()+"").split("-").join("")>"${today?if_exists}".split("-").join("")){
					//未来的某一天 将数据都为0的部门，将其值隐藏
					$(".lastTd.td1 tr").each(function(){
						var div = $(".div_content",this).each(function(){
							if($(".vs",this).text()=='0'){
								$(this).hide();
							}
						});
					});
				}
			},"json");
		}
		setkqsyZtcx();
		$("tr.noticeEO:even").css("background","#E4E4E4");
		$("#nameTD1,#nameTD2").hide();
		$("#userList").combobox();
		$("#dictStatus").combobox();
		$("#pageloading").hide();
	});
</script>
<#include "../../foot.ftl" />