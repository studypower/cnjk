package com.disease_control.web.action.xtsz.sjzd;

import java.util.HashMap;

import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.DataFundsTypeService;
import com.disease_control.web.form.DataFundsType;
import com.yakov.utils.JsonUtil;

/**
 * 经费类别
 * 
 * @author
 * 
 */
public class DataFundsTypeAction extends BaseAction<DataFundsType> {
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
		DataFundsType fundsType = getForm();
		Page page = dataFundsTypeService.List(fundsType.getPageIndex(), fundsType.getPageSize());
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
		DataFundsType fundsType = getForm();
		int resultInt=dataFundsTypeService.add(fundsType);
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
		DataFundsType fundsType = getForm();
		request.setAttribute("fundsType", dataFundsTypeService.get(fundsType.getId()));
		return SUCCESS;
	}

	/**
	 * 修改
	 * 
	 * @return
	 */
	public String update() {
		initRequest();
		DataFundsType fundsType = getForm();
		int resultInt=dataFundsTypeService.update(fundsType);
		if (resultInt== 0) {
			request.setAttribute("result", 0);
			return ERROR;
		}
		if (resultInt==-1) {
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
		DataFundsType fundsType = getForm();
		dataFundsTypeService.updateStatus(fundsType.getId(), fundsType.getStatus());
		return SUCCESS;
	}

	private DataFundsTypeService dataFundsTypeService;

	public void setDataFundsTypeService(DataFundsTypeService dataFundsTypeService) {
		this.dataFundsTypeService = dataFundsTypeService;
	}

}
