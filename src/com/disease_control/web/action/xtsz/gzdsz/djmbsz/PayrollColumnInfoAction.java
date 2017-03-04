package com.disease_control.web.action.xtsz.gzdsz.djmbsz;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.disease_control.core.config.SystemConfig;
import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.PayrollColumnInfoService;
import com.disease_control.web.form.PayrollColumnInfo;
import com.yakov.utils.JsonUtil;

/**
 * 工资单模板特有字段设置类
 * 
 * @author YakovYu 2013-11-29 上午10:01:12
 * 
 */
public class PayrollColumnInfoAction extends BaseAction<PayrollColumnInfo> {

	public String initList() {
		return SUCCESS;
	}

	public void list() {
		initRequest();
		PayrollColumnInfo payrollColumnInfo = getForm();
		Page page = payrollColumnInfoService.list(payrollColumnInfo.getTableId(), payrollColumnInfo.getPageIndex(), payrollColumnInfo.getPageSize());
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	public String initAdd() {
		initRequest();
		request.setAttribute("dataColumnInfoList", SystemConfig.DATA_COLUMN_TYPES.values());
		return SUCCESS;
	}

	public String add() {
		initRequest();
		PayrollColumnInfo payrollColumnInfo = getForm();
		payrollColumnInfo.setSystem(0); // 可以删除
		payrollColumnInfo.setStatus(0); // 设置为未启用
		HashMap<String, String> dataColumnInfo = SystemConfig.DATA_COLUMN_TYPES.get(payrollColumnInfo.getColumnType());
		payrollColumnInfo.setColumnLength(Integer.parseInt(dataColumnInfo.get("length")));
		payrollColumnInfo.setCreateTime(new Date());
		if (payrollColumnInfoService.add_Tx(payrollColumnInfo) == 1) {
			return SUCCESS;
		}
		return ERROR;
	}

	public String delete() {
		initRequest();
		PayrollColumnInfo payrollColumnInfo = getForm();
		payrollColumnInfoService.delete_Tx(payrollColumnInfo.getId());
		return SUCCESS;
	}

	public String initUpdate() {
		initRequest();
		PayrollColumnInfo payrollColumnInfo = getForm();
		request.setAttribute("payrollColumnInfo", payrollColumnInfoService.info(payrollColumnInfo.getId()));
		return SUCCESS;
	}

	public String update() {
		initRequest();
		PayrollColumnInfo payrollColumnInfo = getForm();
		if (payrollColumnInfoService.update(payrollColumnInfo.getId(), payrollColumnInfo.getName(), payrollColumnInfo.getIndexNum(), payrollColumnInfo.getRemark()) == 1) {
			return SUCCESS;
		}
		return ERROR;
	}

	public String info() {
		initRequest();
		PayrollColumnInfo payrollColumnInfo = getForm();
		request.setAttribute("payrollColumnInfo", payrollColumnInfoService.info(payrollColumnInfo.getId()));
		return SUCCESS;
	}

	public String status() {
		initRequest();
		PayrollColumnInfo payrollColumnInfo = getForm();
		payrollColumnInfoService.status(payrollColumnInfo.getId(), payrollColumnInfo.getStatus());
		return SUCCESS;
	}

	private PayrollColumnInfoService payrollColumnInfoService;

	public void setPayrollColumnInfoService(PayrollColumnInfoService payrollColumnInfoService) {
		this.payrollColumnInfoService = payrollColumnInfoService;
	}

}
