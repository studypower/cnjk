package com.disease_control.web.action.dzgzd.gzdgl.gzdpc;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.PayrollBatchService;
import com.disease_control.service.PayrollColumnInfoService;
import com.disease_control.service.PayrollEntryService;
import com.disease_control.web.form.PayrollEntry;
import com.yakov.utils.JsonUtil;

public class PayrollEntryAction extends BaseAction<PayrollEntry> {

	public String initList() {
		initRequest();
		PayrollEntry payrollEntry = getForm();
		Map payrollBatch = payrollBatchService.info(payrollEntry.getBatchId());
		request.setAttribute("payrollColumnInfoList", payrollColumnInfoService.list(payrollBatch.get("table_id")));
		request.setAttribute("payrollBatch", payrollBatch);
		return SUCCESS;
	}

	public void list() {
		initRequest();
		PayrollEntry payrollEntry = getForm();
		String tableId = request.getParameter("tableId");
		Page page = payrollEntryService.list(Integer.parseInt(tableId), payrollEntry.getBatchId(), payrollEntry.getStaffName(), payrollEntry.getPageIndex(), payrollEntry.getPageSize());
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	public String initAdd() {
		initRequest();
		PayrollEntry payrollEntry = getForm();
		Map payrollBatch = payrollBatchService.info(payrollEntry.getBatchId());
		request.setAttribute("payrollBatch", payrollBatch);
		return SUCCESS;
	}

	public String add() {
		initRequest();
		PayrollEntry payrollEntry = getForm();
		if (payrollEntry.getFile() == null) {
			return ERROR;
		}
		try {
			Workbook rwb = Workbook.getWorkbook(new FileInputStream(payrollEntry.getFile()));
			Sheet rs = rwb.getSheet(0);
			int irows = rs.getRows();
			int icols = rs.getColumns();
			Cell cell = rs.getCell(1, 0);
			int version = Integer.parseInt(cell.getContents());
			List list = new ArrayList();
			for1: for (int i = 2; i < irows; i++) {
				Object[] params = new Object[icols + 1];
				params[0] = payrollEntry.getBatchId();
				for (int j = 0; j < icols; j++) {
					cell = rs.getCell(j, i);
					params[j + 1] = cell.getContents();
					if (cell.getContents() == null || cell.getContents().equals("")) {
						continue for1;
					}
				}
				list.add(params);
			}
			rwb.close();
			int resultInt = payrollEntryService.add_Tx(payrollEntry.getBatchId(), version, list);
			if (resultInt == 0) {
				request.setAttribute("result", 0);
				return ERROR;
			} else if (resultInt == -1) {
				request.setAttribute("result", -1);
				return ERROR;
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("result", -2);
			return ERROR;
		}
		return SUCCESS;
	}

	public String info() {
		initRequest();
		PayrollEntry payrollEntry = getForm();
		Map payrollEntryMap = payrollEntryService.info(payrollEntry.getId());
		Map payrollBatch = payrollBatchService.info(Integer.parseInt(payrollEntryMap.get("batch_id").toString()));
		request.setAttribute("payrollColumnInfoList", payrollColumnInfoService.list(Integer.parseInt(payrollBatch.get("table_id").toString())));
		request.setAttribute("payrollEntry", payrollEntryMap);
		request.setAttribute("payrollBatch", payrollBatch);
		return SUCCESS;
	}

	public String initUpdate() {
		initRequest();
		PayrollEntry payrollEntry = getForm();
		Map payrollEntryMap = payrollEntryService.info(payrollEntry.getId());
		Map payrollBatch = payrollBatchService.info(Integer.parseInt(payrollEntryMap.get("batch_id").toString()));
		request.setAttribute("payrollColumnInfoList", payrollColumnInfoService.list(Integer.parseInt(payrollBatch.get("table_id").toString())));
		request.setAttribute("payrollEntry", payrollEntryMap);
		request.setAttribute("payrollBatch", payrollBatch);
		return SUCCESS;
	}

	public String update() {
		initRequest();
		String bactch_id = request.getParameter("batch_id");
		int batchId = Integer.parseInt(bactch_id);
		Map batchMap = payrollBatchService.info(batchId);
		List columnInfoList = payrollColumnInfoService.list(Integer.parseInt(batchMap.get("table_id").toString()));
		Map entryMap = new HashMap();
		for (int i = 0; i < columnInfoList.size(); i++) {
			Map columnInfoMap = (Map) columnInfoList.get(i);
			if (columnInfoMap.get("column_type").toString().equals("double") || columnInfoMap.get("column_type").toString().equals("int")) {
				if (columnInfoMap.get("column_name").equals("release_status") || columnInfoMap.get("column_name").equals("read_status")) {
					entryMap.put(columnInfoMap.get("column_name"), 0);
				} else {
					entryMap.put(columnInfoMap.get("column_name"), Integer.parseInt(request.getParameter(columnInfoMap.get("column_name").toString())));
				}
			} else {
				entryMap.put(columnInfoMap.get("column_name"), request.getParameter(columnInfoMap.get("column_name").toString()));
			}
		}
		if (payrollEntryService.update_Tx(entryMap, columnInfoList, Integer.parseInt(batchMap.get("table_id").toString())) <= 0) {
			return ERROR;
		}
		request.setAttribute("batchId", batchId);
		getPrintWriter().println("<script>parent.updateOK();</script>");
		return NONE;
	}

	public String del() {
		initRequest();
		PayrollEntry payrollEntry = getForm();
		if (payrollEntryService.delete_Tx(payrollEntry.getId(), payrollEntry.getBatchId()) <= 0) {
			return ERROR;
		}
		return SUCCESS;
	}

	private PayrollEntryService payrollEntryService;
	private PayrollColumnInfoService payrollColumnInfoService;
	private PayrollBatchService payrollBatchService;

	public void setPayrollEntryService(PayrollEntryService payrollEntryService) {
		this.payrollEntryService = payrollEntryService;
	}

	public void setPayrollColumnInfoService(PayrollColumnInfoService payrollColumnInfoService) {
		this.payrollColumnInfoService = payrollColumnInfoService;
	}

	public void setPayrollBatchService(PayrollBatchService payrollBatchService) {
		this.payrollBatchService = payrollBatchService;
	}

}
