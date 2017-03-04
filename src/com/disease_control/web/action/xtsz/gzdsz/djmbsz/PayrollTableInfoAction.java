package com.disease_control.web.action.xtsz.gzdsz.djmbsz;

import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.disease_control.core.config.SystemConfig;
import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.PayrollColumnInfoService;
import com.disease_control.service.PayrollTableInfoService;
import com.disease_control.web.form.PayrollColumnInfo;
import com.disease_control.web.form.PayrollTableInfo;
import com.yakov.utils.DateUtil;
import com.yakov.utils.FileUtil;
import com.yakov.utils.JsonUtil;
import com.yakov.utils.Random_Str;

/**
 * 工资单模板设置类，每个工资单都将包含基础字段，以及自身特有的字段
 * 
 * @author YakovYu 2013-11-29 上午10:01:20
 * 
 */
public class PayrollTableInfoAction extends BaseAction<PayrollTableInfo> {

	public String initList() {
		return SUCCESS;
	}

	public void list() {
		initRequest();
		PayrollTableInfo payrollTableInfo = getForm();
		Page page = payrollTableInfoService.list(payrollTableInfo.getPageIndex(), payrollTableInfo.getPageSize());
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
		PayrollTableInfo payrollTableInfo = getForm();
		payrollTableInfo.setTableName("payroll_entry_" + DateUtil.getNowTime());
		payrollTableInfo.setStatus(0); // 设置为未启用
		payrollTableInfo.setBuild(0);
		payrollTableInfo.setVersion(DateUtil.getNowTime());
		payrollTableInfo.setCreateTime(new Date());
		if (payrollTableInfoService.add_Tx(payrollTableInfo) == 1) {
			return SUCCESS;
		}
		return ERROR;
	}

	public String build() {
		initRequest();
		PayrollTableInfo payrollTableInfo = getForm();
		payrollTableInfoService.build_Tx(payrollTableInfo.getId());
		return SUCCESS;
	}

	public String status() {
		initRequest();
		PayrollTableInfo payrollTableInfo = getForm();
		payrollTableInfoService.status(payrollTableInfo.getId(), payrollTableInfo.getStatus());
		return SUCCESS;
	}

	public String initUpdate() {
		initRequest();
		PayrollTableInfo payrollTableInfo = getForm();
		request.setAttribute("payrollTableInfo", payrollTableInfoService.info(payrollTableInfo.getId()));
		return SUCCESS;
	}

	public String update() {
		initRequest();
		PayrollTableInfo payrollTableInfo = getForm();
		if (payrollTableInfoService.update_Tx(payrollTableInfo) == 1) {
			return SUCCESS;
		}
		return ERROR;
	}

	private PayrollTableInfoService payrollTableInfoService;

	public void setPayrollTableInfoService(PayrollTableInfoService payrollTableInfoService) {
		this.payrollTableInfoService = payrollTableInfoService;
	}

}
