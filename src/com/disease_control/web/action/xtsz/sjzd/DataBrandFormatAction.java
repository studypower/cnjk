package com.disease_control.web.action.xtsz.sjzd;

import java.util.HashMap;

import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.DataBrandFormatService;
import com.disease_control.service.DataBrandService;
import com.disease_control.web.form.DataBrand;
import com.disease_control.web.form.DataBrandFormat;
import com.yakov.utils.JsonUtil;

public class DataBrandFormatAction extends BaseAction<DataBrandFormat> {

	public String initList() {
		return SUCCESS;
	}

	public void list() {
		initRequest();
		DataBrandFormat dataBrandFormat = getForm();
		Page page = dataBrandFormatService.list(dataBrandFormat.getPageIndex(), dataBrandFormat.getPageSize(), dataBrandFormat.getBrandId(), dataBrandFormat.getName());
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	public String initAdd() {
		initRequest();
		DataBrandFormat dataBrandFormat = getForm();
		request.setAttribute("dataBrand", dataBrandService.info(dataBrandFormat.getBrandId()));
		return SUCCESS;
	}

	public String add() {
		initRequest();
		DataBrandFormat dataBrandFormat = getForm();
		if (dataBrandFormatService.add_Tx(dataBrandFormat) == 1) {
			return SUCCESS;
		}
		return ERROR;
	}
	
	public String initUpdate() {
		initRequest();
		DataBrandFormat dataBrandFormat = getForm();
		request.setAttribute("dataBrandFormat", dataBrandFormatService.get(dataBrandFormat.getId()));
		return SUCCESS;
	}
	
	public String update(){
		initRequest();
		DataBrandFormat dataBrandFormat = getForm();
		if(dataBrandFormatService.update_Tx(dataBrandFormat)<=0){
			return ERROR;
		}
		return SUCCESS;
	}

	public void ajaxList() {
		initRequest();
		DataBrandFormat dataBrandFormat = getForm();
		getPrintWriter().println(JsonUtil.listToJsonStr(dataBrandFormatService.list(dataBrandFormat.getBrandId())));
	}

	private DataBrandFormatService dataBrandFormatService;
	private DataBrandService dataBrandService;

	public void setDataBrandFormatService(DataBrandFormatService dataBrandFormatService) {
		this.dataBrandFormatService = dataBrandFormatService;
	}

	public void setDataBrandService(DataBrandService dataBrandService) {
		this.dataBrandService = dataBrandService;
	}

}
