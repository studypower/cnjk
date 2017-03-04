package com.disease_control.web.action.clgl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.disease_control.core.config.SystemConfig;
import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.CarInfoService;
import com.disease_control.service.CarUseApplyService;
import com.disease_control.service.DataCarUseTimeService;
import com.disease_control.service.DepartmentInfoService;
import com.disease_control.service.StaffInfoService;
import com.disease_control.web.form.CarUseApply;
import com.yakov.utils.DateUtil;
import com.yakov.utils.JsonUtil;
import com.yakov.utils.RoleTools;

public class CarUseApplyAction extends BaseAction<CarUseApply> {

	public String initList() {
		initRequest();
		request.setAttribute("from", this.request.getParameter("from"));
		request.setAttribute("carInfoList", carInfoService.list());
		request.setAttribute("staffInfoList", staffInfoService.list());
		request.setAttribute("departmentInfoList", departmentInfoService.list());
		return SUCCESS;
	}

	public void list() {
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		CarUseApply carUseApply = getForm();
		int is_read = -100;
		String from = this.request.getParameter("from");
		if ("welcome".equals(from)) {
			if (!RoleTools.isRole(currentUser, "1_1_3")) { // 是否具有车辆审批权限，如果没有则只能查询未读信息
				is_read = 0;
			}
		}
		Page page = carUseApplyService.list(carUseApply.getPageIndex(), carUseApply.getPageSize(), carUseApply.getApplyType(), carUseApply.getApplyDepartmentId(), -100, carUseApply.getCarId(),
				carUseApply.getStartTime(), carUseApply.getEndTime(), carUseApply.getStatus(), is_read);
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	public String initApply() {
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		CarUseApply carUseApply = getForm();
		request.setAttribute("carInfo", carInfoService.get(carUseApply.getCarId()));
		if (carUseApply.getId() != 0) {
			Map carUseApplyMap = carUseApplyService.get(carUseApply.getId(), currentUser);
			carUseApply.setStartTime((Date) carUseApplyMap.get("start_time"));
			carUseApply.setEndTime((Date) carUseApplyMap.get("end_time"));
			request.setAttribute("carUseApply", carUseApplyMap);
		}
		request.setAttribute("useSeatsNum", carUseApplyService.getUseSeatsNum(carUseApply.getCarId(), carUseApply.getStartTime(), carUseApply.getEndTime()));
		return SUCCESS;
	}

	public String apply() {
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		int applyStaffId = Integer.parseInt(currentUser.get("staffId").toString());
		int applyDepartmentId = (Integer) currentUser.get("departmentId");
		CarUseApply carUseApply = getForm();
		carUseApply.setApplyDepartmentId(applyDepartmentId);
		carUseApply.setApplyStaffId(applyStaffId);
		int addApplyResult = carUseApplyService.add_Tx(carUseApply);
		if (addApplyResult == 1) {
			getPrintWriter().println("<script>parent.applyOK();</script>");
			return NONE;
		} else if (addApplyResult == -1) {
			getPrintWriter().println("<script>parent.applyError_1();</script>");
			return NONE;
		}
		return ERROR;
	}

	public String initCalendar() {
		initRequest();
		CarUseApply carUseApply = getForm();
		carUseApply.setStartTime(DateUtil.getMonday(carUseApply.getDay()));
		List<String> dateList = new ArrayList<String>();
		for (int i = 0; i < 7; i++) {
			dateList.add(DateUtil.getDateTime("yyyy-MM-dd", DateUtil.dayOffset(carUseApply.getStartTime(), i)));
		}
		request.setAttribute("nowTime", DateUtil.getDateTime("yyyy-MM-dd HH:mm:ss", new Date()));
		request.setAttribute("dateList", dateList);
		return SUCCESS;
	}

	public void calendar() {
		initRequest();
		CarUseApply carUseApply = getForm();
		if (carUseApply.getStartTime() == null) {
			carUseApply.setStartTime(new Date());
		}
		List<String> dateList = new ArrayList<String>();
		for (int i = 0; i < 7; i++) {
			dateList.add(DateUtil.getDateTime("yyyy-MM-dd", DateUtil.dayOffset(carUseApply.getStartTime(), i)));
		}
		List<Map> dataCarUseTimeList = dataCarUseTimeService.list();
		List<Map> carInfoList = carInfoService.list();
		List resultList = carUseApplyService.calendar(dateList, dataCarUseTimeList, carInfoList);
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", 1);
		jsonMap.put("page", 1);
		jsonMap.put("records", resultList.size());
		jsonMap.put("rows", resultList);
		Map map1_7 = new HashMap();
		for (int i = 0; i < 7; i++) {
			if (i == 0) {
				map1_7.put(dateList.get(i), "（周一）");
			} else if (i == 1) {
				map1_7.put(dateList.get(i), "（周二）");
			} else if (i == 2) {
				map1_7.put(dateList.get(i), "（周三）");
			} else if (i == 3) {
				map1_7.put(dateList.get(i), "（周四）");
			} else if (i == 4) {
				map1_7.put(dateList.get(i), "（周五）");
			} else if (i == 5) {
				map1_7.put(dateList.get(i), "（周六）");
			} else if (i == 6) {
				map1_7.put(dateList.get(i), "（周日）");
			}
		}
		resultList.add(0, map1_7);
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	public String info() {
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		CarUseApply carUseApply = getForm();
		request.setAttribute("carUseApply", carUseApplyService.get(carUseApply.getId(), currentUser));
		return SUCCESS;
	}

	public void audit() {
		initRequest();
		CarUseApply carUseApply = getForm();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		carUseApply.setAuditStaffId(Integer.parseInt(currentUser.get("staffId").toString()));
		if (carUseApplyService.audit_Tx(carUseApply) == 1) {
			getPrintWriter().println(1);
		} else {
			getPrintWriter().println(0);
		}
	}

	public void del() {
		initRequest();
		CarUseApply carUseApply = getForm();
		carUseApplyService.del(carUseApply.getId());
		getPrintWriter().println(1);
	}

	public void cancel() {
		initRequest();
		CarUseApply carUseApply = getForm();
		carUseApplyService.cancel(carUseApply.getId());
		getPrintWriter().println(1);
	}

	private CarUseApplyService carUseApplyService;
	private CarInfoService carInfoService;
	private StaffInfoService staffInfoService;
	private DataCarUseTimeService dataCarUseTimeService;
	private DepartmentInfoService departmentInfoService;

	public void setCarUseApplyService(CarUseApplyService carUseApplyService) {
		this.carUseApplyService = carUseApplyService;
	}

	public void setCarInfoService(CarInfoService carInfoService) {
		this.carInfoService = carInfoService;
	}

	public void setStaffInfoService(StaffInfoService staffInfoService) {
		this.staffInfoService = staffInfoService;
	}

	public void setDataCarUseTimeService(DataCarUseTimeService dataCarUseTimeService) {
		this.dataCarUseTimeService = dataCarUseTimeService;
	}

	public void setDepartmentInfoService(DepartmentInfoService departmentInfoService) {
		this.departmentInfoService = departmentInfoService;
	}

}
