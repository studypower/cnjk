package com.disease_control.web.action.jfgl;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
import com.disease_control.service.DataDeviceTypeService;
import com.disease_control.service.DataFundsNameService;
import com.disease_control.service.DataFundsTypeService;
import com.disease_control.service.DepartmentInfoService;
import com.disease_control.service.FundsApplyInfoService;
import com.disease_control.service.StaffInfoService;
import com.disease_control.web.form.DataFileInfo;
import com.disease_control.web.form.FundsApplyInfo;
import com.disease_control.web.form.FundsApplyStockEntry;
import com.yakov.utils.FileUtil;
import com.yakov.utils.JsonUtil;
import com.yakov.utils.PhotoUtil;
import com.yakov.utils.Random_Str;

/**
 * 经费管理
 * 
 * @author
 * 
 */
public class FundsApplyInfoAction extends BaseAction<FundsApplyInfo> {

	/**
	 * 进入列表页
	 * 
	 * @return
	 */
	public String initSearch() {
		initRequest();
		FundsApplyInfo fundsApplyInfo = getForm();
		request.setAttribute("dataFundsTypeList", dataFundsTypeService.list());
		request.setAttribute("departmentList", departmentInfoService.list());
		request.setAttribute("fundsNameList", dataFundsNameService.list());
		Calendar cal = Calendar.getInstance();
		cal.set(new Date().getYear() + 1900, 0, 1);
		request.setAttribute("curYear0101", new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime()));// 设置默认值为当前年的一月一日
		return SUCCESS;
	}

	/**
	 * 列表
	 */
	public void search() {
		initRequest();
		FundsApplyInfo fundsApplyInfo = getForm();
		Page page = fundsApplyInfoService.search(fundsApplyInfo.getPageIndex(), fundsApplyInfo.getPageSize(), fundsApplyInfo.getStep(), fundsApplyInfo.getStatus(), fundsApplyInfo.getName(),
				fundsApplyInfo.getTypeName(), fundsApplyInfo.getNum(), fundsApplyInfo.getStartMoney(), fundsApplyInfo.getEndMoney(), fundsApplyInfo.getApplyStaffId(),
				fundsApplyInfo.getApplyDepartmentId(), fundsApplyInfo.getStartTime(), fundsApplyInfo.getEndTime(), fundsApplyInfo.getSidx(), fundsApplyInfo.getSord());
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
		FundsApplyInfo fundsApplyInfo = getForm();
		List<Map> list = fundsApplyInfoService.exportDate(fundsApplyInfo.getStep(), fundsApplyInfo.getStatus(), fundsApplyInfo.getName(), fundsApplyInfo.getTypeName(), fundsApplyInfo.getNum(),
				fundsApplyInfo.getStartMoney(), fundsApplyInfo.getEndMoney(), fundsApplyInfo.getApplyDepartmentId(), fundsApplyInfo.getStartTime(), fundsApplyInfo.getEndTime());
		String fileUrl = "file" + SystemConfig.FILE_SEPARATOR + "jfgl" + SystemConfig.FILE_SEPARATOR + "jfcx" + SystemConfig.FILE_SEPARATOR + Random_Str.getrandom_str_int(5) + "_"
				+ System.currentTimeMillis() + ".xls";
		FileUtil.createFile(fileUrl, SystemConfig.SYS_URL, true);
		try {
			WorkbookSettings ws = new WorkbookSettings();
			ws.setLocale(new Locale("ZH", "China"));
			WritableWorkbook workbook = Workbook.createWorkbook(new File(SystemConfig.SYS_URL + fileUrl), ws);
			WritableSheet s1 = workbook.createSheet("Sheet1", 0);
			Label lr = new Label(0, 0, "经费列表");
			s1.addCell(lr);
			String title = "序号,经费单编号,申请单名称,经费类别,申请金额（元）,申请科室,经办人,申请时间,流程状态说明";
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
				lr = new Label(1, i, String.valueOf(list.get(i - 2).get("num")));
				s1.addCell(lr);
				lr = new Label(2, i, String.valueOf(list.get(i - 2).get("name")));
				s1.addCell(lr);
				lr = new Label(3, i, String.valueOf(list.get(i - 2).get("type_name")));
				s1.addCell(lr);
				lr = new Label(4, i, String.valueOf(list.get(i - 2).get("money")));
				s1.addCell(lr);
				lr = new Label(5, i, String.valueOf(list.get(i - 2).get("applyDepartmentName")));
				s1.addCell(lr);
				lr = new Label(6, i, String.valueOf(list.get(i - 2).get("applyStaffName")));
				s1.addCell(lr);
				lr = new Label(7, i, String.valueOf(list.get(i - 2).get("apply_time")));
				s1.addCell(lr);
				lr = new Label(8, i, String.valueOf(list.get(i - 2).get("status")));
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

	/**
	 * 进入列表页
	 * 
	 * @return
	 */
	public String initList() {
		initRequest();
		FundsApplyInfo fundsApplyInfo = getForm();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		int departmentId = Integer.parseInt(currentUser.get("departmentId").toString());
		request.setAttribute("dataFundsTypeList", dataFundsTypeService.list());
		request.setAttribute("step", fundsApplyInfo.getStep());
		request.setAttribute("departmentList", departmentInfoService.list());
		request.setAttribute("from", this.request.getParameter("from"));
		if (fundsApplyInfo.getStep() == 1) {
			request.setAttribute("staffInfoList", staffInfoService.list(departmentId));
		}
		request.setAttribute("fundsNameList", dataFundsNameService.list());
		// 默认开始时间为今年
		request.setAttribute("defStartTime", Calendar.getInstance().get(Calendar.YEAR) + "-01-01");
		return SUCCESS;
	}

	/**
	 * 列表
	 */
	public void list() {
		initRequest();
		FundsApplyInfo fundsApplyInfo = getForm();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		int staffId = Integer.parseInt(currentUser.get("staffId").toString());
		int departmentId = Integer.parseInt(currentUser.get("departmentId").toString());
		Page page = fundsApplyInfoService.list(fundsApplyInfo.getPageIndex(), fundsApplyInfo.getPageSize(), staffId, fundsApplyInfo.getStep(), departmentId, fundsApplyInfo.getName(),
				fundsApplyInfo.getTypeName(), fundsApplyInfo.getNum(), fundsApplyInfo.getMoney(), fundsApplyInfo.getApplyDepartmentId(), fundsApplyInfo.getApplyStaffId(),
				fundsApplyInfo.getStartTime(), fundsApplyInfo.getEndTime(), fundsApplyInfo.getStatus());
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
		request.setAttribute("dataFundsTypeList", dataFundsTypeService.list());
		request.setAttribute("dataDeviceTypeList", dataDeviceTypeService.list());
		request.setAttribute("fundsNameList", dataFundsNameService.list());
		return SUCCESS;
	}

	/**
	 * 添加
	 * 
	 * @return
	 */
	public String add() {
		initRequest();
		FundsApplyInfo fundsApplyInfo = getForm();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		fundsApplyInfo.setApplyStaffId(Integer.parseInt(currentUser.get("staffId").toString()));
		fundsApplyInfo.setApplyDepartmentId(Integer.parseInt(currentUser.get("departmentId").toString()));
		ArrayList<FundsApplyStockEntry> fundsApplyStockEntryList = new ArrayList();
		if (fundsApplyInfo.getDeviceName() != null) {
			for (int i = 0; i < fundsApplyInfo.getDeviceName().size(); i++) {
				FundsApplyStockEntry fundsApplyStockEntry = new FundsApplyStockEntry();
				fundsApplyStockEntry.setName(fundsApplyInfo.getDeviceName().get(i));
				fundsApplyStockEntry.setMoney(fundsApplyInfo.getDeviceMoney().get(i));
				fundsApplyStockEntry.setAmount(fundsApplyInfo.getDeviceAmount().get(i));
				fundsApplyStockEntry.setRemark(fundsApplyInfo.getDeviceRemark().get(i));
				fundsApplyStockEntryList.add(fundsApplyStockEntry);
			}
		}
		fundsApplyInfo.setFundsApplyStockEntryList(fundsApplyStockEntryList);
		fundsApplyInfo.setDataFileInfoList(new ArrayList<DataFileInfo>());
		if (fundsApplyInfo.getFile() != null) {
			for (int i = 0; i < fundsApplyInfo.getFile().size(); i++) {
				if (fundsApplyInfo.getFileFileName().get(i) != null) {
					String fileUrl = "file" + SystemConfig.FILE_SEPARATOR + "jfgl" + SystemConfig.FILE_SEPARATOR + Random_Str.getrandom_str_int(5) + "_" + System.currentTimeMillis()
							+ fundsApplyInfo.getFileFileName().get(i).substring(fundsApplyInfo.getFileFileName().get(i).lastIndexOf("."));
					FileUtil.createFile(fileUrl, SystemConfig.SYS_URL, true);
					try {
						if (FileUtil.copyFile(fundsApplyInfo.getFile().get(i), SystemConfig.SYS_URL + fileUrl, true)) {
							DataFileInfo dataFileInfo = new DataFileInfo();
							dataFileInfo.setTargetTable("funds_apply_info");
							dataFileInfo.setFileUrl(fileUrl.replace(SystemConfig.SYS_URL, "/").replace(SystemConfig.FILE_SEPARATOR, "/"));
							dataFileInfo.setFileName(fundsApplyInfo.getFileFileName().get(i));
							fundsApplyInfo.getDataFileInfoList().add(dataFileInfo);
						}
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		int resultInt = fundsApplyInfoService.add_Tx(fundsApplyInfo);
		if (resultInt == 0) {
			request.setAttribute("result", 0);
			return ERROR;
		} else if (resultInt == -1) {
			request.setAttribute("result", -1);
			return ERROR;
		}
		return SUCCESS;
	}

	/**
	 * 详情
	 * 
	 * @return
	 */
	public String info() {
		initRequest();
		FundsApplyInfo fundsApplyInfo = getForm();
		request.setAttribute("fundsApplyInfo", fundsApplyInfoService.info(fundsApplyInfo.getId()));
		return SUCCESS;
	}

	/**
	 * 进入修改页面
	 * 
	 * @return
	 */
	public String initUpdate() {
		initRequest();
		FundsApplyInfo fundsApplyInfo = getForm();
		request.setAttribute("step", fundsApplyInfo.getStep());
		request.setAttribute("dataFundsTypeList", dataFundsTypeService.list());
		request.setAttribute("dataDeviceTypeList", dataDeviceTypeService.list());
		request.setAttribute("fundsApplyInfo", fundsApplyInfoService.info(fundsApplyInfo.getId()));
		request.setAttribute("fundsNameList", dataFundsNameService.list());
		return SUCCESS;

	}

	public String update() {
		initRequest();
		FundsApplyInfo fundsApplyInfo = getForm();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		fundsApplyInfo.setApplyStaffId(Integer.parseInt(currentUser.get("staffId").toString()));
		fundsApplyInfo.setApplyDepartmentId(Integer.parseInt(currentUser.get("departmentId").toString()));
		ArrayList<FundsApplyStockEntry> fundsApplyStockEntryList = new ArrayList();
		if (fundsApplyInfo.getDeviceName() != null) {
			for (int i = 0; i < fundsApplyInfo.getDeviceName().size(); i++) {
				FundsApplyStockEntry fundsApplyStockEntry = new FundsApplyStockEntry();
				fundsApplyStockEntry.setName(fundsApplyInfo.getDeviceName().get(i));
				fundsApplyStockEntry.setMoney(fundsApplyInfo.getDeviceMoney().get(i));
				fundsApplyStockEntry.setAmount(fundsApplyInfo.getDeviceAmount().get(i));
				fundsApplyStockEntry.setRemark(fundsApplyInfo.getDeviceRemark().get(i));
				fundsApplyStockEntryList.add(fundsApplyStockEntry);
			}
		}
		fundsApplyInfo.setFundsApplyStockEntryList(fundsApplyStockEntryList);
		fundsApplyInfo.setDataFileInfoList(new ArrayList<DataFileInfo>());
		if (fundsApplyInfo.getFile() != null) {
			for (int i = 0; i < fundsApplyInfo.getFile().size(); i++) {
				if (fundsApplyInfo.getFileFileName().get(i) != null) {
					String fileUrl = "file" + SystemConfig.FILE_SEPARATOR + "jfgl" + SystemConfig.FILE_SEPARATOR + Random_Str.getrandom_str_int(5) + "_" + System.currentTimeMillis()
							+ fundsApplyInfo.getFileFileName().get(i).substring(fundsApplyInfo.getFileFileName().get(i).lastIndexOf("."));
					FileUtil.createFile(fileUrl, SystemConfig.SYS_URL, true);
					try {
						if (FileUtil.copyFile(fundsApplyInfo.getFile().get(i), SystemConfig.SYS_URL + fileUrl, true)) {
							DataFileInfo dataFileInfo = new DataFileInfo();
							dataFileInfo.setTargetTable("funds_apply_info");
							dataFileInfo.setFileUrl(fileUrl.replace(SystemConfig.SYS_URL, "/").replace(SystemConfig.FILE_SEPARATOR, "/"));
							dataFileInfo.setFileName(fundsApplyInfo.getFileFileName().get(i));
							fundsApplyInfo.getDataFileInfoList().add(dataFileInfo);
						}
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		if (fundsApplyInfo.getFileUrl() != null) {
			for (int i = 0; i < fundsApplyInfo.getFileUrl().size(); i++) {
				DataFileInfo dataFileInfo = new DataFileInfo();
				dataFileInfo.setTargetTable("funds_apply_info");
				dataFileInfo.setFileUrl(fundsApplyInfo.getFileUrl().get(i));
				dataFileInfo.setFileName(fundsApplyInfo.getFileName().get(i));
				fundsApplyInfo.getDataFileInfoList().add(dataFileInfo);
			}
		}
		int resultInt = fundsApplyInfoService.update_Tx(fundsApplyInfo);
		if (resultInt == 0) {
			request.setAttribute("result", 0);
			return ERROR;
		} else if (resultInt == -1) {
			request.setAttribute("result", -1);
			return ERROR;
		}
		return SUCCESS;
	}

	/**
	 * 进入审批页面
	 * 
	 * @return
	 */
	public String initApproval() {
		initRequest();
		FundsApplyInfo fundsApplyInfo = getForm();
		request.setAttribute("step", fundsApplyInfo.getStep());
		request.setAttribute("fundsApplyInfo", fundsApplyInfoService.info(fundsApplyInfo.getId()));
		request.setAttribute("dataFundsTypeList", dataFundsTypeService.list());
		request.setAttribute("dataDeviceTypeList", dataDeviceTypeService.list());
		request.setAttribute("fundsNameList", dataFundsNameService.list());
		return SUCCESS;
	}

	/**
	 * 审批
	 * 
	 * @return
	 */
	public String approval() {
		initRequest();
		FundsApplyInfo fundsApplyInfo = getForm();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		fundsApplyInfo.getFundsApproval().setApprovalStaffId(Integer.parseInt(currentUser.get("staffId").toString()));
		ArrayList<FundsApplyStockEntry> fundsApplyStockEntryList = new ArrayList();
		if (fundsApplyInfo.getDeviceName() != null) {
			for (int i = 0; i < fundsApplyInfo.getDeviceName().size(); i++) {
				FundsApplyStockEntry fundsApplyStockEntry = new FundsApplyStockEntry();
				fundsApplyStockEntry.setName(fundsApplyInfo.getDeviceName().get(i));
				fundsApplyStockEntry.setMoney(fundsApplyInfo.getDeviceMoney().get(i));
				fundsApplyStockEntry.setAmount(fundsApplyInfo.getDeviceAmount().get(i));
				fundsApplyStockEntry.setRemark(fundsApplyInfo.getDeviceRemark().get(i));
				fundsApplyStockEntryList.add(fundsApplyStockEntry);
			}
		}
		fundsApplyInfo.setFundsApplyStockEntryList(fundsApplyStockEntryList);
		fundsApplyInfo.setDataFileInfoList(new ArrayList<DataFileInfo>());
		if (fundsApplyInfo.getFile() != null) {
			for (int i = 0; i < fundsApplyInfo.getFile().size(); i++) {
				if (fundsApplyInfo.getFileFileName().get(i) != null) {
					String fileUrl = "file" + SystemConfig.FILE_SEPARATOR + "jfgl" + SystemConfig.FILE_SEPARATOR + Random_Str.getrandom_str_int(5) + "_" + System.currentTimeMillis()
							+ fundsApplyInfo.getFileFileName().get(i).substring(fundsApplyInfo.getFileFileName().get(i).lastIndexOf("."));
					FileUtil.createFile(fileUrl, SystemConfig.SYS_URL, true);
					try {
						if (FileUtil.copyFile(fundsApplyInfo.getFile().get(i), SystemConfig.SYS_URL + fileUrl, true)) {
							DataFileInfo dataFileInfo = new DataFileInfo();
							dataFileInfo.setTargetTable("funds_apply_info");
							dataFileInfo.setFileUrl(fileUrl.replace(SystemConfig.SYS_URL, "/").replace(SystemConfig.FILE_SEPARATOR, "/"));
							dataFileInfo.setFileName(fundsApplyInfo.getFileFileName().get(i));
							fundsApplyInfo.getDataFileInfoList().add(dataFileInfo);
						}
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		if (fundsApplyInfo.getFileUrl() != null) {
			for (int i = 0; i < fundsApplyInfo.getFileUrl().size(); i++) {
				DataFileInfo dataFileInfo = new DataFileInfo();
				dataFileInfo.setTargetTable("funds_apply_info");
				dataFileInfo.setFileUrl(fundsApplyInfo.getFileUrl().get(i));
				dataFileInfo.setFileName(fundsApplyInfo.getFileName().get(i));
				fundsApplyInfo.getDataFileInfoList().add(dataFileInfo);
			}
		}
		if (fundsApplyInfo.getFundsApproval().getApprovalFile() != null) {
			String fileUrl = "file" + SystemConfig.FILE_SEPARATOR + "jfgl" + SystemConfig.FILE_SEPARATOR + Random_Str.getrandom_str_int(5) + "_" + System.currentTimeMillis()
					+ fundsApplyInfo.getFundsApproval().getApprovalFileFileName().substring(fundsApplyInfo.getFundsApproval().getApprovalFileFileName().lastIndexOf("."));
			FileUtil.createFile(fileUrl, SystemConfig.SYS_URL, true);
			if (PhotoUtil.saveImg(fundsApplyInfo.getFundsApproval().getApprovalFile(), SystemConfig.SYS_URL + fileUrl)) {
				fundsApplyInfo.getFundsApproval().setFileUrl(fileUrl.replace(SystemConfig.SYS_URL, "/").replace(SystemConfig.FILE_SEPARATOR, "/"));
				fundsApplyInfo.getFundsApproval().setFileName(fundsApplyInfo.getFundsApproval().getApprovalFileFileName());
			}
		}
		int resultInt = fundsApplyInfoService.update_Tx(fundsApplyInfo, fundsApplyInfo.getFundsApproval());
		if (resultInt == 0) {
			request.setAttribute("result", 0);
			return ERROR;
		} else if (resultInt == -1) {
			request.setAttribute("result", -1);
			return ERROR;
		}
		return SUCCESS;
	}

	public void del() {
		initRequest();
		FundsApplyInfo fundsApplyInfo = getForm();
		fundsApplyInfoService.del(fundsApplyInfo.getId());
		getPrintWriter().println("<script>history.go(-1);</script>");
	}

	private FundsApplyInfoService fundsApplyInfoService;
	private DataFundsTypeService dataFundsTypeService;
	private DataDeviceTypeService dataDeviceTypeService;
	private DataFundsNameService dataFundsNameService;
	private DepartmentInfoService departmentInfoService;
	private StaffInfoService staffInfoService;

	public void setFundsApplyInfoService(FundsApplyInfoService fundsApplyInfoService) {
		this.fundsApplyInfoService = fundsApplyInfoService;
	}

	public void setDataFundsTypeService(DataFundsTypeService dataFundsTypeService) {
		this.dataFundsTypeService = dataFundsTypeService;
	}

	public void setDataDeviceTypeService(DataDeviceTypeService dataDeviceTypeService) {
		this.dataDeviceTypeService = dataDeviceTypeService;
	}

	public void setDataFundsNameService(DataFundsNameService dataFundsNameService) {
		this.dataFundsNameService = dataFundsNameService;
	}

	public void setDepartmentInfoService(DepartmentInfoService departmentInfoService) {
		this.departmentInfoService = departmentInfoService;
	}

	public void setStaffInfoService(StaffInfoService staffInfoService) {
		this.staffInfoService = staffInfoService;
	}

}
