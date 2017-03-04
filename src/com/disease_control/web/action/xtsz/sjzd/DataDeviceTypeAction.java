package com.disease_control.web.action.xtsz.sjzd;

import java.util.HashMap;

import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.DataDeviceTypeService;
import com.disease_control.web.form.DataBrandFormat;
import com.disease_control.web.form.DataDeviceType;
import com.yakov.utils.JsonUtil;

public class DataDeviceTypeAction extends BaseAction<DataDeviceType> {

	public String initList() {
		return SUCCESS;
	}

	public void list() {
		initRequest();
		DataDeviceType dataDeviceType = getForm();
		Page page = dataDeviceTypeService.list(dataDeviceType.getPageIndex(), dataDeviceType.getPageSize(), dataDeviceType.getName());
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
		initRequest();
		DataDeviceType dataDeviceType = getForm();
		if (dataDeviceTypeService.add_Tx(dataDeviceType) == 1) {
			return SUCCESS;
		}
		return ERROR;
	}
	
	public String initUpdate() {
		initRequest();
		DataDeviceType dataDeviceType = getForm();
		request.setAttribute("dataDeviceType", dataDeviceTypeService.info(dataDeviceType.getId()));
		return SUCCESS;
	}
	
	public String update(){
		initRequest();
		DataDeviceType dataDeviceType = getForm();
		if(dataDeviceTypeService.update_Tx(dataDeviceType)<=0){
			return ERROR;
		}
		return SUCCESS;
	}

	private DataDeviceTypeService dataDeviceTypeService;

	public void setDataDeviceTypeService(DataDeviceTypeService dataDeviceTypeService) {
		this.dataDeviceTypeService = dataDeviceTypeService;
	}

}
