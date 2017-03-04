package com.disease_control.web.action.xtsz.sjzd;

import java.util.HashMap;

import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.DataSupplierCertificateTypeService;
import com.disease_control.web.form.DataSupplierCertificateType;
import com.disease_control.web.form.DataSupplierType;
import com.yakov.utils.JsonUtil;
/**
 * 供应商证书类别
 * @author 
 *
 */
public class DataSupplierCertificateTypeAction extends BaseAction<DataSupplierCertificateType>{
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
		DataSupplierCertificateType dataSupplierCertificateType = getForm();
		Page page = dataSupplierCertificateTypeService.list(dataSupplierCertificateType.getPageIndex(), dataSupplierCertificateType.getPageSize());
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
		DataSupplierCertificateType dataSupplierCertificateType = getForm();
		int resultInt=dataSupplierCertificateTypeService.add_Tx(dataSupplierCertificateType);
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
		DataSupplierCertificateType dataSupplierCertificateType = getForm();
		request.setAttribute("dataSupplierCertificateType", dataSupplierCertificateTypeService.get(dataSupplierCertificateType.getId()));
		return SUCCESS;
	}

	/**
	 * 修改
	 * 
	 * @return
	 */
	public String update() {
		initRequest();
		DataSupplierCertificateType dataSupplierCertificateType = getForm();
		int resultInt=dataSupplierCertificateTypeService.update_Tx(dataSupplierCertificateType); 
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

	private DataSupplierCertificateTypeService dataSupplierCertificateTypeService;

	public void setDataSupplierCertificateTypeService(DataSupplierCertificateTypeService dataSupplierCertificateTypeService) {
		this.dataSupplierCertificateTypeService = dataSupplierCertificateTypeService;
	}

}
