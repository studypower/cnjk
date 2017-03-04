<#include "../../head.ftl" />
<link href="${gzUrl('script/artDialog4.1.7/skins/blue.css')}" type="text/css" rel="stylesheet"/>
<script src="${gzUrl('script/My97DatePicker/WdatePicker.js')}"></script>
<script src="${gzUrl('script/artDialog4.1.7/jquery.artDialog.js')}" charset="utf-8"></script>
 <link href="${gzUrl('css/style.css')}" rel="stylesheet" type="text/css" />
 <link href="${gzUrl('css/bootstrap.css')}" rel="stylesheet" type="text/css" />
 <link href="${gzUrl('css/jquery.dataTables.css')}" rel="stylesheet" type="text/css" />
 <link href="${gzUrl('css/font-style.css')}" rel="stylesheet" type="text/css" />
</head>
	<style>
			* {
				font-family: '微软雅黑';
			}
			
			html,
			body {
				width: 100%;
				height: 100%;
			}
			
			body {
				margin: 0;
				overflow-x: hidden;
				overflow-y: scroll;
			}
			
			a:hover {
				text-decoration: none;
			}
			
			::-webkit-scrollbar {
				width: 8px;
				height: 8px;
			}
			
			::-webkit-scrollbar-thumb {
				background: #aaa;
				border-radius: 4px;
			}
			
			.app {
				padding-top: 76px;
				/*position: relative;*/
				width: 100%;
				height: auto;
				min-height: 100%;
			}
			
			.header {
				background: url(img/headerbg.jpg);
				position: fixed;
				top: 0px;
				width: 100%;
				margin: 0;
				z-index: 1050;
			}
			
			.logo {
				height: 70px;
				    padding: 20px 0 0 20px;
			}
			
			.header-line1 {
				position: fixed;
				top: 72px;
				z-index: 1050;
			}
			
			.header-line2 {
				position: fixed;
				top: 72px;
				right: 0;
				z-index: 1050;
			}
			
			.mark-number {
				height: 25px;
				width: 25px;
				position: absolute;
				color: white;
				font-size: 12px;
				font-family: "微软雅黑";
				text-align: center;
				padding-top: 5px;
				/* Firefox */
				-moz-border-radius: 50%;
				/* Safari 和 Chrome */
				-webkit-border-radius: 50%;
				border-radius: 50%;
				background-color: #C34211;
				top: -5px;
				left: 55%;
			}
			
			.mark-shadow1 {
				-webkit-box-shadow: 1px 2px 2px #9D4013;
				-moz-box-shadow: 1px 2px 2px #9D4013;
				box-shadow: 1px 2px 2px #9D4013;
			}
			
			.mark-shadow2 {
				-webkit-box-shadow: 1px 2px 2px #486A11;
				-moz-box-shadow: 1px 2px 2px #486A11;
				box-shadow: 1px 2px 2px #486A11;
			}
			
			.oa-onDuty {
				height: 250px;
				background-color: #5AC6C3;
				line-height: 43px;
			}
			
			.oa-onDuty .index2box-body1 {
				color: white;
			}
			
			.oa-onDuty .index2box-title {
				background-color: #5AC6C3;
			}
			
			.oa-onDuty .index2box-body1-btn1 {
				background-color: white;
				color: #626262!important;
				border: 1px solid #CDCDCD;
			}
			
			.oa-onDuty .index2box-body1-btn2 {
				color: #626262!important;
				border: 1px solid #CDCDCD!important;
			}
			
			.oa-notice .index2box-title {
				height: 55px;
				line-height: 55px;
				background-color: #E7F0F0;
			}
			
			.oa-notice .index2box-title>span {
				color: #343434;
				font-weight: initial;
			}
			
			.oa-notice .wentifankui-body>a {
				display: inline-block;
				height: 50px;
				line-height: 50px;
				border-bottom: 1px dashed #EDEDED;
				font-family: "微软雅黑";
				font-size: 14px;
			}
			.oa-notice .wentifankui-body>a:focus{
				text-decoration: none;
			}
		</style>
<body>
<script>
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

		<div class="col-xs-12" style="padding:20px 20px 0 20px">
				<div class="col-md-3 col-sm-4" style="padding:0 14px 0 0;">
					<div class="index2shadow" style="background-color: #E46D35;height: 210px;">
						<div class="col-xs-6 text-center" style="color: white;margin-top: 73px;">
							<span class="icon-gongwen" style="font-size: 68px;cursor: pointer;"></span>
							<div class="mark-number mark-shadow1" style="cursor: pointer;">15</div>
							<p style="padding-right: 5px;font-family: '微软雅黑';font-size: 12px;cursor: pointer;">公文</p>
						</div>
						<div class="col-xs-6 text-center" style="color: white;margin-top: 85px;">
							<span class="icon-shenqing" style="font-size: 40px;cursor: pointer;"></span>
							<div class="mark-number mark-shadow1" style="top: -17px;cursor: pointer;">15</div>
							<p style="padding:14px  7px 0 0px;font-family: '微软雅黑';font-size: 12px;cursor: pointer;">申请</p>
						</div>
					</div>
					<div class="index2shadow" style="height: 210px;background-color: #90CE30;">
						<div class="col-xs-12 text-center" style="padding:0 38px;color: white;margin-top: 73px;">
							<span class="icon-email" style="font-size: 50px;cursor: pointer;"></span>
							<div class="mark-number mark-shadow2" style="top: -13px;left: 57%;background-color: #578A03;cursor: pointer;">155</div>
							<p style="padding-top:18px;font-family: '微软雅黑';font-size: 12px;cursor: pointer;">收信</p>
						</div>
					</div>
					<div class="index2shadow oa-onDuty">
						<div class="index2box-title">
							<span>值班信息</span>
						</div>
						<div class="index2box-body1">
							<div class="col-xs-12" style="padding:0 5px;">
								<button class="btn index2box-body1-btn1">前一天</button>
								<button class="btn index2box-body1-btn1">今天</button>
								<button class="btn index2box-body1-btn1">明天</button>
								<button class="btn pull-right  index2box-body1-btn2">2017-1-6</button>
							</div>
						</div>
						<div class="index2box-body1">
							<div class="col-xs-6">
								<span style="position: absolute;margin-top:-2px;margin-left: 10px;">■</span><span style="padding-left: 25px;">上午</span>
							</div>
							<div class="col-xs-6">
								张某某
							</div>
						</div>
						<div class="index2box-body1">
							<div class="col-xs-6">
								<span style="position: absolute;margin-top:-2px;margin-left: 10px;">■</span><span style="padding-left: 25px;">上午</span>
							</div>
							<div class="col-xs-6">
								刘某某
							</div>
						</div>
						<div class="index2box-body1" style="border: none;">
							<div class="col-xs-6">
								<span style="position: absolute;margin-top:-2px;margin-left: 10px;">■</span><span style="padding-left: 25px;">晚上</span>
							</div>
							<div class="col-xs-6">
								王某某
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-9 col-sm-8 oa-notice" style="padding:0;">
					<div class="index2shadow" style="height: 700px;margin-bottom: 15px;color:#949494">
						<div class="index2box-title">
							<span>通知公告</span>
						</div>
						<div class="col-xs-12 wentifankui">
							<div class="wentifankui-body">
								<a href="#" class="col-xs-6">XXXXX，XXXXX，XXXXX，XXXXX。XXXX！</a>
								<div class="col-xs-3 text-center">发布人</div>
								<div class="col-xs-3 text-center">2017-1-6</div>
							</div>
							<div class="wentifankui-body">
								<a href="#" class="col-xs-6">XXXXX，XXXXX，XXXXX，XXXXX。XXXX！</a>
								<div class="col-xs-3 text-center">发布人</div>
								<div class="col-xs-3 text-center">2017-1-6</div>
							</div>
							<div class="wentifankui-body">
								<a href="#" class="col-xs-6">XXXXX，XXXXX，XXXXX，XXXXX。XXXX！</a>
								<div class="col-xs-3 text-center">发布人</div>
								<div class="col-xs-3 text-center">2017-1-6</div>
							</div>
							<div class="wentifankui-body">
								<a href="#" class="col-xs-6">XXXXX，XXXXX，XXXXX，XXXXX。XXXX！</a>
								<div class="col-xs-3 text-center">发布人</div>
								<div class="col-xs-3 text-center">2017-1-6</div>
							</div>
						</div>
						<button class="btn more-btn">更&nbsp&nbsp多</button>
					</div>
				</div>
			</div>
	</div>
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