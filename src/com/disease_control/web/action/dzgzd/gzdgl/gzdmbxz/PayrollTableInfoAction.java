package com.disease_control.web.action.dzgzd.gzdgl.gzdmbxz;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
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
import com.disease_control.service.PayrollTableInfoService;
import com.disease_control.service.StaffInfoService;
import com.disease_control.web.form.PayrollTableInfo;
import com.yakov.utils.FileUtil;
import com.yakov.utils.JsonUtil;
import com.yakov.utils.Random_Str;

public class PayrollTableInfoAction extends BaseAction<PayrollTableInfo> {

	public String initList() {
		initRequest();
		request.setAttribute("payrollTableInfoList", payrollTableInfoService.list());
		return SUCCESS;
	}

	public void list() {
		initRequest();
		PayrollTableInfo payrollTableInfo = getForm();
		Page page = payrollTableInfoService.list(1, payrollTableInfo.getPageIndex(), payrollTableInfo.getPageSize(), payrollTableInfo.getId());
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

	/**
	 * 下载模板
	 */
	public void export() {
		initRequest();
		PayrollTableInfo payrollTableInfo = getForm();
		Map payrollTableInfoMap = payrollTableInfoService.exportData(payrollTableInfo.getId());
		List<Map> staffList = staffInfoService.listByDzgzd();
		String fileUrl = "file" + SystemConfig.FILE_SEPARATOR + "xtsz" + SystemConfig.FILE_SEPARATOR + "gzdsz" + SystemConfig.FILE_SEPARATOR + "mb" + SystemConfig.FILE_SEPARATOR
				+ Random_Str.getrandom_str_int(5) + "_" + System.currentTimeMillis() + ".xls";
		FileUtil.createFile(fileUrl, SystemConfig.SYS_URL, true);
		try {
			WorkbookSettings ws = new WorkbookSettings();
			ws.setLocale(new Locale("ZH", "China"));
			WritableWorkbook workbook = Workbook.createWorkbook(new File(SystemConfig.SYS_URL + fileUrl), ws);
			WritableSheet s1 = workbook.createSheet("Sheet1", 0);
			Label lr = new Label(0, 0, "工资单模板版本号");
			s1.addCell(lr);
			lr = new Label(1, 0, String.valueOf(payrollTableInfoMap.get("version")));
			s1.addCell(lr);
			List<Map> payrollColumnList = (List) payrollTableInfoMap.get("payrollColumns");
			for (int i = 0; i < payrollColumnList.size(); i++) {
				lr = new Label(i, 1, String.valueOf(payrollColumnList.get(i).get("name")));
				s1.addCell(lr);
			}
			for (int i = 2; i < staffList.size() + 2; i++) {
				lr = new Label(0, i, String.valueOf(staffList.get(i - 2).get("id")));
				s1.addCell(lr);
				lr = new Label(1, i, String.valueOf(staffList.get(i - 2).get("name")));
				s1.addCell(lr);
			}
			workbook.write();
			workbook.close();
		} catch (Exception e) {
			e.printStackTrace();
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

	private PayrollTableInfoService payrollTableInfoService;
	private StaffInfoService staffInfoService;

	public void setPayrollTableInfoService(PayrollTableInfoService payrollTableInfoService) {
		this.payrollTableInfoService = payrollTableInfoService;
	}

	public void setStaffInfoService(StaffInfoService staffInfoService) {
		this.staffInfoService = staffInfoService;
	}

}
