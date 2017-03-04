package com.disease_control.web.action.xtsz.sjzd;

import java.util.HashMap;

import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.DataUsePlaceService;
import com.disease_control.service.DepartmentInfoService;
import com.disease_control.web.form.DataUsePlace;
import com.yakov.utils.JsonUtil;

public class DataUsePlaceAction extends BaseAction<DataUsePlace> {

	public String initList() {
		return SUCCESS;
	}

	public void list() {
		initRequest();
		DataUsePlace dataUsePlace = getForm();
		Page page = dataUsePlaceService.list(dataUsePlace.getPageIndex(), dataUsePlace.getPageSize());
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	public String initAdd() {
		initRequest();
		request.setAttribute("departmentInfoList", departmentInfoService.list());
		return SUCCESS;
	}

	public String add() {
		initRequest();
		DataUsePlace dataUsePlace = getForm();
		if (dataUsePlaceService.add_Tx(dataUsePlace) == 1) {
			return SUCCESS;
		}
		return ERROR;
	}

	private DataUsePlaceService dataUsePlaceService;
	private DepartmentInfoService departmentInfoService;

	public void setDataUsePlaceService(DataUsePlaceService dataUsePlaceService) {
		this.dataUsePlaceService = dataUsePlaceService;
	}

	public void setDepartmentInfoService(DepartmentInfoService departmentInfoService) {
		this.departmentInfoService = departmentInfoService;
	}

}
