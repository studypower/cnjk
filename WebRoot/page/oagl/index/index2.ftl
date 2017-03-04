<#include "../../head.ftl" />
<link href="${gzUrl('script/artDialog4.1.7/skins/blue.css')}" type="text/css" rel="stylesheet"/>
<script src="${gzUrl('script/My97DatePicker/WdatePicker.js')}"></script>
<script src="${gzUrl('script/artDialog4.1.7/jquery.artDialog.js')}" charset="utf-8"></script>

</head>
<style>
body{
	overflow: overlay;
	overflow:scroll;
}
.applyTd:hover{
	background: #5C9CCC
}
.notoceTd{
	text-align: left
}
.notoceTd:hover{
	background: #5C9CCC
}
.mailli:hover{
	background: #5C9CCC
}
</style>
<body>
<script>
alert("adda");
	$(function(){
		/***控制隐藏左边菜单*************************************/
	    	var pdoc = $(window.parent.document);
	    	$(".l-layout-collapse-left",pdoc).hide();
	    	$(".l-layout-center",pdoc).css("left","0px").css("width","100%");
	    	$(window).resize(function(){
	    		$(".l-layout-center",pdoc).css("left","0px").css("width","100%");
	    	});
	    /***控制隐藏左边菜单*************************************/
	});
</script>
	<center>
		<table cellpadding="0" cellspacing="0" style="padding-top:5px;padding-left:5px;width:1050px;">
			<tr>
				<td style="width:320px;">
					<div style="background-image:url('${gzUrl('images/u0.png')}');width:320px;height:124px;">
						<									dsqqq222 style="padding-top:12px;padding-left:12px;">
							<tr>
								<td>
									<a href="###" name="AtoMail" id="toEmailLogin"><img src="${gzUrl('images/u69.png')}" onmouseover="{this.src='${gzUrl('images/u69_mouseOver.png')}';}" onmouseout="{this.src='${gzUrl('images/u69.png')}'}" width="130" style="border:0px;" /></a>
								</td>
								<td>
									<ul style="padding: 0px;">
										<li class="mailli" id="emailNewCount" style="list-style: none;border:1px solid #5C9CCC;width:120px;padding:5px;cursor: pointer;">收信</li>
										<li class="mailli" id="emailLoginUrl" style="list-style: none;border:1px solid #5C9CCC;width:120px;padding:5px;margin-top: 5px;cursor: pointer;"><a href="###" name="AtoMail">未读邮件(<span id="newCountValue">0</span>)</a></li>
									<ul>
								</td>
							</tr>
						</table>
					</div> 
				</td>
				<td rowspan='3' style="vertical-align: top;padding-left:10px;padding-top:6px;">
					<table cellpadding="0" cellspacing="0" style="width:100%">
						<tr style="height:35px;">
							<td colspan="3" style="text-align:center;background: #5C9CCC;color: #FFFFFF;" class="ui-widget-header"><b>通知公告</b></td>
						</tr>
						<tr style="height:35px">
							<th style="border:1px solid #5C9CCC;" class="ui-widget-header">标题</th>
							<th style="border:1px solid #5C9CCC;border-left:0px solid #5C9CCC;width:120px;" class="ui-widget-header">发布时间</th>
							<th style="border:1px solid #5C9CCC;border-left:0px solid #5C9CCC;width:80px;" class="ui-widget-header">发布人</th>
						</tr>
						<#if noticeList?exists>
								<#list noticeList as notice>
									<tr style="height:30px" class="noticeEO">
										<td class="notoceTd" style="border:1px solid #5C9CCC;border-top:0px;padding-left:5px;"><a href="${gzUrl('oagl/tzgg/view.do')}?id=${notice.id}" target="_blank" ><#if notice.top='1' ><font color=red ></#if>${notice.notice}<#if notice.top='1' ></font></#if></a></td>
										<td style="border:1px solid #5C9CCC;border-left:0px solid #5C9CCC;border-top:0px;text-align:center;">${notice.publish_date}</td>
										<td style="border:1px solid #5C9CCC;border-left:0px solid #5C9CCC;border-top:0px;text-align:center;">${notice.publisher}</td>
									</tr>
								</#list>
								<tr style="height:30px" class="noticeEO">
									<td class="notoceTd" colspan="3" style="border:1px solid #5C9CCC;border-top:0px;padding-left:5px;"><a href="${gzUrl('oagl/index/initTzggList.do')}" target="_blank" >更多</a></td>
								</tr>
							</#if>
					</table>
				</td>
			</tr>
			<tr>
				<td>
				<br/>
					<table cellpadding="0" cellspacing="0" style="width:100%">
						<tr style="height:35px;">
							<td colspan="2" style="text-align:center;background: #5C9CCC;color: #FFFFFF;"><b>值班信息</b></td>
						</tr>
						<tr style="height:35px;">
							<td colspan="2">
								<button id="prevBtn">前一天</button><button value="${today?if_exists}" id="todayBtn" >今天</button><button id="nextBtn">后一天</button>
								<input type="text" id="riqi" style="width:90px;height:25px;" value="${today?if_exists}" class="text ui-widget-content ui-corner-all Wdate" onfocus="WdatePicker()" />
							</td>
						</tr>
						<tr style="height:35px;">
							<td style="text-align:right;width:120px;border:1px solid #5C9CCC;font-weight: bold;">值班领导：</td>
							<td class="zhibantd" style="border:1px solid #5C9CCC;border-left:0px" zhibanType="1">&nbsp;</td>
						</tr>
						<tr style="height:35px;">
							<td style="text-align:right;border:1px solid #5C9CCC;border-top:0px;font-weight: bold;">总值班：</td>
							<td class="zhibantd" style="border:1px solid #5C9CCC;border-top:0px;border-left:0px" zhibanType="3" >&nbsp;</td>
						</tr>
						<tr style="height:35px;">
							<td style="text-align:right;border:1px solid #5C9CCC;border-top:0px;font-weight: bold;">小分队听班：</td>
							<td class="zhibantd" style="border:1px solid #5C9CCC;border-top:0px;border-left:0px" zhibanType="2" >&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td style="vertical-align: top"><br/>
					<table id="applyTable" cellpadding="0" cellspacing="0" style="width:100%" >
						<thead>
						<tr style="height:35px;">
							<th colspan="2" style="text-align:center;background: #5C9CCC;color: #FFFFFF;"><b>待办事宜</b></th>
						</tr>
						</thead>
						<tbody>
						<tr style="height:35px;">
							<td class="applyTd" style="width:120px;text-align:center;border:1px solid #5C9CCC;border-top:0px;cursor: pointer;"><a href="${gzUrl('clgl/ycsq/initList.do')}?from=welcome" target="_blank" >车辆申请(${carUseCount})</a></td>
							<#if isDisplay('4_1_1')>
								<td class="applyTd" style="width:120px;text-align:center;border:1px solid #5C9CCC;border-top:0px;cursor: pointer;"><a href="${gzUrl('gysgl/gysxx/initList.do')}?from=welcome" target="_blank" >供应商管理(${gysxxCount})</a></td>
							</#if>
						</tr>
						<tr style="height:35px;">
							<td class="applyTd" style="width:120px;text-align:center;border:1px solid #5C9CCC;border-top:0px;cursor: pointer;"><a href="${gzUrl('hysgl/sq/initList.do')}?from=welcome" target="_blank" >会议室申请(${roomCount})</a></td>
							<#if isDisplay('5_1')>
							<td class="applyTd" style="width:120px;text-align:center;border:1px solid #5C9CCC;border-top:0px;cursor: pointer;" ><a href="${gzUrl('wpcg/initList.do?step=6&fundsApplyId=-100')}?from=welcome" target="_blank" >固定资产管理(${gdzcCount})</a></td>
							</#if>
						</tr>
						<tr style="height:35px;">
							<#if isDisplay('2_1')>
							<td class="applyTd" style="width:120px;text-align:center;border:1px solid #5C9CCC;border-top:0px;cursor: pointer;"><a href="${gzUrl('jfgl/initList.do?step=0&from=welcome')}" target="_blank" >经费管理(${jfclCount})</a></td>
							</#if>
							<#if isDisplay('6_3')>
							<td class="applyTd" style="width:120px;text-align:center;border:1px solid #5C9CCC;border-top:0px;cursor: pointer;"><a href="${gzUrl('dzgzd/wdgzd/initList.do?from=welcome')}" target="_blank" >电子工资单(${dzgzdCount})</a></td>
							</#if>
						</tr>
						<tr style="height:35px;">
							<#if isDisplay('3_1_1')>
							<td class="applyTd" colspan='2' style="width:120px;text-align:center;border:1px solid #5C9CCC;border-top:0px;cursor: pointer;"><a href="${gzUrl('wpcg/initList.do?step=-1&fundsApplyId=-100')}" target="_blank" >物品采购(${wpcgCount})</a></td>
							</#if>
							<#if isDisplay('7_1_3')>
								<!-- <td class="applyTd" style="width:120px;text-align:center;border:1px solid #5C9CCC;border-top:0px;cursor: pointer;"><a href="${gzUrl('/rygl/jbxx/initList.do')}" target="_blank" >人员管理(${ryglCount})</a></td> -->
							</#if>
						</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</table>
	</center>
</body>
<script type="text/javascript">
	$(function(){
		//****************************************************值班信息
		$("#riqi").change(function(){
			var riqi = this.value;
			$(".zhibantd").html("&nbsp;");//情况值班内容
			$.post("${gzUrl('oagl/index/zhiban.do')}",{riqi:riqi},function(j){
				//1:领导值班，2：小分队听班，3：总值班
				if(j&&j.length>0){
					var zhiban1 = new Array();
					var zhiban2 = new Array();
					var zhiban3 = new Array();
					$.each(j,function(i,o){
						if(o.on_duty_type=="1"){
							zhiban1.push(o.staff_name);
						}else if(o.on_duty_type=="2"){
							zhiban2.push(o.staff_name);
						}else if(o.on_duty_type=="3"){
							zhiban3.push(o.staff_name);
						}
					});
					$("td[zhibanType=1]").html("&nbsp;"+ zhiban1.join(","));
					$("td[zhibanType=2]").html("&nbsp;"+ zhiban2.join(","));
					$("td[zhibanType=3]").html("&nbsp;"+ zhiban3.join(","));
				}
			},"json");
		}).change();
		var riqiZv = $("#riqi").val();
		$("#todayBtn").button().click(function(){
			$("#riqi").val($(this).attr("value"));
			riqiZv = $("#riqi").val();
			$("#riqi").change();
		});
		
		$("#prevBtn").button().click(function(){
			$.post("${gzUrl('oagl/glgn/jisuanRiqi.do')}",{day:$("#riqi").val(),value:-1},function(j){
				$("#riqi").val(j);
				riqiZv = $("#riqi").val();
				$("#riqi").change();
			});
		});
		
		$("#nextBtn").button().click(function(){
			$.post("${gzUrl('oagl/glgn/jisuanRiqi.do')}",{day:$("#riqi").val(),value:1},function(j){
				$("#riqi").val(j);
				riqiZv = $("#riqi").val();
				$("#riqi").change();
			});
		});
		
		
		window.setInterval(function(){
			if(riqiZv!=$("#riqi").val()){
				$("#riqi").change();
				riqiZv = $("#riqi").val();
			}
		},1000); 
		
		//****************************************************值班信息
		
		//****************************************************获取未读邮件数量，获取邮箱单点登录链接
		$("#emailNewCount").click(function(){
			$.post("${gzUrl('oagl/index/emailNewcount.do')}",function(j){
				if(j&&j.NewCount){
					$("#newCountValue").text(j.NewCount);
					return;
				}
			},"json");
		});
		
		setTimeout(function(){
			$("#emailNewCount").click();//在页面停留2秒钟后进行获取未读邮件数
		},2000);
		var flag = true;
		var loadToMailUtl = function(){
			if(flag){
			flag = false;
			$.post("${gzUrl('oagl/index/emailLoginUrl.do')}",function(j){
				if(j){
					if(j!="###"){
						 var AtoMail = $("a[name=AtoMail]");
						 AtoMail.attr("target","_blank");
						 AtoMail.attr("href",j);
					}else{
						//获取链接出现异常，可能是网络延时，可能是账号不存在
						//console.log("获取链接出现异常，可能是网络延时，可能是账号不存在!");
					}
					flag=true;
				}
			 });
			}
		};
		loadToMailUtl();//加载邮件访问地址
		$("tr.noticeEO:even").css("background","#E4E4E4");
		//****************************************************获取未读邮件数量，获取邮箱单点登录链接
		var applyTableTds = $("#applyTable tbody tr td").clone();
		if(applyTableTds.length==0){
			applyTableTds.remove();
		}else{
			$("#applyTable tbody").html("");
			var tr;
			applyTableTds.each(function(i,o){
				if(i%2==0){
					tr = $("<tr style='height:35px;'></tr>");
				}else{
					$(this).css("border-left","0px");
				}
				tr.append(this);
				if(i%2!=0){
					$("#applyTable tbody").append(tr);
				}
			});
			if(applyTableTds.length%2!=0){
				$("#applyTable tbody").append(tr);
			}
		}
	});
</script>
<#include "../../foot.ftl" />