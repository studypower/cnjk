package com.disease_control.core.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.StrutsStatics;

import com.disease_control.core.config.SystemConfig;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class AdminLimits implements Interceptor {

	private static Logger logger = Logger.getLogger(AdminLimits.class.getName());

	public void destroy() {

	}

	public void init() {

	}

	public String intercept(ActionInvocation invocation) throws Exception {
		HttpServletRequest request = (HttpServletRequest) invocation.getInvocationContext().get(StrutsStatics.HTTP_REQUEST);
		HttpSession session = request.getSession();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		if (currentUser.get("grade").equals(1)) {
			return invocation.invoke();
		}
		logger.info(currentUser.get("name") + ",该用户不是管理员,无法操作");
		return "illegalAccess";
	}

}
