package com.disease_control.core.interceptor;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.StrutsStatics;

import com.disease_control.core.config.SystemConfig;
import com.disease_control.service.MenuInfoService;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class AccessControlLimits implements Interceptor {

	private static Logger logger = Logger.getLogger(LoginLimits.class.getName());

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void init() {
		// TODO Auto-generated method stub

	}

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		HttpServletRequest request = (HttpServletRequest) invocation.getInvocationContext().get(StrutsStatics.HTTP_REQUEST);
		HttpSession session = request.getSession();
		Map userInfo = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		if (userInfo.get("grade").equals(1)) {
			return invocation.invoke();
		}
		String url = request.getRequestURI();
		String actionKey = menuInfoService.getKey(url);
		ArrayList<String> keyList = (ArrayList<String>) userInfo.get("keyList");
		if (keyList != null && keyList.contains(actionKey)) {
			return invocation.invoke();
		}
		return "illegalAccess";
	}

	private MenuInfoService menuInfoService;

	public static void setLogger(Logger logger) {
		AccessControlLimits.logger = logger;
	}

	public void setMenuInfoService(MenuInfoService menuInfoService) {
		this.menuInfoService = menuInfoService;
	}

}
