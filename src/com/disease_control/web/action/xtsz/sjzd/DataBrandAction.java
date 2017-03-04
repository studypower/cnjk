package com.disease_control.web.action.xtsz.sjzd;

import java.util.HashMap;

import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.DataBrandService;
import com.disease_control.service.DataDeviceService;
import com.disease_control.web.form.DataBrand;
import com.disease_control.web.form.DataDevice;
import com.yakov.utils.JsonUtil;

public class DataBrandAction extends BaseAction<DataBrand> {

	public String initList() {
		return SUCCESS;
	}

	public void list() {
		initRequest();
		DataBrand dataBrand = getForm();
		Page page = dataBrandService.list(dataBrand.getPageIndex(), dataBrand.getPageSize(), dataBrand.getDeviceId(), dataBrand.getName());
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	public String initAdd() {
		initRequest();
		DataBrand dataBrand = getForm();
		request.setAttribute("dataDevice", dataDeviceService.info(dataBrand.getDeviceId()));
		return SUCCESS;
	}
	
	
	public String initUpdate() {
		initRequest();
		DataBrand dataBrand = getForm();
		request.setAttribute("dataBrand", dataBrandService.info(dataBrand.getId()));
		return SUCCESS;
	}
	
	public String update(){
		initRequest();
		DataBrand dataBrand = getForm();
		if(dataBrandService.update_Tx(dataBrand)<=0){
			return ERROR;
		}
		return SUCCESS;
	}

	public String add() {
		initRequest();
		DataBrand dataBrand = getForm();
		if (dataBrandService.add_Tx(dataBrand) == 1) {
			return SUCCESS;
		}
		return ERROR;
	}

	public void ajaxList() {
		initRequest();
		DataBrand dataBrand = getForm();
		getPrintWriter().println(JsonUtil.listToJsonStr(dataBrandService.list(dataBrand.getDeviceId())));
	}

	private DataBrandService dataBrandService;
	private DataDeviceService dataDeviceService;

	public void setDataBrandService(DataBrandService dataBrandService) {
		this.dataBrandService = dataBrandService;
	}

	public void setDataDeviceService(DataDeviceService dataDeviceService) {
		this.dataDeviceService = dataDeviceService;
	}

}
