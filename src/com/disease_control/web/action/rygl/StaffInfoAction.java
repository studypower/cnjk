package com.disease_control.web.action.rygl;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.DataMzInfoService;
import com.disease_control.service.DataWhcdInfoService;
import com.disease_control.service.DataWorkStatusService;
import com.disease_control.service.DataZcInfoService;
import com.disease_control.service.DataZcjbInfoService;
import com.disease_control.service.DataZzmmInfoService;
import com.disease_control.service.DepartmentInfoService;
import com.disease_control.service.PositionInfoService;
import com.disease_control.service.StaffInfoService;
import com.disease_control.web.form.StaffInfo;
import com.yakov.utils.DateUtil;
import com.yakov.utils.ExcelReader;
import com.yakov.utils.JsonUtil;

public class StaffInfoAction extends BaseAction<StaffInfo> {

	public String initList() {
		initRequest();
		request.setAttribute("departmentList", departmentInfoService.list());
		request.setAttribute("positionList", positionInfoService.list());
		request.setAttribute("dataWorkStatusList", dataWorkStatusService.list());
		request.setAttribute("dataZcInfoList", dataZcInfoService.list());
		request.setAttribute("dataZcjbInfoList", dataZcjbInfoService.list());
		request.setAttribute("dataZzmmInfoList", dataZzmmInfoService.list());
		request.setAttribute("dataWhcdInfoList", dataWhcdInfoService.list());
		return SUCCESS;
	}

	/**
	 * 查询员工列表
	 * 
	 * @return
	 */
	public void list() {
		initRequest();
		StaffInfo staffInfo = (StaffInfo) getForm();
		String sexy = request.getParameter("sexy");
		String sidx = request.getParameter("sidx");
		String sord = request.getParameter("sord");
		if (sidx == null || "".equals(sidx)) {
			sidx = "user_name";
			sord = "asc";
		}
		if (sidx.equals("department_name")) {
			sidx = "di.id";
		} else if (sidx.equals("position_name")) {
			sidx = "pi.id";
		} else if (sidx.equals("user_name")) {
			sidx = "user_index";
		} else if (sidx.equals("zzmmName")) {
			sidx = "zzmm.id";
		} else if (sidx.equals("zcName")) {
			sidx = "dzi.id";
		} else if (sidx.equals("zcjbName")) {
			sidx = "dzci.id";
		} else if (sidx.equals("index_num1")) {
			sidx = "index_num1";
		} else {
			sidx = "si." + sidx;
		}
		Page page = staffInfoService.list(staffInfo.getPageIndex(), staffInfo.getPageSize(), staffInfo.getDepartmentId(), staffInfo.getName(), sexy, staffInfo.getEducation(),
				staffInfo.getPositionId(), staffInfo.getWorkStatus(), sidx, sord, staffInfo.getStartTime(), staffInfo.getEndTime(), staffInfo.getZcId(), staffInfo.getZcjbId(), staffInfo.getZzmmId(),
				staffInfo.getStartAge(), staffInfo.getEndAge());
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		ArrayList<Map> resultList = (ArrayList<Map>) page.getResult();
		for (Map result : resultList) {
			result.put("action", result.get("id"));
		}
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	/**
	 * 查询单个员工详细信息
	 * 
	 * @return
	 */
	public String info() {
		initRequest();
		StaffInfo staffInfo = (StaffInfo) getForm();
		Map staffMap = staffInfoService.get(staffInfo.getId());
		request.setAttribute("departmentList", departmentInfoService.list());// 所有的部门
		request.setAttribute("positionList", positionInfoService.list());
		request.setAttribute("dataWorkStatusList", dataWorkStatusService.list());
		request.setAttribute("staffInfo", staffMap);
		return SUCCESS;
	}

	/**
	 * 进入添加页面
	 * 
	 * @return
	 */
	public String initAdd() {
		initRequest();
		StaffInfo staffInfo = (StaffInfo) getForm();
		request.setAttribute("departmentList", departmentInfoService.list());// 所有的部门
		request.setAttribute("positionList", positionInfoService.list());
		request.setAttribute("dataWorkStatusList", dataWorkStatusService.list());
		request.setAttribute("dataZcInfoList", dataZcInfoService.list());
		request.setAttribute("dataZcjbInfoList", dataZcjbInfoService.list());
		request.setAttribute("dataZzmmInfoList", dataZzmmInfoService.list());
		request.setAttribute("dataWhcdInfoList", dataWhcdInfoService.list());
		request.setAttribute("dataMzInfoList", dataMzInfoService.list());
		return SUCCESS;
	}

	/**
	 * 添加员工信息
	 * 
	 * @return
	 */
	public String add() {
		initRequest();
		StaffInfo staffInfo = (StaffInfo) getForm();
		if (staffInfo.getBirthDate() != null) {
			int birthYear = Integer.parseInt(DateUtil.format(staffInfo.getBirthDate(), "yyyy", null));
			int nowYear = Integer.parseInt(DateUtil.format(new Date(), "yyyy", null));
			staffInfo.setAge(nowYear - birthYear);
		}
		int result = staffInfoService.add(staffInfo);
		if (result == 0) {
			return ERROR;
		}
		return SUCCESS;
	}

	/**
	 * 进入修改页面
	 * 
	 * @return
	 */
	public String initUpdate() {
		initRequest();
		StaffInfo staffInfo = (StaffInfo) getForm();
		Map staffMap = staffInfoService.get(staffInfo.getId());
		request.setAttribute("departmentList", departmentInfoService.list());// 所有的部门
		request.setAttribute("positionList", positionInfoService.list());
		request.setAttribute("dataWorkStatusList", dataWorkStatusService.list());
		request.setAttribute("staffInfo", staffMap);
		request.setAttribute("dataZcInfoList", dataZcInfoService.list());
		request.setAttribute("dataZcjbInfoList", dataZcjbInfoService.list());
		request.setAttribute("dataZzmmInfoList", dataZzmmInfoService.list());
		request.setAttribute("dataWhcdInfoList", dataWhcdInfoService.list());
		request.setAttribute("dataMzInfoList", dataMzInfoService.list());
		return SUCCESS;
	}

	/**
	 * 更改员工信息
	 * 
	 * @return
	 */
	public String update() {
		initRequest();
		StaffInfo staffInfo = (StaffInfo) getForm();
		if (staffInfo.getBirthDate() != null) {
			int birthYear = Integer.parseInt(DateUtil.format(staffInfo.getBirthDate(), "yyyy", null));
			int nowYear = Integer.parseInt(DateUtil.format(new Date(), "yyyy", null));
			staffInfo.setAge(nowYear - birthYear);
		}
		staffInfoService.update(staffInfo);
		getPrintWriter().println("<script>history.go(-2);</script>");
		return NONE;
	}

	public void del() {
		initRequest();
		StaffInfo staffInfo = getForm();
		staffInfoService.del(staffInfo.getId());
	}

	public void ajaxList() {
		initRequest();
		StaffInfo staffInfo = (StaffInfo) getForm();
		List staffInfoList = staffInfoService.list(staffInfo.getDepartmentId());
		getPrintWriter().print(JsonUtil.listToJsonStr(staffInfoList));
	}

	public void ajaxList1() {
		initRequest();
		StaffInfo staffInfo = (StaffInfo) getForm();
		List staffInfoList = staffInfoService.listByUser(staffInfo.getDepartmentId());
		getPrintWriter().print(JsonUtil.listToJsonStr(staffInfoList));
	}

	public void ajaxList2() {
		initRequest();
		StaffInfo staffInfo = (StaffInfo) getForm();
		try {
			staffInfo.setCredentialsName(new String(staffInfo.getCredentialsName().getBytes("ISO-8859-1"), "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		List staffInfoList = staffInfoService.list(staffInfo.getCredentialsName(), staffInfo.getCredentialsYear());
		getPrintWriter().print(JsonUtil.listToJsonStr(staffInfoList));
	}

	public String initImportIndexNum() {
		return SUCCESS;
	}

	public String importIndexNum() {
		initRequest();
		StaffInfo staffInfo = (StaffInfo) getForm();
		List<String[]> indexNumList = new ArrayList<String[]>();
		if (staffInfo.getIndexNumFile() != null) {
			try {
				indexNumList = ExcelReader.readExcel(staffInfo.getIndexNumFile(), 1);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		staffInfoService.importIndexNum_Tx(indexNumList);
		return SUCCESS;
	}

	private StaffInfoService staffInfoService;
	private DepartmentInfoService departmentInfoService;
	private PositionInfoService positionInfoService;
	private DataWorkStatusService dataWorkStatusService;

	private DataZcInfoService dataZcInfoService;
	private DataZcjbInfoService dataZcjbInfoService;
	private DataZzmmInfoService dataZzmmInfoService;
	private DataWhcdInfoService dataWhcdInfoService;
	private DataMzInfoService dataMzInfoService;

	public void setStaffInfoService(StaffInfoService staffInfoService) {
		this.staffInfoService = staffInfoService;
	}

	public void setDepartmentInfoService(DepartmentInfoService departmentInfoService) {
		this.departmentInfoService = departmentInfoService;
	}

	public void setPositionInfoService(PositionInfoService positionInfoService) {
		this.positionInfoService = positionInfoService;
	}

	public void setDataWorkStatusService(DataWorkStatusService dataWorkStatusService) {
		this.dataWorkStatusService = dataWorkStatusService;
	}

	public void setDataZcInfoService(DataZcInfoService dataZcInfoService) {
		this.dataZcInfoService = dataZcInfoService;
	}

	public void setDataZcjbInfoService(DataZcjbInfoService dataZcjbInfoService) {
		this.dataZcjbInfoService = dataZcjbInfoService;
	}

	public void setDataZzmmInfoService(DataZzmmInfoService dataZzmmInfoService) {
		this.dataZzmmInfoService = dataZzmmInfoService;
	}

	public void setDataWhcdInfoService(DataWhcdInfoService dataWhcdInfoService) {
		this.dataWhcdInfoService = dataWhcdInfoService;
	}

	public void setDataMzInfoService(DataMzInfoService dataMzInfoService) {
		this.dataMzInfoService = dataMzInfoService;
	}

}
