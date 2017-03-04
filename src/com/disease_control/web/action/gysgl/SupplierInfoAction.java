package com.disease_control.web.action.gysgl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import jxl.Workbook;
import jxl.WorkbookSettings;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import com.disease_control.core.config.SystemConfig;
import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.DataSupplierTypeService;
import com.disease_control.service.PurchaseOrderService;
import com.disease_control.service.SupplierInfoService;
import com.disease_control.web.form.FundsApplyInfo;
import com.disease_control.web.form.SupplierInfo;
import com.yakov.utils.DateUtil;
import com.yakov.utils.FileUtil;
import com.yakov.utils.JsonUtil;
import com.yakov.utils.Random_Str;

public class SupplierInfoAction extends BaseAction<SupplierInfo> {

	public String initList() {
		initRequest();
		request.setAttribute("from", this.request.getParameter("from"));
		request.setAttribute("supplierTypeList", dataSupplierTypeService.list());
		return SUCCESS;
	}

	public void list() {
		initRequest();
		Date nowDate = new Date();
		SupplierInfo supplierInfo = getForm();
		Page page = supplierInfoService.list(supplierInfo.getPageIndex(), supplierInfo.getPageSize(), supplierInfo.getName(), supplierInfo.getType(), supplierInfo.getBusinessLicenseNum(),
				supplierInfo.getComplexLevel());
		List<Map> resultList = (List<Map>) page.getResult();
		for (Map result : resultList) {
			Date date = (Date) result.get("business_license_expiry_time");
			if (date != null) {
				if (nowDate.getTime() / 1000 > date.getTime() / 1000) {
					result.put("business_license_expiry_status", 2);
				} else if (nowDate.getTime() / 1000 > date.getTime() / 1000 - 30 * 24 * 60 * 60) {
					result.put("business_license_expiry_status", 1);
				}
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
		request.setAttribute("supplierTypeList", dataSupplierTypeService.list());
		return SUCCESS;
	}

	public String add() {
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		int staffId = Integer.parseInt(currentUser.get("staffId").toString());
		SupplierInfo supplierInfo = getForm();
		supplierInfo.setStaffId(staffId);
		if (supplierInfo.getFile() != null) {
			String fileUrl = "file" + SystemConfig.FILE_SEPARATOR + "gysgl" + SystemConfig.FILE_SEPARATOR + Random_Str.getrandom_str_int(5) + "_" + System.currentTimeMillis()
					+ supplierInfo.getFileFileName().substring(supplierInfo.getFileFileName().lastIndexOf("."));
			FileUtil.createFile(fileUrl, SystemConfig.SYS_URL, true);
			try {
				if (FileUtil.copyFile(supplierInfo.getFile(), SystemConfig.SYS_URL + fileUrl, true)) {
					supplierInfo.setBusinessLicenseFileUrl(fileUrl.replace(SystemConfig.SYS_URL, "/").replace(SystemConfig.FILE_SEPARATOR, "/"));
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if (supplierInfoService.add_Tx(supplierInfo) == 1) {
			return SUCCESS;
		}
		return ERROR;
	}

	public String initUpdate() {
		initRequest();
		SupplierInfo supplierInfo = getForm();
		request.setAttribute("supplierInfo", supplierInfoService.info(supplierInfo.getId()));
		request.setAttribute("supplierTypeList", dataSupplierTypeService.list());
		return SUCCESS;
	}

	public String update() {
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		int staffId = Integer.parseInt(currentUser.get("staffId").toString());
		SupplierInfo supplierInfo = getForm();
		supplierInfo.setStaffId(staffId);
		if (supplierInfo.getFile() != null) {
			String fileUrl = "file" + SystemConfig.FILE_SEPARATOR + "gysgl" + SystemConfig.FILE_SEPARATOR + Random_Str.getrandom_str_int(5) + "_" + System.currentTimeMillis()
					+ supplierInfo.getFileFileName().substring(supplierInfo.getFileFileName().lastIndexOf("."));
			FileUtil.createFile(fileUrl, SystemConfig.SYS_URL, true);
			try {
				if (FileUtil.copyFile(supplierInfo.getFile(), SystemConfig.SYS_URL + fileUrl, true)) {
					supplierInfo.setBusinessLicenseFileUrl(fileUrl.replace(SystemConfig.SYS_URL, "/").replace(SystemConfig.FILE_SEPARATOR, "/"));
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if (supplierInfoService.update_Tx(supplierInfo) == 1) {
			return SUCCESS;
		}
		return ERROR;
	}

	public String info() {
		initRequest();
		SupplierInfo supplierInfo = getForm();
		request.setAttribute("supplierInfo", supplierInfoService.info(supplierInfo.getId()));
		return SUCCESS;
	}

	/**
	 * 进入供应商采购查询
	 * 
	 * @return
	 */
	public String initListByOrder() {
		initRequest();
		SupplierInfo supplierInfo = getForm();
		request.setAttribute("supplierInfoList", supplierInfoService.list());
		return SUCCESS;
	}

	/**
	 * 供应商采购查询
	 * 
	 * @return
	 */
	public void listByOrder() {
		initRequest();
		SupplierInfo supplierInfo = getForm();
		Page page = purchaseOrderService.listByOrder(supplierInfo.getPageIndex(), supplierInfo.getPageSize(), supplierInfo.getId(), supplierInfo.getStartTime(), supplierInfo.getEndTime());
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	/**
	 * 导出
	 */
	public void exportData() {
		initRequest();
		SupplierInfo supplierInfo = getForm();
		List<Map> list = supplierInfoService.exportData(supplierInfo.getName(), supplierInfo.getType(), supplierInfo.getBusinessLicenseNum(), supplierInfo.getComplexLevel());
		String fileUrl = "file" + SystemConfig.FILE_SEPARATOR + "gysgl" + SystemConfig.FILE_SEPARATOR + "gysxx" + SystemConfig.FILE_SEPARATOR + Random_Str.getrandom_str_int(5) + "_"
				+ System.currentTimeMillis() + ".xls";
		FileUtil.createFile(fileUrl, SystemConfig.SYS_URL, true);
		try {
			WorkbookSettings ws = new WorkbookSettings();
			ws.setLocale(new Locale("ZH", "China"));
			WritableWorkbook workbook = Workbook.createWorkbook(new File(SystemConfig.SYS_URL + fileUrl), ws);
			WritableSheet s1 = workbook.createSheet("Sheet1", 0);
			Label lr = new Label(0, 0, "供应商信息列表");
			s1.addCell(lr);
			String title = "序号,供应商名称,营业执照编号,营业执照过期时间,类别,综合等级,最后年检时间,是否启用";
			String[] titleArray = title.split(",");
			for (int i = 0; i < titleArray.length; i++) {
				lr = new Label(i, 1, titleArray[i]);
				s1.addCell(lr);
			}
			for (int i = 2; i < list.size() + 2; i++) {
				if (i + 1 == list.size() + 2) {
					break;
				}
				lr = new Label(0, i, String.valueOf(i - 1));
				s1.addCell(lr);
				lr = new Label(1, i, String.valueOf(list.get(i - 2).get("name")));
				s1.addCell(lr);
				lr = new Label(2, i, String.valueOf(list.get(i - 2).get("business_license_num")));
				s1.addCell(lr);
				lr = new Label(3, i, String.valueOf(list.get(i - 2).get("business_license_expiry_time")));
				s1.addCell(lr);
				lr = new Label(4, i, String.valueOf(list.get(i - 2).get("type_name")));
				s1.addCell(lr);
				String labelValue5 = "优秀";
				if (list.get(i - 2).get("complex_level").equals(2)) {
					labelValue5 = "合格";
				} else if (list.get(i - 2).get("complex_level").equals(3)) {
					labelValue5 = "不合格";
				}
				lr = new Label(5, i, labelValue5);
				s1.addCell(lr);
				if (list.get(i - 2).get("last_inspection_time") != null) {
					lr = new Label(6, i, String.valueOf(list.get(i - 2).get("last_inspection_time")));
					s1.addCell(lr);
				}
				String labelValue7 = "启用";
				if (list.get(i - 2).get("status").equals(0)) {
					labelValue7 = "合格";
				}
				lr = new Label(7, i, labelValue7);
				s1.addCell(lr);
			}
			workbook.write();
			workbook.close();
		} catch (Exception e) {
			List resultList = new ArrayList();
			resultList.add(0);
			getPrintWriter().print(JsonUtil.listToJsonStr(resultList));
		} finally {
		}
		List resultList = new ArrayList();
		resultList.add(1);
		fileUrl = fileUrl.replace(SystemConfig.SYS_URL, "/").replace("\\", "/");
		resultList.add(fileUrl);
		getPrintWriter().print(JsonUtil.listToJsonStr(resultList));
	}

	private SupplierInfoService supplierInfoService;
	private DataSupplierTypeService dataSupplierTypeService;
	private PurchaseOrderService purchaseOrderService;

	public void setSupplierInfoService(SupplierInfoService supplierInfoService) {
		this.supplierInfoService = supplierInfoService;
	}

	public void setDataSupplierTypeService(DataSupplierTypeService dataSupplierTypeService) {
		this.dataSupplierTypeService = dataSupplierTypeService;
	}

	public void setPurchaseOrderService(PurchaseOrderService purchaseOrderService) {
		this.purchaseOrderService = purchaseOrderService;
	}

}
