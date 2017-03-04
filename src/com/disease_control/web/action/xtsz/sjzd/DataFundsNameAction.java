package com.disease_control.web.action.xtsz.sjzd;

import java.util.HashMap;

import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.DataFundsNameService;
import com.disease_control.service.DataSupplierCertificateTypeService;
import com.disease_control.web.form.DataFundsName;
import com.disease_control.web.form.DataFundsType;
import com.disease_control.web.form.DataSupplierCertificateType;
import com.disease_control.web.form.DataSupplierType;
import com.yakov.utils.JsonUtil;

/**
 * 经费单名称
 * 
 * @author
 * 
 */
public class DataFundsNameAction extends BaseAction<DataFundsName> {
	/**
	 * 进入列表页
	 * 
	 * @return
	 */
	public String initList() {
		return SUCCESS;
	}

	/**
	 * 列表
	 */
	public void list() {
		initRequest();
		DataFundsName dataFundsName = getForm();
		Page page = dataFundsNameService.list(dataFundsName.getPageIndex(), dataFundsName.getPageSize());
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	/**
	 * 进入添加页
	 * 
	 * @return
	 */
	public String initAdd() {
		initRequest();
		return SUCCESS;
	}

	/**
	 * 添加
	 * 
	 * @return
	 */
	public String add() {
		initRequest();
		DataFundsName dataFundsName = getForm();
		int resultInt = dataFundsNameService.add_Tx(dataFundsName);
		if (resultInt == 0) {
			request.setAttribute("result", 0);
			return ERROR;
		}
		if (resultInt == -1) {
			request.setAttribute("result", -1);
			return ERROR;
		}
		return SUCCESS;
	}

	/**
	 * 进入修改页
	 * 
	 * @return
	 */
	public String initUpdate() {
		initRequest();
		DataFundsName dataFundsName = getForm();
		request.setAttribute("dataFundsName", dataFundsNameService.get(dataFundsName.getId()));
		return SUCCESS;
	}

	/**
	 * 修改
	 * 
	 * @return
	 */
	public String update() {
		initRequest();
		DataFundsName dataFundsName = getForm();
		int resultInt = dataFundsNameService.update_Tx(dataFundsName);
		if (resultInt == 0) {
			request.setAttribute("result", 0);
			return ERROR;
		}
		if (resultInt == -1) {
			request.setAttribute("result", -1);
			return ERROR;
		}
		return SUCCESS;
	}

	/**
	 * 状态修改
	 * 
	 * @return
	 */
	public String updateStatus() {
		initRequest();
		DataFundsName dataFundsName = getForm();
		dataFundsNameService.updateStatus(dataFundsName.getId(), dataFundsName.getStatus());
		return SUCCESS;
	}

	private DataFundsNameService dataFundsNameService;

	public void setDataFundsNameService(DataFundsNameService dataFundsNameService) {
		this.dataFundsNameService = dataFundsNameService;
	}

}
