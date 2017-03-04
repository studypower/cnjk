package com.disease_control.web.action.xtsz.sjzd;

import java.util.HashMap;

import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.DataWorkStatusService;
import com.disease_control.web.form.DataWorkStatus;
import com.yakov.utils.JsonUtil;

public class DataWorkStatusAction extends BaseAction<DataWorkStatus> {

	public String initList() {
		return SUCCESS;
	}

	public void list() {
		initRequest();
		DataWorkStatus dataWorkStatus = getForm();
		Page page = dataWorkStatusService.list(dataWorkStatus.getPageIndex(), dataWorkStatus.getPageSize());
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	public String initAdd() {
		return SUCCESS;
	}

	public String add() {
		DataWorkStatus dataWorkStatus = getForm();
		dataWorkStatusService.save(dataWorkStatus);
		return SUCCESS;
	}

	public String initUpdate() {
		initRequest();
		DataWorkStatus dataWorkStatus = getForm();
		request.setAttribute("dataWorkStatus", dataWorkStatusService.info(dataWorkStatus.getId()));
		return SUCCESS;
	}

	public String update() {
		initRequest();
		DataWorkStatus dataWorkStatus = getForm();
		dataWorkStatusService.update(dataWorkStatus);
		return SUCCESS;
	}

	public void del() {
		initRequest();
		DataWorkStatus dataWorkStatus = getForm();
		dataWorkStatusService.del(dataWorkStatus.getId());
		getPrintWriter().println(1);
	}

	private DataWorkStatusService dataWorkStatusService;

	public void setDataWorkStatusService(DataWorkStatusService dataWorkStatusService) {
		this.dataWorkStatusService = dataWorkStatusService;
	}

}
