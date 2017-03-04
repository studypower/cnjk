package com.disease_control.web.action.wpcg;

import java.io.File;
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
import com.disease_control.service.DataDeviceTypeService;
import com.disease_control.service.FundsApplyInfoService;
import com.disease_control.service.PurchaseOrderService;
import com.disease_control.service.SupplierInfoService;
import com.disease_control.web.form.DataFileInfo;
import com.disease_control.web.form.DepotRkEntry;
import com.disease_control.web.form.PurchaseOrder;
import com.disease_control.web.form.PurchaseOrderEntry;
import com.disease_control.web.form.PurchaseOrderSupplier;
import com.yakov.utils.FileUtil;
import com.yakov.utils.JsonUtil;
import com.yakov.utils.Random_Str;

public class PurchaseOrderAction extends BaseAction<PurchaseOrder> {

	public String initList() {
		initRequest();
		PurchaseOrder purchaseOrder = getForm();
		if (purchaseOrder.getStep() == 5) {
			return "list5";
		} else if (purchaseOrder.getStep() == 6) {
			return "list6";
		}
		return SUCCESS;
	}

	public void list() {
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		PurchaseOrder purchaseOrder = getForm();
		Page page = purchaseOrderService.list(purchaseOrder.getFundsApplyNum(), purchaseOrder.getName(), purchaseOrder.getStep(), purchaseOrder.getStartTime(), purchaseOrder.getEndTime(),
				purchaseOrder.getPageIndex(), purchaseOrder.getPageSize(), purchaseOrder.getType(), purchaseOrder.getSidx(), purchaseOrder.getSord(), (Integer) currentUser.get("staffId"),
				(Integer) currentUser.get("departmentId"));
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	/**
	 * 进入已经申请过的供应商页面
	 * 
	 * @return
	 */
	public String initfundsApplyInfoList() {
		return SUCCESS;
	}

	/**
	 * 查出已通过申请的采购单
	 * 
	 * @return
	 */
	public void fundsApplyInfoList() {
		initRequest();
		PurchaseOrder purchaseOrder = getForm();
		Page page = fundsApplyInfoService.listByPurchase(purchaseOrder.getPageIndex(), purchaseOrder.getPageSize());
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	public String initAdd() {
		initRequest();
		PurchaseOrder purchaseOrder = getForm();
		Map fundsApplyInfo = fundsApplyInfoService.infoByWzcg(purchaseOrder.getFundsApplyId());
		request.setAttribute("fundsApplyInfo", fundsApplyInfo);
		request.setAttribute("stockEntryListJson", JsonUtil.listToJsonStr(fundsApplyInfo.get("stockEntryList")));
		request.setAttribute("supplierInfoList", supplierInfoService.list());
		return SUCCESS;
	}

	/**
	 * 新增采购单信息
	 * 
	 * @return
	 */
	public String add() {
		initRequest();
		PurchaseOrder purchaseOrder = getForm();
		purchaseOrder.setPurchaseOrderEntryList(new ArrayList<PurchaseOrderEntry>());
		if (purchaseOrder.getFundsApplyEntryId() != null) {
			for (int i = 0; i < purchaseOrder.getFundsApplyEntryId().size(); i++) {
				PurchaseOrderEntry purchaseOrderEntry = new PurchaseOrderEntry();
				purchaseOrderEntry.setFundsApplyEntryId(purchaseOrder.getFundsApplyEntryId().get(i));
				purchaseOrderEntry.setAmount(purchaseOrder.getAmount().get(i));
				if (purchaseOrderEntry.getAmount() != 0) {
					purchaseOrder.getPurchaseOrderEntryList().add(purchaseOrderEntry);
				}
			}
		}
		if (purchaseOrder.getType() == 3) {
			if (request.getParameter("isJc") != null && request.getParameter("isJc").equals("1")) {
				purchaseOrder.setStep(1);
				purchaseOrder.setStatus(0);
				purchaseOrder.setCgType(1); // 1-集采
			} else {
				purchaseOrder.setStep(1);
				purchaseOrder.setStatus(0);
				purchaseOrder.setSignSupplierId(0);
				purchaseOrder.setSignContractNum(null);
			}
		} else if (purchaseOrder.getType() == 2) {
			if (request.getParameter("isZc") != null && request.getParameter("isZc").equals("1")) {
				purchaseOrder.setStep(5);
				purchaseOrder.setStatus(0);
				purchaseOrder.setCgType(2); // 2-政采
			} else {
				purchaseOrder.setStep(1);
				purchaseOrder.setStatus(0);
			}
			purchaseOrder.setSignSupplierId(0);
			purchaseOrder.setSignContractNum(null);
		} else if (purchaseOrder.getType() == 0) {
			purchaseOrder.setStep(1);
			purchaseOrder.setStatus(0);
			purchaseOrder.setSignSupplierId(0);
			purchaseOrder.setSignContractNum(null);
		}
		if (purchaseOrderService.add_Tx(purchaseOrder) == 0) {
			return ERROR;
		}
		return SUCCESS;
	}

	public String initAddSupplier() {
		initRequest();
		PurchaseOrder purchaseOrder = getForm();
		Map purchaseOrderMap = purchaseOrderService.info(purchaseOrder.getId());
		request.setAttribute("purchaseOrder", purchaseOrderMap);
		if (purchaseOrderMap.get("purchaseOrderEntryList") != null) {
			request.setAttribute("purchaseOrderEntryList", JsonUtil.listToJsonStr(purchaseOrderMap.get("purchaseOrderEntryList")));
		}
		request.setAttribute("supplierInfoList", supplierInfoService.listByOrder());
		return SUCCESS;
	}

	/**
	 * 新增供应商信息
	 * 
	 * @return
	 */
	public String addSupplier() {
		initRequest();
		PurchaseOrder purchaseOrder = getForm();
		purchaseOrder.setPurchaseOrderSupplierList(new ArrayList<PurchaseOrderSupplier>());
		if (purchaseOrder.getSupplierId() != null) {
			for (int i = 0; i < purchaseOrder.getSupplierId().size(); i++) {
				if (purchaseOrder.getSupplierId().get(i) != 0) {
					PurchaseOrderSupplier purchaseOrderSupplier = new PurchaseOrderSupplier();
					purchaseOrderSupplier.setSupplierId(purchaseOrder.getSupplierId().get(i));
					purchaseOrderSupplier.setMoney(purchaseOrder.getSupplierMoney().get(i));
					purchaseOrderSupplier.setOrderId(purchaseOrder.getId());
					purchaseOrderSupplier.setStatus(purchaseOrder.getSupplierStatus().get(i));
					String fileUrl = "file" + SystemConfig.FILE_SEPARATOR + "wpcg" + SystemConfig.FILE_SEPARATOR + Random_Str.getrandom_str_int(5) + "_" + System.currentTimeMillis()
							+ purchaseOrder.getSupplierFileFileName().get(i).substring(purchaseOrder.getSupplierFileFileName().get(i).lastIndexOf("."));
					FileUtil.createFile(fileUrl, SystemConfig.SYS_URL, true);
					try {
						if (FileUtil.copyFile(purchaseOrder.getSupplierFile().get(i), SystemConfig.SYS_URL + fileUrl, true)) {
							purchaseOrderSupplier.setFileUrl(fileUrl.replace(SystemConfig.SYS_URL, "/").replace(SystemConfig.FILE_SEPARATOR, "/"));
						}
					} catch (IOException e) {
						e.printStackTrace();
					}
					purchaseOrder.getPurchaseOrderSupplierList().add(purchaseOrderSupplier);
				}
			}
		}
		if (purchaseOrderService.addSupplier_Tx(purchaseOrder) == 0) {
			return ERROR;
		}
		if (purchaseOrder.getType() == 3) {
			return "success1";
		}
		return SUCCESS;
	}

	public String initAddZczl() {
		initRequest();
		PurchaseOrder purchaseOrder = getForm();
		Map purchaseOrderMap = purchaseOrderService.info(purchaseOrder.getId());
		request.setAttribute("purchaseOrder", purchaseOrderMap);
		if (purchaseOrderMap.get("purchaseOrderEntryList") != null) {
			request.setAttribute("purchaseOrderEntryList", JsonUtil.listToJsonStr(purchaseOrderMap.get("purchaseOrderEntryList")));
		}
		request.setAttribute("supplierInfoList", supplierInfoService.listByOrder());
		return SUCCESS;
	}

	public String addZczl() {
		initRequest();
		PurchaseOrder purchaseOrder = getForm();
		purchaseOrder.setDataFileInfoList(new ArrayList<DataFileInfo>());
		if (purchaseOrder.getCgFile() != null) {
			for (int i = 0; i < purchaseOrder.getCgFile().size(); i++) {
				if (purchaseOrder.getCgFileFileName().get(i) != null) {
					String fileUrl = "file" + SystemConfig.FILE_SEPARATOR + "wpcg" + SystemConfig.FILE_SEPARATOR + "zczl" + SystemConfig.FILE_SEPARATOR + Random_Str.getrandom_str_int(5) + "_"
							+ System.currentTimeMillis() + purchaseOrder.getCgFileFileName().get(i).substring(purchaseOrder.getCgFileFileName().get(i).lastIndexOf("."));
					FileUtil.createFile(fileUrl, SystemConfig.SYS_URL, true);
					try {
						if (FileUtil.copyFile(purchaseOrder.getCgFile().get(i), SystemConfig.SYS_URL + fileUrl, true)) {
							DataFileInfo dataFileInfo = new DataFileInfo();
							dataFileInfo.setFileName(purchaseOrder.getCgFileFileName().get(i));
							dataFileInfo.setFileUrl(fileUrl.replace(SystemConfig.SYS_URL, "/").replace(SystemConfig.FILE_SEPARATOR, "/"));
							dataFileInfo.setTargetTable("wzcg_zczl");
							purchaseOrder.getDataFileInfoList().add(dataFileInfo);
						}
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		purchaseOrderService.addZczl_Tx(purchaseOrder);
		return SUCCESS;
	}

	public String initAudit() {
		initRequest();
		PurchaseOrder purchaseOrder = getForm();
		Map purchaseOrderMap = purchaseOrderService.info(purchaseOrder.getId());
		request.setAttribute("purchaseOrder", purchaseOrderMap);
		if (purchaseOrderMap.get("purchaseOrderEntryList") != null) {
			request.setAttribute("purchaseOrderEntryList", JsonUtil.listToJsonStr(purchaseOrderMap.get("purchaseOrderEntryList")));
		}
		if (purchaseOrderMap.get("purchaseOrderSupplierList") != null) {
			request.setAttribute("purchaseOrderSupplierList", JsonUtil.listToJsonStr(purchaseOrderMap.get("purchaseOrderSupplierList")));
		}
		return SUCCESS;
	}

	public String audit() {
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		int staffId = Integer.parseInt(currentUser.get("staffId").toString());
		PurchaseOrder purchaseOrder = getForm();
		purchaseOrder.getPurchaseOrderAudit().setOrderId(purchaseOrder.getId());
		purchaseOrder.getPurchaseOrderAudit().setAuditStaffId(staffId);
		purchaseOrderService.audit_Tx(purchaseOrder);
		return SUCCESS;
	}

	public String initAcceptance() {
		initRequest();
		PurchaseOrder purchaseOrder = getForm();
		Map purchaseOrderMap = purchaseOrderService.info(purchaseOrder.getId());
		request.setAttribute("purchaseOrder", purchaseOrderMap);
		if (purchaseOrderMap.get("purchaseOrderEntryList") != null) {
			request.setAttribute("purchaseOrderEntryList", JsonUtil.listToJsonStr(purchaseOrderMap.get("purchaseOrderEntryList")));
		}
		if (purchaseOrderMap.get("purchaseOrderSupplierList") != null) {
			request.setAttribute("purchaseOrderSupplierList", JsonUtil.listToJsonStr(purchaseOrderMap.get("purchaseOrderSupplierList")));
		}
		return SUCCESS;
	}

	public String acceptance() {
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		int staffId = Integer.parseInt(currentUser.get("staffId").toString());
		PurchaseOrder purchaseOrder = getForm();
		String ysFileUrl = "";
		if (purchaseOrder.getYsFileUrl() != null && !"".equals(purchaseOrder.getYsFileUrl())) {
			String ysFileUrlArray[] = purchaseOrder.getYsFileUrl().split(",");
			for (int i = 0; i < ysFileUrlArray.length; i++) {
				if (ysFileUrl != "") {
					if (i % 2 == 0) {
						ysFileUrl += "|";
						ysFileUrl += ysFileUrlArray[i];
					} else {
						ysFileUrl += "," + ysFileUrlArray[i];
					}
				} else {
					ysFileUrl += ysFileUrlArray[i];
				}

			}
		}
		if (purchaseOrder.getYsFile() != null) {
			for (int i = 0; i < purchaseOrder.getYsFile().size(); i++) {
				if (purchaseOrder.getYsFileFileName().get(i) != null) {
					String fileUrl = "file" + SystemConfig.FILE_SEPARATOR + "wpcg" + SystemConfig.FILE_SEPARATOR + "zcys" + SystemConfig.FILE_SEPARATOR + Random_Str.getrandom_str_int(5) + "_"
							+ System.currentTimeMillis() + purchaseOrder.getYsFileFileName().get(i).substring(purchaseOrder.getYsFileFileName().get(i).lastIndexOf("."));
					FileUtil.createFile(fileUrl, SystemConfig.SYS_URL, true);
					try {
						if (FileUtil.copyFile(purchaseOrder.getYsFile().get(i), SystemConfig.SYS_URL + fileUrl, true)) {
							if (ysFileUrl != "") {
								ysFileUrl += "|";
								ysFileUrl += purchaseOrder.getYsFileFileName().get(i);
								ysFileUrl += ",";
								ysFileUrl += fileUrl.replace(SystemConfig.SYS_URL, "/").replace(SystemConfig.FILE_SEPARATOR, "/");
							} else {
								ysFileUrl += purchaseOrder.getYsFileFileName().get(i);
								ysFileUrl += ",";
								ysFileUrl += fileUrl.replace(SystemConfig.SYS_URL, "/").replace(SystemConfig.FILE_SEPARATOR, "/");
							}
						}
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		purchaseOrder.setYsFileUrl(ysFileUrl.replaceAll(" ", ""));
		purchaseOrderService.acceptance_Tx(purchaseOrder, staffId);
		return SUCCESS;
	}

	public String initStorage() {
		initRequest();
		PurchaseOrder purchaseOrder = getForm();
		Map purchaseOrderMap = purchaseOrderService.info(purchaseOrder.getId());
		request.setAttribute("purchaseOrder", purchaseOrderMap);
		if (purchaseOrderMap.get("purchaseOrderEntryList") != null) {
			request.setAttribute("purchaseOrderEntryList", JsonUtil.listToJsonStr(purchaseOrderMap.get("purchaseOrderEntryList")));
		}
		if (purchaseOrderMap.get("purchaseOrderSupplierList") != null) {
			request.setAttribute("purchaseOrderSupplierList", JsonUtil.listToJsonStr(purchaseOrderMap.get("purchaseOrderSupplierList")));
		}
		request.setAttribute("dataDeviceTypeList", dataDeviceTypeService.list());
		return SUCCESS;
	}

	public String storage() {
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		int staffId = Integer.parseInt(currentUser.get("staffId").toString());
		PurchaseOrder purchaseOrder = getForm();
		ArrayList<DepotRkEntry> depotRkEntryList = new ArrayList();
		if (purchaseOrder.getDeviceTypeId() != null) {
			for (int i = 0; i < purchaseOrder.getDeviceTypeId().size(); i++) {
				DepotRkEntry depotRkEntry = new DepotRkEntry();
				depotRkEntry.setDeviceTypeId(purchaseOrder.getDeviceTypeId().get(i));
				depotRkEntry.setDeviceId(purchaseOrder.getDeviceId().get(i));
				depotRkEntry.setBrandId(purchaseOrder.getBrandId().get(i));
				depotRkEntry.setBrandFormatId(purchaseOrder.getBrandFormatId().get(i));
				depotRkEntry.setAmount(purchaseOrder.getAmount().get(i));
				depotRkEntry.setMoney(purchaseOrder.getMoney().get(i));
				depotRkEntryList.add(depotRkEntry);
			}
		}
		purchaseOrder.setDepotRkEntryList(depotRkEntryList);
		purchaseOrderService.storage_Tx(purchaseOrder, staffId);
		return SUCCESS;
	}

	public String info() {
		initRequest();
		PurchaseOrder purchaseOrder = getForm();
		Map purchaseOrderMap = purchaseOrderService.info(purchaseOrder.getId());
		request.setAttribute("purchaseOrder", purchaseOrderMap);
		if (purchaseOrderMap.get("purchaseOrderEntryList") != null) {
			request.setAttribute("purchaseOrderEntryList", JsonUtil.listToJsonStr(purchaseOrderMap.get("purchaseOrderEntryList")));
		}
		if (purchaseOrderMap.get("purchaseOrderSupplierList") != null) {
			request.setAttribute("purchaseOrderSupplierList", JsonUtil.listToJsonStr(purchaseOrderMap.get("purchaseOrderSupplierList")));
		}
		if (purchaseOrderMap.get("depotRkEntryList") != null) {
			request.setAttribute("depotRkEntryList", JsonUtil.listToJsonStr(purchaseOrderMap.get("depotRkEntryList")));
		}
		return SUCCESS;
	}

	public void delete() {
		initRequest();
		PurchaseOrder purchaseOrder = getForm();
		purchaseOrderService.delete_Tx(purchaseOrder.getId());
		getPrintWriter().println(1);
	}

	/**
	 * 导出
	 */
	public void exportData() {
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		PurchaseOrder purchaseOrder = getForm();
		List<Map> list = purchaseOrderService.exportDate(purchaseOrder.getFundsApplyNum(), purchaseOrder.getName(), purchaseOrder.getStep(), purchaseOrder.getStartTime(), purchaseOrder.getEndTime(),
				purchaseOrder.getType(), (Integer) currentUser.get("departmentId"));
		String fileUrl = "file" + SystemConfig.FILE_SEPARATOR + "wpcg" + SystemConfig.FILE_SEPARATOR + "cgcx" + SystemConfig.FILE_SEPARATOR + Random_Str.getrandom_str_int(5) + "_"
				+ System.currentTimeMillis() + ".xls";
		FileUtil.createFile(fileUrl, SystemConfig.SYS_URL, true);
		try {
			WorkbookSettings ws = new WorkbookSettings();
			ws.setLocale(new Locale("ZH", "China"));
			WritableWorkbook workbook = Workbook.createWorkbook(new File(SystemConfig.SYS_URL + fileUrl), ws);
			WritableSheet s1 = workbook.createSheet("Sheet1", 0);
			Label lr = new Label(0, 0, "列表");
			s1.addCell(lr);
			String title = "序号,采购单编号,经费单编号,经费单金额,采购类别,采购申请时间,当前流程";
			String[] titleArray = title.split(",");
			for (int i = 0; i < titleArray.length; i++) {
				lr = new Label(i, 1, titleArray[i]);
				s1.addCell(lr);
			}
			for (int i = 2; i < list.size() + 2; i++) {
				lr = new Label(0, i, String.valueOf(i - 1));
				s1.addCell(lr);
				lr = new Label(1, i, String.valueOf(list.get(i - 2).get("name")));
				s1.addCell(lr);
				lr = new Label(2, i, String.valueOf(list.get(i - 2).get("fundsApplyNum")));
				s1.addCell(lr);
				lr = new Label(3, i, String.valueOf(list.get(i - 2).get("fundsApplyMoney")));
				s1.addCell(lr);
				lr = new Label(4, i, String.valueOf(list.get(i - 2).get("type")));
				s1.addCell(lr);
				lr = new Label(5, i, String.valueOf(list.get(i - 2).get("create_time")));
				s1.addCell(lr);
				lr = new Label(6, i, String.valueOf(list.get(i - 2).get("step")));
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

	private FundsApplyInfoService fundsApplyInfoService;
	private SupplierInfoService supplierInfoService;
	private PurchaseOrderService purchaseOrderService;
	private DataDeviceTypeService dataDeviceTypeService;

	public void setFundsApplyInfoService(FundsApplyInfoService fundsApplyInfoService) {
		this.fundsApplyInfoService = fundsApplyInfoService;
	}

	public void setSupplierInfoService(SupplierInfoService supplierInfoService) {
		this.supplierInfoService = supplierInfoService;
	}

	public void setPurchaseOrderService(PurchaseOrderService purchaseOrderService) {
		this.purchaseOrderService = purchaseOrderService;
	}

	public void setDataDeviceTypeService(DataDeviceTypeService dataDeviceTypeService) {
		this.dataDeviceTypeService = dataDeviceTypeService;
	}

}
