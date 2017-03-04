package com.disease_control.web.action.oagl;

import java.util.HashMap;
import java.util.Map;

import com.disease_control.core.config.SystemConfig;
import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.core.status.BaseForm;
import com.disease_control.service.BaseMoneyService;
import com.yakov.utils.JsonUtil;

public class BaseMoneyAction extends BaseAction<BaseForm> {
	public String toList() {
		return "success";
	}

	public void list() {
		initRequest();
		BaseForm form = this.getForm();
		Page baseMoneyList = baseMoneyService.list(form.getPageIndex(), form.getPageSize());
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", baseMoneyList.getTotalPageCount());
		jsonMap.put("page", baseMoneyList.getCurrentPageNo());
		jsonMap.put("records", baseMoneyList.getTotalCount());
		jsonMap.put("rows", baseMoneyList.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	public void delete() {
		initRequest();
		String id = this.request.getParameter("id");
		baseMoneyService.delete(id);
		getPrintWriter().write("true");
	}

	public void saveOrUpdate() {
		initRequest();
		String id = this.request.getParameter("id");
		String startTime = this.request.getParameter("startTime");
		String endTime = this.request.getParameter("endTime");
		String baseMoney = this.request.getParameter("baseMoney");
		baseMoneyService.saveOrUpdate(id, startTime, endTime, baseMoney);
		getPrintWriter().write("true");
	}

	public void get() {
		initRequest();
		String id = this.request.getParameter("id");
		getPrintWriter().println(JsonUtil.ObjToJsonStr(baseMoneyService.get(id)));
	}

	private BaseMoneyService baseMoneyService;

	public void setBaseMoneyService(BaseMoneyService baseMoneyService) {
		this.baseMoneyService = baseMoneyService;
	}
}
