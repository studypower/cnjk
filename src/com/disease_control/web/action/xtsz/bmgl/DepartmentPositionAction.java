package com.disease_control.web.action.xtsz.bmgl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.DepartmentInfoService;
import com.disease_control.service.DepartmentPositionService;
import com.disease_control.service.PositionInfoService;
import com.disease_control.web.form.DepartmentPosition;
import com.yakov.utils.JsonUtil;

public class DepartmentPositionAction extends BaseAction<DepartmentPosition> {

	public String initList() {
		initRequest();
		DepartmentPosition departmentPosition = getForm();
		request.setAttribute("departmentId", departmentPosition.getDepartmentId());
		return SUCCESS;
	}

	public void list() {
		initRequest();
		DepartmentPosition departmentPosition = getForm();
		Page page = departmentPositionService.list(departmentPosition.getPageIndex(), departmentPosition.getPageSize(), departmentPosition.getDepartmentId(),departmentPosition.getName());
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	public String initAdd() {
		initRequest();
		DepartmentPosition departmentPosition = getForm();
		request.setAttribute("departmentInfo", departmentInfoService.get(departmentPosition.getDepartmentId()));
		request.setAttribute("positionInfoList", positionInfoService.list());
		request.setAttribute("departmentPositionList", departmentPositionService.list(departmentPosition.getDepartmentId()));
		return SUCCESS;
	}

	public String add() {
		initRequest();
		DepartmentPosition departmentPosition = getForm();
		if (departmentPositionService.add(departmentPosition) == 0) {
			return ERROR;
		}
		return SUCCESS;
	}

	public String initUpdate() {
		initRequest();
		DepartmentPosition departmentPosition = getForm();
		request.setAttribute("departmentPosition", departmentPositionService.get(departmentPosition.getId()));
		request.setAttribute("departmentInfo", departmentInfoService.get(departmentPosition.getDepartmentId()));
		request.setAttribute("positionInfoList", positionInfoService.list());
		request.setAttribute("departmentPositionList", departmentPositionService.list(departmentPosition.getDepartmentId()));
		return SUCCESS;
	}

	public String update() {
		initRequest();
		DepartmentPosition departmentPosition = getForm();
		if (departmentPositionService.update(departmentPosition) == 0) {
			return ERROR;
		}
		return SUCCESS;
	}

	public String del() {
		initRequest();
		DepartmentPosition departmentPosition = getForm();
		departmentPositionService.del(departmentPosition.getId());
		request.setAttribute("departmentId", departmentPosition.getDepartmentId());
		return SUCCESS;
	}

	private DepartmentPositionService departmentPositionService;
	private DepartmentInfoService departmentInfoService;
	private PositionInfoService positionInfoService;

	public void setDepartmentPositionService(DepartmentPositionService departmentPositionService) {
		this.departmentPositionService = departmentPositionService;
	}

	public void setDepartmentInfoService(DepartmentInfoService departmentInfoService) {
		this.departmentInfoService = departmentInfoService;
	}

	public void setPositionInfoService(PositionInfoService positionInfoService) {
		this.positionInfoService = positionInfoService;
	}

}
