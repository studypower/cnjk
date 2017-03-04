package com.disease_control.web.action.clgl;

import java.util.HashMap;

import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.CarInfoService;
import com.disease_control.web.form.CarInfo;
import com.yakov.utils.JsonUtil;

public class CarInfoAction extends BaseAction<CarInfo> {

	public String initList() {
		return SUCCESS;
	}

	public void list() {
		initRequest();
		CarInfo carInfo = getForm();
		Page page = carInfoService.list(carInfo.getPageIndex(), carInfo.getPageSize(), carInfo.getBrandName(), carInfo.getIdNum(), carInfo.getStatus(), carInfo.getStartTime(), carInfo.getEndTime());
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
		CarInfo carInfo = getForm();
		if (carInfoService.add_Tx(carInfo) != 1) {
			return ERROR;
		}
		return SUCCESS;
	}

	public String info() {
		initRequest();
		CarInfo carInfo = getForm();
		request.setAttribute("carInfo", carInfoService.get(carInfo.getId()));
		return SUCCESS;
	}

	public String initUpdate() {
		initRequest();
		CarInfo carInfo = getForm();
		request.setAttribute("carInfo", carInfoService.get(carInfo.getId()));
		return SUCCESS;
	}

	public String update() {
		initRequest();
		CarInfo carInfo = getForm();
		if (carInfoService.update_Tx(carInfo) != 1) {
			return ERROR;
		}
		return SUCCESS;
	}

	public String delete() {
		initRequest();
		CarInfo carInfo = getForm();
		carInfoService.delete(carInfo.getId());
		return SUCCESS;
	}

	private CarInfoService carInfoService;

	public void setCarInfoService(CarInfoService carInfoService) {
		this.carInfoService = carInfoService;
	}

}
