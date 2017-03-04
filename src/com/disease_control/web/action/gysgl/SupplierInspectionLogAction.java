package com.disease_control.web.action.gysgl;

import java.util.HashMap;
import java.util.Map;

import com.disease_control.core.config.SystemConfig;
import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.SupplierInfoService;
import com.disease_control.service.SupplierInspectionLogService;
import com.disease_control.web.form.SupplierInspectionLog;
import com.yakov.utils.JsonUtil;

public class SupplierInspectionLogAction extends BaseAction<SupplierInspectionLog> {

	public String initList() {
		initRequest();
		request.setAttribute("supplierInfoList", supplierInfoService.list());
		return SUCCESS;
	}

	public void list() {
		initRequest();
		SupplierInspectionLog supplierInspectionLog = getForm();
		Page page = supplierInspectionLogService.list(supplierInspectionLog.getPageIndex(), supplierInspectionLog.getPageSize(), supplierInspectionLog.getSupplierId(),
				supplierInspectionLog.getStartTime(), supplierInspectionLog.getEndTime());
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	public String initAdd() {
		initRequest();
		request.setAttribute("supplierInfoList", supplierInfoService.list());
		return SUCCESS;
	}

	public String add() {
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		int staffId = Integer.parseInt(currentUser.get("staffId").toString());
		SupplierInspectionLog supplierInspectionLog = getForm();
		supplierInspectionLog.setStaffId(staffId);
		if (supplierInspectionLogService.add_Tx(supplierInspectionLog) == 1) {
			return SUCCESS;
		}
		return ERROR;
	}

	private SupplierInfoService supplierInfoService;
	private SupplierInspectionLogService supplierInspectionLogService;

	public void setSupplierInfoService(SupplierInfoService supplierInfoService) {
		this.supplierInfoService = supplierInfoService;
	}

	public void setSupplierInspectionLogService(SupplierInspectionLogService supplierInspectionLogService) {
		this.supplierInspectionLogService = supplierInspectionLogService;
	}

}
