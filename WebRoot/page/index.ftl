<#include "base_lib.ftl" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		 <meta name="renderer" content="webkit">
    	 <link href="${gzUrl('css/style.css')}" rel="stylesheet" type="text/css" />
    	 <link href="${gzUrl('css/bootstrap.css')}" rel="stylesheet" type="text/css" />
    	 <link href="${gzUrl('css/jquery.dataTables.css')}" rel="stylesheet" type="text/css" />
    	 <link href="${gzUrl('css/font-style.css')}" rel="stylesheet" type="text/css" />
    	 <script src="${gzUrl('script/jquery-1.9.1.js')}" type="text/javascript"></script>
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
				overflow-y: auto;
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
			
			.nav {
				width: 200px;
				float: left;
			}
			
			.center-header {
				height: 50px;
				line-height: 50px;
				background-color: #DAE1F4;
				font-size: 14px;
				padding: 0 30px;
			}
			
			.center-nav {
				position: fixed;
				top: 76px;
				bottom: 0px;
				left: 0px;
				width: 200px;
				background: url(img/navBg.jpg) no-repeat top left;
				overflow: hidden;
			}
			
			.center-navi {
				position: relative;
				width: 217px;
				height: 100%;
				overflow-x: hidden;
				overflow-y: scroll;
			}
			
			.center-navi>div {
				height: 90px;
				padding: 30px 0 0 15px;
			}
			
			.center-navi>div>img {
				height: 45px;
				width: 45px;
			}
			
			.center-navi>div>div {
				font-size: 12px;
				padding: 3px 0 0 10px;
				color: white;
			}
			
			.seach-btn {
				display: inline-block;
				height: 31px;
				width: 50px;
				background-color: #63B9D8;
				vertical-align: middle;
				margin-left: -5px;
				border: 2px solid #5EA0BA;
				border-left: none;
				color: white;
				font-size: 20px;
				padding: 1px 15px;
				cursor: pointer;
			}
			
			.seach-input {
				height: 31px;
				width: 340px;
				padding: 0 15px;
				border: 2px solid #5EA0BA;
				vertical-align: middle;
			}
			
			.seach-input:focus {
				border: 2px solid #5EA0BA!important;
				outline: none!important;
			}
			
			.operate-btn {
				color: white!important;
				font-weight: bold;
				padding: 6px 22px;
				letter-spacing: 2px;
			}
			
			.table-btn {
				padding: 0 5px;
				background-color: #72C4C7;
				color: white!important;
				font-size: 12px;
			}
			
			.nav-list>li {
				margin-bottom: 12px;
			}
			
			.nav-list>li>a>span {
				padding-right: 20px;
				font-size: 16px;
			}
			
			.nav-list>li>a {
				border-top: 1px solid #1C7EC9;
				border-bottom: 1px solid #1C7EC9;
				width: 100%;
				display: inline-block;
				padding: 5px 38px;
				text-decoration: none;
				font-size: 14px;
				color: white;
			}
			
			.nav-list>li>a:hover {
				background-color: #12466A;
				color: white!important;
			}
			
			.nav-active {
				border-bottom: none!important;
			}
			
			.nav-active>a {
				color: #0568E0!important;
				background-color: white;
				font-weight: bold;
			}
			
			.nav-children {
				margin-top: 10px;
				width: 225px;
				display: none;
			}
			
			.nav-children>li {
				padding: 5px 0 5px 70px;
				color: white;
				font-size: 12px;
				cursor: pointer;
			}
			
			.nav-children>li:hover {
				background-color: #12466A;
			}
			
			.nav-children>li>span {
				padding: 2px 5px;
			}
			
			.nav-children-active>span {
				background-color: white;
				color: #0568E0;
			}
			
			.menu-total {
				margin-left: 10px;
				font-size: 14px;
			}
			
			.menu-item {
				margin-top: 10px;
			}
			
			.menu-item label {
				font-weight: normal!important;
			}
			
			.paginate_button {
				padding: 0px!important;
			}
			
			#tableData_paginate {
				margin-top: 10px;
			}
			
			#menuPage a:hover {
				background: #F1F1F1!important;
				color: #000000!important;
				border: 1px solid #F1F1F1!important;
			}
			
			.current {
				border: 1px solid #DDDDDD!important;
			}
			
			.center {
				margin-left: 200px;
				height: 100%;
				overflow-y: hidden;
			}
			
			.center>div {
				float: left;
				width: 100%;
				padding-bottom: 50px;
				min-height: 500px;
			}
			
			.table>thead {
				height: 45px;
				background-color: #DAE1F4;
				border: 1px solid #CED2E4;
			}
			
			.table {
				border-bottom: 0px!important;
			}
			
			.table th {
				border-bottom: 0px!important;
			}
			
			[name="tableData_length"] {
				/*Chrome和Firefox里面的边框是不一样的，所以复写了一下*/
				border: 1px solid #DDDDDD;
				/*很关键：将默认的select选择框样式清除*/
				appearance: none;
				-moz-appearance: none;
				-webkit-appearance: none;
				/*在选择框的最右侧中间显示小箭头图片*/
				background: url("img/xiajiantou.png") no-repeat scroll right center transparent;
				background-position: 90% 50%;
				/*为下拉小箭头留出一点位置，避免被文字覆盖*/
				padding-right: 16px;
			}
			/*清除ie的默认选择框样式清除，隐藏下拉箭头*/
			
			[name="tableData_length"]::-ms-expand {
				display: none;
			}
			
			.footer {
				border-top: 1px solid #dee5e7;
				position: absolute;
				right: 0;
				bottom: 0;
				left: 0;
				margin-left: 200px;
				color: #58666e;
				background-color: #edf1f2;
				padding: 15px;
			}
			
			.logo {
				height: 70px
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
			.IFrameDiv{
			position: fixed;
			width:100%;
			height:100%;
			
			}
			
			.footer {
				border-top: 1px solid #dee5e7;
				position: absolute;
				right: 0;
				bottom: 0;
				left: 0;
				margin-left: 0px;
				color: #58666e;
				background-color: #edf1f2;
				padding: 15px;
				text-align:right;
			}
		</style>
		
	<body>
		<div class="app" id="main">
			<div class="col-xs-12 header">
				<div class="pull-left">
					<img src="img/logo2.png" class="logo">
				</div>
				<div class="pull-right">
					<a href="${gzUrl('oagl/index/index.do')}" target="content">
					<div class="indexbtn2 btn-active2">
						<span class="icon-shouye" style="padding:0px;font-size: 39px;"></span>
						<div>首页</div>
					</div>
					</a>
					<a href="${gzUrl('hysgl/sq/initCalendar.do')}"  target="content">
					<div class="indexbtn2">
						<span class="icon-huiyishi"></span>
						<div>会议室</div>
					</div>
					</a>
					<a href="${gzUrl('clgl/ycsq/initCalendar.do')}" target="content">
					<div class="indexbtn2">
						<span class="icon-cheliangshenqing" style="padding:4px;font-size: 31px;"></span>
						<div>车辆申请</div>
					</div>
					</a>
					<a href="${gzUrl('dzgzd/wdgzd/initList.do')}" target="content">
					<div class="indexbtn2">
						<span class="icon-icon_gongzidan" style="padding:4px;font-size: 31px;"></span>
						<div>工资单</div>
					</div>
					</a>
					<a href="about:_blank" id="kqgl_menu1" target="content">
					<div class="indexbtn2">
						<span class="icon-kaoqinzhiban" style="padding:4px;font-size: 31px;"></span>
						<div>考勤值班</div>
					</div>
					</a>
					<a href="${gzUrl('oagl/index/index.do')}" target="content">
					<div class="indexbtn2">
						<span class="icon-gongwen" style="padding:4px;font-size: 31px;"></span>
						<div>公文档案</div>
					</div>
					</a>
					<a href="${gzUrl('oagl/index/index.do')}" target="content">
					<div class="indexbtn2">
						<span class="icon-yunyingjiance" style="padding:0px;font-size: 39px;"></span>
						<div>投票管理</div>
					</div>
					</a>
					<a href="${gzUrl('xtsz/yhgl/initList.do')}" target="content">
					<div class="indexbtn2">
						<span class="icon-icon_notification" style="padding:0px;font-size: 39px;"></span>
						<div>通知公告</div>
					</div>
					</a>
					<a href="${gzUrl('xtsz/yhgl/initList.do')}" target="content">
					<div class="indexbtn2" style="margin-right: 70px;">
						<span class="icon-xitongguanli" style="padding:0px;font-size: 39px;"></span>
						<div>系统管理</div>
					</div>
					</a>
					<a href="${gzUrl('logOut.do')}"><div class="indexbtn2" style="margin-right: 30px;">
						<span class="glyphicon glyphicon-off" style="border: none;font-size: 31px;padding:5px"></span>
						<div>退出</div>
					</div>
					</a>
				</div>
			</div>

			<div class="col-xs-5 header-line1"></div>
			<div class="col-xs-7 header-line2"></div>
			
				<div class="nav" id="navigation">
				<div class="center-nav">
					<div class="center-navi">
						<div>
							<img class="pull-left" src="img/defUser.png" />
							<div class="pull-left">
								<p>欢迎您：admin</p>
								<p style="margin: 0;" id="nowDate"></p>
							</div>
						</div>
						<ul class="list-unstyled nav-list" id="hysgl">
							<li>
								<a href="#"><span class="glyphicon glyphicon-gift"></span>会议室申请</a>
								<ul class="list-unstyled nav-children">
									<li>● <span>发起申请</span></li>
									<li>● <span>申请记录</span></li>
								</ul>
							</li>
							<li>
								<a href="#"><span class="glyphicon glyphicon-calendar"></span>会议室管理</a>
							</li>
							<li>
								<a href="#"><span class="glyphicon glyphicon glyphicon-list-alt"></span>数据宇典设置</a>
								<ul class="list-unstyled nav-children">
									<li>● <span>会议室实用时间设置</span></li>
									<li>● <span>会议室设备设置</span></li>
								</ul>
							</li>
						</ul>
						<ul class="list-unstyled nav-list" id="clgl">
						 <#if isDisplay('1_1')>
							<li>
								<a href="#"><span class="glyphicon glyphicon-gift"></span>用车申请</a>
								<ul class="list-unstyled nav-children">
									<li>● <span>点击发起申请</span></li>
									<li>● <span>用车申请记录</span></li>
								</ul>
							</li>
							<li>
								<a href="#"><span class="glyphicon glyphicon-calendar"></span>车辆管理</a>
							</li>
							</#if>
						</ul>
						
						<ul class="list-unstyled nav-list" id="dzgzd">
							<li>
								<a href="javascript:void(0)"><span class="glyphicon glyphicon-gift"></span>用车申请</a>
								<ul class="list-unstyled nav-children">
								    <#if isDisplay('1_1_2')>
									<li><a href="${gzUrl('clgl/ycsq/initCalendar.do')}" target="content">● <span>点击发起申请</span></a></li>
									</#if>
									<li>● <span>用车申请记录</span></li>
								</ul>
							</li>
							<li>
								<a href="#"><span class="glyphicon glyphicon-calendar"></span>车辆管理</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
					<!--  MainFrame Body  菜单对应内容          start -->
					<div class="IFrameDiv" style="height:100%;">
						<iframe class="MainFrame" style="width:100%;height:100%;text-algin:center" id="content" name="content" frameborder="0" src=""></iframe>
					</div>
					<!--  MainFrame Body  菜单对应内容                              end        -->
             <div class="footer">
				上海长宁疾控中心办公OA 版本2.0.1
			</div>
		</div>
	</body>
	<script type="text/javascript">
	
	    $(".indexbtn2").on("click", function() {
	    $(".indexbtn2").removeClass("btn-active2");
		$(this).addClass("btn-active2");
		
		  //如果是首页
	       if($(this).children("div:first").text()=="首页"){
	         //改变宽度
			$("#navigation").css("display","none")
			$(".IFrameDiv").css("left","0px");
			$(".IFrameDiv").css("top","76px");
			$(".IFrameDiv").css("width","100%");
	       }else{
		    $("#navigation").css("display","block")
			$(".IFrameDiv").css("left","220px");
			$(".IFrameDiv").css("top","76px");
			
			//让子元素的第一个内容 居中	       
	       }
		    
		    
		   //不是首页 显示相应的菜单s
		});
		
		$(".oa-notice .wentifankui-body>a").on("click",function(){
			$(this).css("color","#949494")
		})
		
		
    	/**
    	*@liObj: TOP一级菜单对象
    	*@subMenuDiv: 子菜单DIV ID
    	*@flag:是否显示左侧子菜单,"0":不显示,"1":显示
    	*/
    	function menuChange(liObj,subMenuDiv,flag)
    	{
    		if(typeof(liObj)!='undefined')
    		{
    			if(typeof(flag)!='undefined')
    			{
    				if(flag=="0")
    				{
    					//改变宽度
    					$("#navigation").css("display","none")
    					$(".IFrameDiv").css("left","0px");
    					$(".IFrameDiv").css("top","76px");
    				}
    				else
    				{
    				    $("#navigation").css("display","block")
    					$(".IFrameDiv").css("left","220px");
    					$(".IFrameDiv").css("top","76px");
    				}
    			}
    		}
    	}
    	
    	
    	$(function(){
    		$("#content").attr("src","${gzUrl('oagl/index/index.do')}");//默认显示首页
    		$(".IFrameDiv").css("width","100%");
    		$("#navigation").css("display","none")
    		var kqgl_url = "about:_blank";
    		<#if isDisplay('10_4')>kqgl_url="${gzUrl('oagl/glgn/ztwh.do?my=true&forEdit=true&gotoType=leftMenu')}";</#if>
    		<#if isDisplay('10_5')>kqgl_url="${gzUrl('oagl/kqsy/kqsy.do')}";</#if>
    		$("#kqgl_menu1").attr("href",kqgl_url);
    	});
		
		
		$(".nav-list a").on("click", function(e) {
			if($(this).parent().hasClass("nav-active")) {
				$(this).parent().removeClass("nav-active");
				$(this).parent().find("ul").hide();
				return;
			}
			$(".nav-active").find("ul").hide();
			$(this).parent().addClass("nav-active").siblings().removeClass("nav-active");
			$(this).parent().find("ul").show();
		})

		$(".nav-children li").on("click", function() {
			$(".nav-children-active").removeClass("nav-children-active");
			$(this).addClass("nav-children-active");
		})
		
    </script>
	<script type="text/javascript">
		setTimeout(function(){
			$.get("${gzUrl('loadMsgNum.do')}?timestamp=" + Date.parse(new Date()), null, returnBack);
		    setTimeout(arguments.callee,10000);
		},100);
		
		function returnBack(data){
			var result = eval("("+data+")");
			$("#msgNum").html(result); 
	    }
	    <#if isDisplay('9_1')>
	    	//弹出考勤首页内容窗口
	    	open('${gzUrl('oagl/kqsy/kqsy.do')}','考勤首页','height=650,width=800,top=0,left=0,boolbar=no,location=no,status=no')
	    </#if>
	</script>
</html>


