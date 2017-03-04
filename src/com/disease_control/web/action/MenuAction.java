package com.disease_control.web.action;

import com.disease_control.core.status.BaseAction;

public class MenuAction extends BaseAction {

	public String left() {
		initRequest();
		String target = request.getParameter("target");
		return target;
	}

}
