package com.disease_control.web.action;

import com.disease_control.core.status.BaseAction;

public class BasalAction extends BaseAction {

	public String index() {
		return SUCCESS;
	}

	public String top() {
		return SUCCESS;
	}

	public String bottom() {
		return SUCCESS;
	}

	public String main() {
		initRequest();
		return SUCCESS;
	}

	public String right() {
		return SUCCESS;
	}

	public String left() {
		initRequest();
		String ftlName = request.getParameter("ftlName");
		return ftlName;
	}

}
