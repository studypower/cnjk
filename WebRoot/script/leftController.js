$(function() {
	var gController = null;// controller全局对象
	// 被排除掉的url不予显示左面菜单控制器
	var ruleOutContorllerUrl = {};
	ruleOutContorllerUrl[ctx + "/oagl/index/index.do"] = true;// 排除首页
	// 左面菜单的显示和隐藏
	function leftMenuDisplayController() {
		// 判断本页面是否为mainframe中显示的内容
		if (parent.frames["content"] && parent.frames["content"].location == location) {
			// 排除不予展示界面
			if (ruleOutContorllerUrl[location.pathname + location.search]) {
				return;// 结束函数
			}
			var innerHeight = parseInt($(parent).innerHeight());
			var top = innerHeight / 2 - 104;
			var scrollTop = document.body.scrollTop || document.documentElement.scrollTop;
			if (gController) {
				gController.css("top", (scrollTop + top) + "px");
			} else {
				// 1.创建悬浮箭头层
				var controller = $("<div>");
				gController = controller;
				controller.css("cursor", "pointer");
				controller.css("display", "block");
				controller.css("position", "absolute");// 固定absolute fixed
														// relative
				controller.css("overflow", "hidden");
				controller.css("margin-left", "-1px");
				controller.css("padding", "0px");
				controller.css("left", "0px");
				controller.css("top", (scrollTop + top) + "px");
				controller.css("z-index", "100000");
				var img = $("<img>");

				var img222 = ctx + "/images/left/222.png";
				var img333 = ctx + "/images/left/333.png";
				var img2222 = ctx + "/images/left/2222.png";
				var img3332 = ctx + "/images/left/3332.png";
				if (parent.document.getElementById('navigation').cols == "0,*") {
					img.attr("src", img222);
					$(parent.document.getElementById('navigation')).hide().css("width", "0px");
					$(".IFrameDiv",parent.document).css("width", "100%");
				} else {
					img.attr("src", img333);
					$(parent.document.getElementById('navigation')).show().css("width", "15%");
					$(".IFrameDiv",parent.document).css("width", "85%");
				}

				// 2.给悬浮箭头层填写控制事件
				controller.click(function() {
					if ($(parent.document.getElementById('navigation')).css("width") == "0px") {
						img.attr("src", img333);
						$(parent.document.getElementById('navigation')).show().css("width", "15%");
						$(".IFrameDiv",parent.document).css("width", "85%");
					} else {
						img.attr("src", img222);
						$(parent.document.getElementById('navigation')).hide().css("width", "0px");
						$(".IFrameDiv",parent.document).css("width", "100%");
					}
				});
				controller.append(img);
				$("body").append(controller);
				$(window).resize(leftMenuDisplayController);// 浏览器大小修改也同样自适应居中位置
				window.onscroll = leftMenuDisplayController;// 滚动条滚动时自适应
				img.mouseover(function() {
					if ($(parent.document.getElementById('navigation')).css("width") == "0px") {
						img.attr("src", img2222);
					} else {
						img.attr("src", img3332);
					}
				});
				img.mouseout(function() {
					if ($(parent.document.getElementById('navigation')).css("width") == "0px") {
						img.attr("src", img222);
					} else {
						img.attr("src", img333);
					}
				});
			}
		}
	}
	leftMenuDisplayController();
});