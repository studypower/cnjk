package com.disease_control.web.action.xtsz.sjzd;

import java.util.HashMap;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.core.status.BaseForm;
import com.disease_control.service.DataCarUseTimeService;
import com.disease_control.web.form.DataCarUseTime;
import com.yakov.utils.JsonUtil;

public class DataCarUseTimeAction extends BaseAction<DataCarUseTime> {

	public String initList() {
		initRequest();
		return SUCCESS;
	}

	public void list() {
		initRequest();
		DataCarUseTime dataCarUseTime = getForm();
		Page page = dataCarUseTimeService.list(dataCarUseTime.getPageIndex(), dataCarUseTime.getPageSize());
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	public String initUpdate() {
		initRequest();
		DataCarUseTime dataCarUseTime = getForm();
		Map dataCarUseTimeMap = dataCarUseTimeService.info(dataCarUseTime.getId());
		request.setAttribute("dataCarUseTime", dataCarUseTimeMap);
		return SUCCESS;
	}

	public String update() {
		initRequest();
		DataCarUseTime dataCarUseTime = getForm();
		if (dataCarUseTimeService.update(dataCarUseTime) <= 0) {
			return ERROR;
		}
		return SUCCESS;
	}

	private DataCarUseTimeService dataCarUseTimeService;

	public void setDataCarUseTimeService(DataCarUseTimeService dataCarUseTimeService) {
		this.dataCarUseTimeService = dataCarUseTimeService;
	}

}
