package com.disease_control.web.action.dzgzd.gzdtj;

import java.io.File;
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
import com.disease_control.service.DepartmentInfoService;
import com.disease_control.service.PayrollBatchService;
import com.disease_control.service.PayrollColumnInfoService;
import com.disease_control.service.PayrollEntryService;
import com.disease_control.service.PayrollTableInfoService;
import com.disease_control.service.PositionInfoService;
import com.disease_control.web.form.PayrollEntry;
import com.yakov.utils.FileUtil;
import com.yakov.utils.JsonUtil;
import com.yakov.utils.Random_Str;

public class PayrollEntryAction extends BaseAction<PayrollEntry> {

	public String initWageSum() {
		return SUCCESS;
	}

	public String wageSum() {
		initRequest();
		PayrollEntry payrollEntry = getForm();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		int staffId = (Integer) currentUser.get("staffId");
		Map wageSumMap = payrollEntryService.wageSum(staffId, payrollEntry.getStartTime(), payrollEntry.getEndTime());
		request.setAttribute("wageSumMap", wageSumMap);
		return SUCCESS;
	}

	public String initWageSumList() {
		initRequest();
		request.setAttribute("departmentInfoList", departmentInfoService.list());
		request.setAttribute("positionInfoList", positionInfoService.list());
		return SUCCESS;
	}

	public void wageSumList() {
		initRequest();
		PayrollEntry payrollEntry = getForm();
		if (payrollEntry.getStartTime() == null || payrollEntry.getEndTime() == null) {
			return;
		}
		Page page = payrollEntryService.wageSumList(payrollEntry.getPageIndex(), payrollEntry.getPageSize(), payrollEntry.getDepartmentId(), payrollEntry.getPositionId(), payrollEntry.getStartTime(),
				payrollEntry.getEndTime());
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	public void exportWageSumList() {
		initRequest();
		PayrollEntry payrollEntry = getForm();
		if (payrollEntry.getStartTime() == null || payrollEntry.getEndTime() == null) {
			return;
		}
		List<Map> list = payrollEntryService.wageSumList(payrollEntry.getDepartmentId(), payrollEntry.getPositionId(), payrollEntry.getStartTime(), payrollEntry.getEndTime());
		String fileUrl = "file" + SystemConfig.FILE_SEPARATOR + "dzgzd" + SystemConfig.FILE_SEPARATOR + "gzdzj" + SystemConfig.FILE_SEPARATOR + Random_Str.getrandom_str_int(5) + "_"
				+ System.currentTimeMillis() + ".xls";
		FileUtil.createFile(fileUrl, SystemConfig.SYS_URL, true);
		try {
			WorkbookSettings ws = new WorkbookSettings();
			ws.setLocale(new Locale("ZH", "China"));
			WritableWorkbook workbook = Workbook.createWorkbook(new File(SystemConfig.SYS_URL + fileUrl), ws);
			WritableSheet s1 = workbook.createSheet("Sheet1", 0);
			Label lr = null;
			String title = "姓名,科室,职位,5号工资总和,20日工资总和,20奖金总和,所有总和";
			String[] titleArray = title.split(",");
			for (int i = 0; i < titleArray.length; i++) {
				lr = new Label(i, 0, titleArray[i]);
				s1.addCell(lr);
			}
			for (int i = 1; i < list.size() + 1; i++) {
				lr = new Label(0, i, String.valueOf(list.get(i - 1).get("staff_name")));
				s1.addCell(lr);
				lr = new Label(1, i, String.valueOf(list.get(i - 1).get("department_name")));
				s1.addCell(lr);
				lr = new Label(2, i, String.valueOf(list.get(i - 1).get("position_name")));
				s1.addCell(lr);
				lr = new Label(3, i, String.valueOf(list.get(i - 1).get("wage_sum4")));
				s1.addCell(lr);
				lr = new Label(4, i, String.valueOf(list.get(i - 1).get("wage_sum5")));
				s1.addCell(lr);
				lr = new Label(5, i, String.valueOf(list.get(i - 1).get("wage_sum6")));
				s1.addCell(lr);
				lr = new Label(6, i, String.valueOf(list.get(i - 1).get("wage_sum")));
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

	public String initColumnSumList() {
		initRequest();
		initRequest();
		Map payrollTableInfo = null;
		PayrollEntry payrollEntry = getForm();
		if (payrollEntry.getPayrollBatch() != null && payrollEntry.getPayrollBatch().getTableId() != 0) {
			payrollTableInfo = payrollTableInfoService.info(payrollEntry.getPayrollBatch().getTableId());
		} else {
			List<Map> payrollTableInfoList = payrollTableInfoService.list();
			if (payrollTableInfoList.size() > 0) {
				payrollTableInfo = payrollTableInfoList.get(0);
			}
		}
		request.setAttribute("payrollTableInfoList", payrollTableInfoService.list());
		request.setAttribute("payrollTableInfo", payrollTableInfo);
		request.setAttribute("payrollColumnInfoList", payrollColumnInfoService.list(payrollTableInfo.get("id")));
		request.setAttribute("departmentInfoList", departmentInfoService.list());
		request.setAttribute("positionInfoList", positionInfoService.list());
		return SUCCESS;
	}

	public void columnSumList() {
		initRequest();
		PayrollEntry payrollEntry = getForm();
		if (payrollEntry.getStartTime() == null || payrollEntry.getEndTime() == null) {
			return;
		}
		Page page = payrollEntryService.columnSumList(payrollEntry.getPageIndex(), payrollEntry.getPageSize(), payrollEntry.getPayrollBatch().getTableId(), payrollEntry.getDepartmentId(),
				payrollEntry.getPositionId(), payrollEntry.getStartTime(), payrollEntry.getEndTime());
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	public void exportColumnSumList() {
		initRequest();
		PayrollEntry payrollEntry = getForm();
		if (payrollEntry.getStartTime() == null || payrollEntry.getEndTime() == null) {
			return;
		}
		List<Map> payrollColumnInfoList = payrollColumnInfoService.list(payrollEntry.getPayrollBatch().getTableId());
		List<Map> list = payrollEntryService.columnSumList(payrollEntry.getPayrollBatch().getTableId(), payrollEntry.getDepartmentId(), payrollEntry.getPositionId(), payrollEntry.getStartTime(),
				payrollEntry.getEndTime());
		String fileUrl = "file" + SystemConfig.FILE_SEPARATOR + "dzgzd" + SystemConfig.FILE_SEPARATOR + "gzdzj" + SystemConfig.FILE_SEPARATOR + Random_Str.getrandom_str_int(5) + "_"
				+ System.currentTimeMillis() + ".xls";
		FileUtil.createFile(fileUrl, SystemConfig.SYS_URL, true);
		try {
			WorkbookSettings ws = new WorkbookSettings();
			ws.setLocale(new Locale("ZH", "China"));
			WritableWorkbook workbook = Workbook.createWorkbook(new File(SystemConfig.SYS_URL + fileUrl), ws);
			WritableSheet s1 = workbook.createSheet("Sheet1", 0);
			Label lr = null;
			int column_index = 0;
			for (Map payrollColumnInfo : payrollColumnInfoList) {
				if (!payrollColumnInfo.get("column_name").equals("batch_id") && !payrollColumnInfo.get("column_name").equals("read_status") && !payrollColumnInfo.get("column_name").equals("staff_id")
						&& !payrollColumnInfo.get("column_name").equals("release_status") && !payrollColumnInfo.get("column_name").equals("bz") && !payrollColumnInfo.get("column_name").equals("id")) {
					lr = new Label(column_index, 0, (String) payrollColumnInfo.get("name"));
					s1.addCell(lr);
					column_index++;
				}
			}
			for (int i = 1; i < list.size() + 1; i++) {
				column_index = 0;
				for (Map payrollColumnInfo : payrollColumnInfoList) {
					if (!payrollColumnInfo.get("column_name").equals("batch_id") && !payrollColumnInfo.get("column_name").equals("read_status")
							&& !payrollColumnInfo.get("column_name").equals("staff_id") && !payrollColumnInfo.get("column_name").equals("release_status")
							&& !payrollColumnInfo.get("column_name").equals("bz") && !payrollColumnInfo.get("column_name").equals("id")) {
						lr = new Label(column_index, i, String.valueOf(list.get(i - 1).get(payrollColumnInfo.get("column_name"))));
						s1.addCell(lr);
						column_index++;
					}
				}
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

	private PayrollEntryService payrollEntryService;
	private DepartmentInfoService departmentInfoService;
	private PositionInfoService positionInfoService;
	private PayrollColumnInfoService payrollColumnInfoService;
	private PayrollBatchService payrollBatchService;
	private PayrollTableInfoService payrollTableInfoService;

	public void setPayrollColumnInfoService(PayrollColumnInfoService payrollColumnInfoService) {
		this.payrollColumnInfoService = payrollColumnInfoService;
	}

	public void setPayrollBatchService(PayrollBatchService payrollBatchService) {
		this.payrollBatchService = payrollBatchService;
	}

	public void setPayrollTableInfoService(PayrollTableInfoService payrollTableInfoService) {
		this.payrollTableInfoService = payrollTableInfoService;
	}

	public void setPayrollEntryService(PayrollEntryService payrollEntryService) {
		this.payrollEntryService = payrollEntryService;
	}

	public void setDepartmentInfoService(DepartmentInfoService departmentInfoService) {
		this.departmentInfoService = departmentInfoService;
	}

	public void setPositionInfoService(PositionInfoService positionInfoService) {
		this.positionInfoService = positionInfoService;
	}

}
