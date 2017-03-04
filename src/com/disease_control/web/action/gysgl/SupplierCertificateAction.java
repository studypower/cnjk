package com.disease_control.web.action.gysgl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.disease_control.core.config.SystemConfig;
import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.DataSupplierCertificateTypeService;
import com.disease_control.service.SupplierCertificateService;
import com.disease_control.service.SupplierInfoService;
import com.disease_control.web.form.SupplierCertificate;
import com.yakov.utils.FileUtil;
import com.yakov.utils.JsonUtil;
import com.yakov.utils.PhotoUtil;
import com.yakov.utils.Random_Str;

public class SupplierCertificateAction extends BaseAction<SupplierCertificate> {

	public String initList() {
		initRequest();
		SupplierCertificate supplierCertificate = getForm();
		request.setAttribute("supplierInfo", supplierInfoService.info(supplierCertificate.getSupplierId()));
		return SUCCESS;
	}

	public void list() {
		initRequest();
		Date nowDate = new Date();
		SupplierCertificate supplierCertificate = getForm();
		Page page = supplierCertificateService.list(supplierCertificate.getSupplierId(), supplierCertificate.getPageIndex(), supplierCertificate.getPageSize());
		List<Map> resultList = (List<Map>) page.getResult();
		for (Map result : resultList) {
			Date date = (Date) result.get("expiry_time");
			if (nowDate.getTime() / 1000 > date.getTime() / 1000) {
				result.put("expiry_status", 2);
			} else if (nowDate.getTime() / 1000 > date.getTime() / 1000 - 30 * 24 * 60 * 60) {
				result.put("expiry_status", 1);
			}
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
		SupplierCertificate supplierCertificate = getForm();
		request.setAttribute("supplierInfo", supplierInfoService.info(supplierCertificate.getSupplierId()));
		request.setAttribute("dataSupplierCertificateTypeList", dataSupplierCertificateTypeService.list());
		return SUCCESS;
	}

	public String add() {
		initRequest();
		SupplierCertificate supplierCertificate = getForm();
		if (supplierCertificate.getFile1() != null) {
			String fileUrl = "file" + SystemConfig.FILE_SEPARATOR + "gysgl" + SystemConfig.FILE_SEPARATOR + Random_Str.getrandom_str_int(5) + "_" + System.currentTimeMillis()
					+ supplierCertificate.getFile1FileName().substring(supplierCertificate.getFile1FileName().lastIndexOf("."));
			FileUtil.createFile(fileUrl, SystemConfig.SYS_URL, true);
			if (PhotoUtil.saveImg(supplierCertificate.getFile1(), SystemConfig.SYS_URL + fileUrl)) {
				supplierCertificate.setFileUrl1(fileUrl.replace(SystemConfig.SYS_URL, "/").replace(SystemConfig.FILE_SEPARATOR, "/"));
			}
		}
		if (supplierCertificateService.add_Tx(supplierCertificate) == 0) {
			return ERROR;
		}
		return SUCCESS;
	}

	public String info() {
		initRequest();
		SupplierCertificate supplierCertificate = getForm();
		request.setAttribute("supplierCertificate", supplierCertificateService.info(supplierCertificate.getId()));
		return SUCCESS;
	}

	public String initUpdate() {
		initRequest();
		SupplierCertificate supplierCertificate = getForm();
		request.setAttribute("supplierCertificate", supplierCertificateService.info(supplierCertificate.getId()));
		request.setAttribute("dataSupplierCertificateTypeList", dataSupplierCertificateTypeService.list());
		return SUCCESS;
	}

	public String update() {
		initRequest();
		SupplierCertificate supplierCertificate = getForm();
		if (supplierCertificate.getFile1() != null) {
			String fileUrl = "file" + SystemConfig.FILE_SEPARATOR + "gysgl" + SystemConfig.FILE_SEPARATOR + Random_Str.getrandom_str_int(5) + "_" + System.currentTimeMillis()
					+ supplierCertificate.getFile1FileName().substring(supplierCertificate.getFile1FileName().lastIndexOf("."));
			FileUtil.createFile(fileUrl, SystemConfig.SYS_URL, true);
			if (PhotoUtil.saveImg(supplierCertificate.getFile1(), SystemConfig.SYS_URL + fileUrl)) {
				supplierCertificate.setFileUrl1(fileUrl.replace(SystemConfig.SYS_URL, "/").replace(SystemConfig.FILE_SEPARATOR, "/"));
			}
		}
		if (supplierCertificateService.update_Tx(supplierCertificate) == 0) {
			return ERROR;
		}
		return SUCCESS;
	}

	public String delete() {
		initRequest();
		SupplierCertificate supplierCertificate = getForm();
		supplierCertificateService.delete_Tx(supplierCertificate.getId());
		return SUCCESS;
	}

	private SupplierInfoService supplierInfoService;
	private SupplierCertificateService supplierCertificateService;
	private DataSupplierCertificateTypeService dataSupplierCertificateTypeService;

	public void setSupplierInfoService(SupplierInfoService supplierInfoService) {
		this.supplierInfoService = supplierInfoService;
	}

	public void setSupplierCertificateService(SupplierCertificateService supplierCertificateService) {
		this.supplierCertificateService = supplierCertificateService;
	}

	public void setDataSupplierCertificateTypeService(DataSupplierCertificateTypeService dataSupplierCertificateTypeService) {
		this.dataSupplierCertificateTypeService = dataSupplierCertificateTypeService;
	}

}
