package com.disease_control.web.action.dzgzd.wdgzd;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.disease_control.core.config.SystemConfig;
import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.PayrollBatchService;
import com.disease_control.service.PayrollColumnInfoService;
import com.disease_control.service.PayrollEntryService;
import com.disease_control.service.PayrollTableInfoService;
import com.disease_control.web.form.PayrollEntry;
import com.yakov.utils.JsonUtil;

public class PayrollEntryAction extends BaseAction<PayrollEntry> {

	public String initList() {
		initRequest();
		PayrollEntry payrollEntry = getForm();
		request.setAttribute("payrollColumnInfoList", payrollColumnInfoService.list(0));
		request.setAttribute("payrollBatchList", payrollBatchService.list());
		return SUCCESS;
	}

	public void list() {
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		if (currentUser.get("staffId") != null) {
			PayrollEntry payrollEntry = getForm();
			Page page = payrollEntryService.listByStaff(Integer.parseInt(currentUser.get("staffId").toString()), payrollEntry.getPageIndex(), payrollEntry.getPageSize(), payrollEntry.getBatchId(),
					payrollEntry.getStartTime(), payrollEntry.getEndTime());
			HashMap jsonMap = new HashMap();
			jsonMap.put("total", page.getTotalPageCount());
			jsonMap.put("page", page.getCurrentPageNo());
			jsonMap.put("records", page.getTotalCount());
			jsonMap.put("rows", page.getResult());
			getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
		}
	}

	public String read() {
		initRequest();
		PayrollEntry payrollEntry = getForm();
		Map payrollEntryMap = payrollEntryService.info(payrollEntry.getId());
		Map payrollBatch = payrollBatchService.info(Integer.parseInt(payrollEntryMap.get("batch_id").toString()));
		request.setAttribute("payrollColumnInfoList", payrollColumnInfoService.list(Integer.parseInt(payrollBatch.get("table_id").toString())));
		request.setAttribute("payrollEntry", payrollEntryMap);
		request.setAttribute("payrollBatch", payrollBatch);
		payrollEntryService.read(payrollEntry.getId());
		return SUCCESS;
	}

	public String initListByTable() {
		initRequest();
		Map payrollTableInfo = null;
		PayrollEntry payrollEntry = getForm();
		if (payrollEntry.getPayrollBatch() != null && payrollEntry.getPayrollBatch().getTableId() != 0) {
			payrollTableInfo = payrollTableInfoService.info(payrollEntry.getPayrollBatch().getTableId());
		} else {
			List<Map> payrollTableInfoList = payrollTableInfoService.list();
			if (payrollTableInfoList.size() > 0) {
				payrollTableInfo = payrollTableInfoList.get(0);
			}
		}
		request.setAttribute("payrollTableInfoList", payrollTableInfoService.list());
		request.setAttribute("payrollTableInfo", payrollTableInfo);
		request.setAttribute("payrollColumnInfoList", payrollColumnInfoService.list(payrollTableInfo.get("id")));
		return SUCCESS;
	}

	public void listByTable() {
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		PayrollEntry payrollEntry = getForm();
		Page page = payrollEntryService.list(payrollEntry.getPayrollBatch().getTableId(), Integer.parseInt(currentUser.get("staffId").toString()), payrollEntry.getPageIndex(),
				payrollEntry.getPageSize(), payrollEntry.getStartTime(), payrollEntry.getEndTime());
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	private PayrollEntryService payrollEntryService;
	private PayrollColumnInfoService payrollColumnInfoService;
	private PayrollBatchService payrollBatchService;
	private PayrollTableInfoService payrollTableInfoService;

	public void setPayrollEntryService(PayrollEntryService payrollEntryService) {
		this.payrollEntryService = payrollEntryService;
	}

	public void setPayrollColumnInfoService(PayrollColumnInfoService payrollColumnInfoService) {
		this.payrollColumnInfoService = payrollColumnInfoService;
	}

	public void setPayrollBatchService(PayrollBatchService payrollBatchService) {
		this.payrollBatchService = payrollBatchService;
	}

	public void setPayrollTableInfoService(PayrollTableInfoService payrollTableInfoService) {
		this.payrollTableInfoService = payrollTableInfoService;
	}

}
