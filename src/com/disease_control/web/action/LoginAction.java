package com.disease_control.web.action;

import java.util.HashMap;
import java.util.Map;

import com.disease_control.core.config.SystemConfig;
import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.MsgInfoService;
import com.disease_control.service.UserInfoService;
import com.disease_control.web.form.UserInfo;
import com.yakov.utils.JsonUtil;
import com.yakov.utils.Md5Util;

public class LoginAction extends BaseAction<UserInfo> {
	/**
	 * 进入登陆页面
	 * 
	 * @return
	 */
	public String initLogin() {
		initRequest();
		return "login";
	}

	/**
	 * 登陆
	 * 
	 * @return
	 */
	public String login() {
		initRequest();
		UserInfo userInfo = (UserInfo) getForm();
		if (userInfo.getName() == null || "".equals(userInfo.getName())) {
			request.setAttribute("msg", getText("login_error_0"));// 用户名不能为空
			return ERROR;
		}
		if (userInfo.getPwd() == null || "".equals(userInfo.getPwd())) {
			request.setAttribute("msg", getText("login_error_1"));// 密码不能为空
			return ERROR;
		}
		userInfo.setPwd(Md5Util.encrypt32(userInfo.getPwd()));
		Map userInfoMap = userInfoService.login(userInfo.getName(), userInfo.getPwd());
		if (userInfoMap == null) {
			request.setAttribute("msg", getText("login_error_2"));// 用户名或密码错误
			return ERROR;
		}
		session.setAttribute(SystemConfig.CURRENT_USER, userInfoMap);
		return SUCCESS;
	}

	public String logOut() {
		initRequest();
		Map userInfoMap = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		session.invalidate();
		userInfoService.logOut(userInfoMap);
		return SUCCESS;
	}

	public void loadMsgNum() {
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		int staffId = (Integer) currentUser.get("staffId");
		getPrintWriter().println(msgInfoService.countMsg(staffId));
	}

	public String initMsgList() {
		return SUCCESS;
	}

	public void msgList() {
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		int staffId = (Integer) currentUser.get("staffId");
		UserInfo userInfo = (UserInfo) getForm();
		Page page = msgInfoService.list(userInfo.getPageIndex(), userInfo.getPageSize(), staffId);
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	public void readMsg() {
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		int staffId = (Integer) currentUser.get("staffId");
		UserInfo userInfo = (UserInfo) getForm();
		msgInfoService.read(userInfo.getId(), staffId);
	}

	public void delMsg() {
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		int staffId = (Integer) currentUser.get("staffId");
		UserInfo userInfo = (UserInfo) getForm();
		msgInfoService.del(userInfo.getId());
	}

	public String msgInfo() {
		initRequest();
		UserInfo userInfo = (UserInfo) getForm();
		request.setAttribute("msgInfo", msgInfoService.info(userInfo.getId()));
		return SUCCESS;
	}

	private UserInfoService userInfoService;
	private MsgInfoService msgInfoService;

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}

	public void setMsgInfoService(MsgInfoService msgInfoService) {
		this.msgInfoService = msgInfoService;
	}

}
