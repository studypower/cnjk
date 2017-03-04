package com.disease_control.web.action.xtsz.sjzd;

import java.util.HashMap;

import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.DataDeviceService;
import com.disease_control.service.DataDeviceTypeService;
import com.disease_control.web.form.DataDevice;
import com.disease_control.web.form.DataDeviceType;
import com.yakov.utils.JsonUtil;

public class DataDeviceAction extends BaseAction<DataDevice> {

	public String initList() {
		return SUCCESS;
	}

	public void list() {
		initRequest();
		DataDevice dataDevice = getForm();
		Page page = dataDeviceService.list(dataDevice.getPageIndex(), dataDevice.getPageSize(), dataDevice.getTypeId(), dataDevice.getName());
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	public String initAdd() {
		initRequest();
		DataDevice dataDevice = getForm();
		request.setAttribute("dataDeviceType", dataDeviceTypeService.info(dataDevice.getTypeId()));
		return SUCCESS;
	}

	public String add() {
		initRequest();
		DataDevice dataDevice = getForm();
		if (dataDeviceService.add_Tx(dataDevice) == 1) {
			return SUCCESS;
		}
		return SUCCESS;
	}
	
	
	public String initUpdate() {
		initRequest();
		DataDevice dataDevice = getForm();
		request.setAttribute("dataDevice", dataDeviceService.info(dataDevice.getId()));
		return SUCCESS;
	}
	
	public String update(){
		initRequest();
		DataDevice dataDevice = getForm();
		if(dataDeviceService.update_Tx(dataDevice)<=0){
			return ERROR;
		}
		return SUCCESS;
	}
	
	public void ajaxList(){
		initRequest();
		DataDevice dataDevice = getForm();
		getPrintWriter().println(JsonUtil.listToJsonStr(dataDeviceService.list(dataDevice.getTypeId())));
	}

	private DataDeviceService dataDeviceService;
	private DataDeviceTypeService dataDeviceTypeService;

	public void setDataDeviceService(DataDeviceService dataDeviceService) {
		this.dataDeviceService = dataDeviceService;
	}

	public void setDataDeviceTypeService(DataDeviceTypeService dataDeviceTypeService) {
		this.dataDeviceTypeService = dataDeviceTypeService;
	}

}
