package com.disease_control.web.action.dzgzd.gzdgl.gzdpc;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.PayrollBatchService;
import com.disease_control.service.PayrollTableInfoService;
import com.disease_control.web.form.PayrollBatch;
import com.yakov.utils.JsonUtil;

public class PayrollBatchAction extends BaseAction<PayrollBatch> {

	public String initList() {
		initRequest();
		request.setAttribute("payrollTableInfoList",payrollTableInfoService.list());
		return SUCCESS;
	}

	public void list() {
		initRequest();
		PayrollBatch payrollBatch = getForm();
		Page page = payrollBatchService.list(payrollBatch.getPageIndex(), payrollBatch.getPageSize(),payrollBatch.getTableId(),payrollBatch.getStartTime(),payrollBatch.getEndTime());
		ArrayList<Map> resultList = (ArrayList<Map>) page.getResult();
		for (Map result : resultList) {
			result.put("action", result.get("id"));
		}
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	public String initAdd() {
		initRequest();
		request.setAttribute("payrollTableInfoList", payrollTableInfoService.list());
		return SUCCESS;
	}

	public String add() {
		initRequest();
		PayrollBatch payrollBatch = getForm();
		if (payrollBatchService.add_Tx(payrollBatch) == 1) {
			return SUCCESS;
		}
		return ERROR;
	}

	public String info() {
		initRequest();
		PayrollBatch payrollBatch = getForm();
		request.setAttribute("payrollBatch", payrollBatchService.info(payrollBatch.getId()));
		return SUCCESS;
	}

	public void release() {
		initRequest();
		PayrollBatch payrollBatch = getForm();
		payrollBatchService.release_Tx(payrollBatch.getId());
		getPrintWriter().println(1);
	}
	
	
	public String del() {
		initRequest();
		PayrollBatch payrollBatch = getForm();
		if(payrollBatchService.del_Tx(payrollBatch.getId())<=0){
			return ERROR;
		}
		return SUCCESS;
	}

	public String initUpdate() {
		return SUCCESS;
	}

	public String update() {
		return SUCCESS;
	}

	private PayrollBatchService payrollBatchService;
	private PayrollTableInfoService payrollTableInfoService;

	public void setPayrollBatchService(PayrollBatchService payrollBatchService) {
		this.payrollBatchService = payrollBatchService;
	}

	public void setPayrollTableInfoService(PayrollTableInfoService payrollTableInfoService) {
		this.payrollTableInfoService = payrollTableInfoService;
	}

}
