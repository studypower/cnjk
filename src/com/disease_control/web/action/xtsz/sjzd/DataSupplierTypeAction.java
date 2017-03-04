package com.disease_control.web.action.xtsz.sjzd;

import java.util.HashMap;

import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.DataSupplierTypeService;
import com.disease_control.web.form.DataFundsType;
import com.disease_control.web.form.DataSupplierType;
import com.yakov.utils.JsonUtil;
/**
 * 供应商类别
 * @author 
 *
 */
public class DataSupplierTypeAction extends BaseAction<DataSupplierType> {
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
		DataSupplierType dataSupplierType = getForm();
		Page page = dataSupplierTypeService.list(dataSupplierType.getPageIndex(), dataSupplierType.getPageSize());
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
		DataSupplierType dataSupplierType = getForm();
		int resultInt=dataSupplierTypeService.add_Tx(dataSupplierType);
		if (resultInt== 0) {
			request.setAttribute("result",0);
			return ERROR;
		}
		if (resultInt==-1) {
			request.setAttribute("result",-1);
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
		DataSupplierType dataSupplierType=getForm();
		request.setAttribute("dataSupplierType", dataSupplierTypeService.get(dataSupplierType.getId()));
		return SUCCESS;
	}

	/**
	 * 修改
	 * 
	 * @return
	 */
	public String update() {
		initRequest();
		DataSupplierType dataSupplierType=getForm();
		int resultInt=dataSupplierTypeService.update_Tx(dataSupplierType);
		if (resultInt== 0) {
			request.setAttribute("result",0);
			return ERROR;
		}
		if (resultInt==-1) {
			request.setAttribute("result",-1);
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
		DataSupplierType dataSupplierType=getForm();
		dataSupplierTypeService.updateStatus_Tx(dataSupplierType.getId(), dataSupplierType.getStatus());
		return SUCCESS;
	}

	
	private DataSupplierTypeService dataSupplierTypeService;

	public void setDataSupplierTypeService(DataSupplierTypeService dataSupplierTypeService) {
		this.dataSupplierTypeService = dataSupplierTypeService;
	}

}
