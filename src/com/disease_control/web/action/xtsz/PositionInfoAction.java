package com.disease_control.web.action.xtsz;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.PositionInfoService;
import com.disease_control.web.form.PositionInfo;
import com.yakov.utils.JsonUtil;

public class PositionInfoAction extends BaseAction<PositionInfo> {
	/**
	 * 异步获取职位列表
	 */
	public void ajaxList() {
		initRequest();
		PositionInfo positionInfo = getForm();
		List positionList = positionInfoService.list(positionInfo.getDepartmentId());
		getPrintWriter().print(JsonUtil.listToJsonStr(positionList));
	}

	public String initList() {
		initRequest();
		return SUCCESS;
	}

	public void list() {
		initRequest();
		PositionInfo positionInfo = getForm();
		Page page = positionInfoService.list(positionInfo.getPageIndex(), positionInfo.getPageSize(), positionInfo.getName());
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	public String initAdd() {
		initRequest();
		return SUCCESS;
	}

	public String add() {
		initRequest();
		PositionInfo positionInfo = getForm();
		if (positionInfoService.add(positionInfo) == 0) {
			return ERROR;
		}
		return SUCCESS;
	}

	public String initUpdate() {
		initRequest();
		PositionInfo positionInfo = getForm();
		request.setAttribute("positionInfo", positionInfoService.get(positionInfo.getId()));
		return SUCCESS;
	}

	public String update() {
		initRequest();
		PositionInfo positionInfo = getForm();
		if (positionInfoService.update(positionInfo) == 0) {
			return ERROR;
		}
		return SUCCESS;
	}

	public String updateStatus() {
		initRequest();
		PositionInfo positionInfo = getForm();
		positionInfoService.updtestatus(positionInfo.getId(), positionInfo.getStatus());
		return SUCCESS;
	}

	public void del() {
		initRequest();
		PositionInfo positionInfo = getForm();
		positionInfoService.del(positionInfo.getId());
		getPrintWriter().println(1);
	}

	private PositionInfoService positionInfoService;

	public void setPositionInfoService(PositionInfoService positionInfoService) {
		this.positionInfoService = positionInfoService;
	}
}
