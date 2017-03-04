<#include "../../head.ftl" />

<link href="${gzUrl('script/cal/cal.css')}" type="text/css" rel="stylesheet" />
<link href="${gzUrl('script/artDialog4.1.7/skins/blue.css')}" type="text/css" rel="stylesheet" />
<script src="${gzUrl('script/cal/cal.js')}" type="text/javascript"></script>
<script src="${gzUrl('script/cal/cal_ext.js')}" type="text/javascript"></script>
<script src="${gzUrl('script/artDialog4.1.7/jquery.artDialog.js')}" charset="utf-8"></script>
</head>
<style>
	*{
		font-size:14px;
	}
	body{
		overflow: overlay;
		overflow:scroll;
	}
	.leftTab {
	margin-top: 2px;
	border: 1px #008080 solid;
}
	
	.leftTab tr th {
		background-color: #f0f0f0;
		height: 15px;
	}
	
	.leftTab tr td {
		border-top: 1px #008080 solid;
		border-left: 1px #008080 solid;
		height: 20px;
	}
	
	.leftTab tbody tr td:FIRST-CHILD {
		border-left: 0;
	}
	
	.leftTab tbody tr.active,.leftTab tbody tr:HOVER {
		background-color: #FFF4C1
	}
</style>
<body>
	<div id="pageloading"></div>
	<div class="osx-container">
	<div class="osx-modal-header">
		<div class="osx-modal-icon"></div>
		<div class="osx-modal-title">您现在所在的位置：OA系统->考勤管理->工作日管理</div>
	</div>
	<div class='title' style="font-size:20px;width:100%;text-align:center;color:#3399FF;font-family: '微软雅黑 Bold', '微软雅黑';">工作日管理</div>
	<div style="padding:3px;width:100%">
		<table cellpadding="0" cellspacing="0" style="width:600px;">
			<tr style="height:20px;">
				<td align="left">
					<select id="selectDay" style="width:80px;height: 25px;"></select>&nbsp;
					<button class="xbtn" value="1">设为节假日</button>
					<button class="xbtn" value="2">设为工作日</button>
					<button class="xbtn" value="3">设为三薪日</button>
				</td>
				<td style="background-color: #FF8F59;text-align: center">节假日</td>
				<td style="background-color: #81C0C0;text-align: center">工作日</td>
				<td style="background-color: #A8FF24;text-align: center">三薪日</td>
			</tr>
		</table>
	</div>
	<div>
	<table>
		<tr>
			<td>
				<table cellpadding="0" cellspacing="1">
					<tr>
						<td id="TD01"></td>
						<td id="TD02"></td>
						<td id="TD03"></td>
					</tr>
					<tr>
						<td id="TD04"></td>
						<td id="TD05"></td>
						<td id="TD06"></td>
					</tr>
					<tr>
						<td id="TD07"></td>
						<td id="TD08"></td>
						<td id="TD09"></td>
					</tr>
					<tr>
						<td id="TD10"></td>
						<td id="TD11"></td>
						<td id="TD12"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	</div>
	</div>
	<br/><br/><br/><br/>
</body>
<script type="text/javascript">
	var curYear = new Date().getYear() + 1900;
	if(curYear>3000){
		curYear = new Date().getYear();
	}
	$(function(){
		addDay(curYear);
		var selectDay = $("#selectDay");
		for(var initYear = 2014;initYear<=2020;initYear++){
			if(initYear==curYear){
				selectDay.append("<option selected>"+initYear+"</option>");
			}else{
				selectDay.append("<option >"+initYear+"</option>");
			}
		}
		selectDay.change(function(){
			addDay(parseInt($(this).val()));
		});
		
		$(".xbtn").button().click(function(){
			var value = $(this).attr("value");
			if(value){
				var tds = $("table td.fontsd.active");
				var ddys = new Array();
				tds.each(function(){
					ddys.push($(this).attr("ddv"));
				});
				setDay(ddys.join("|"),value,tds);
			}
		});
		
	});
	
	var addDay = function(year){
		drawCld_(year,0,"#TD01");
		drawCld_(year,1,"#TD02");
		drawCld_(year,2,"#TD03");
		drawCld_(year,3,"#TD04");
		drawCld_(year,4,"#TD05");
		drawCld_(year,5,"#TD06");
		drawCld_(year,6,"#TD07");
		drawCld_(year,7,"#TD08");
		drawCld_(year,8,"#TD09");
		drawCld_(year,9,"#TD10");
		drawCld_(year,10,"#TD11");
		drawCld_(year,11,"#TD12");
		var curYear = new Date().getYear() + 1900;
		if(curYear>3000){
			curYear = new Date().getYear();
		}
		var curMoh = new Date().getMonth() + 1;
		var curDay = new Date().getDate();
		var curD = curYear+ "-"+ (curMoh<10?"0":"") + curMoh + "-" + (curDay<10?"0":"") + curDay;
		if(year>=curYear){
		   <#if isDisplay('10_3')>
			$("table td[isclick=true]").click(function(){
				var curTD = $(this);
				if(curTD.attr("ddv")>=curD){
					if(curTD.hasClass("active")){
						curTD.removeClass("active");
					}else{
						curTD.addClass("active");
					}
				}
			});
		   </#if>
		}
		$("#pageloading").show();
		$.getJSON("${gzUrl('oagl/glgn/findByYear.do')}?year="+year,function(json){
			$.each(json,function(i,o){
				$("table td.fontsd[ddv="+o.day_time+"]").addClass("status"+o.status);
			});
			$("#pageloading").hide();
		});
	}
	
	var setActive = function(s){
		$(".leftTab .active").removeClass("active");
		$(s).parent().parent().addClass("active");
	}
	
	var setDay = function(dds,tt,tds){
		artDialog.tips('数据正在提交..', 2);
		$.post("${gzUrl('oagl/glgn/daySettings.do')}",{day:dds,status:tt},function(text){
			if($.trim(text).length>0){
				tds.each(function(){
					var d = $(this);
					d.removeClass("active").removeClass("status1").removeClass("status2").removeClass("status3").addClass("status"+tt);
				});
				artDialog.tips('成功！已经保存在服务器');
			}else{
				artDialog.tips('失败！');
			}
		});
	}
</script>
<#include "../../foot.ftl" />