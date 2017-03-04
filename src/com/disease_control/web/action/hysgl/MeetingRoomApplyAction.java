package com.disease_control.web.action.hysgl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.disease_control.core.config.SystemConfig;
import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.DataMeetingRoomUseTimeService;
import com.disease_control.service.DepartmentInfoService;
import com.disease_control.service.MeetingRoomApplyService;
import com.disease_control.service.MeetingRoomDeviceService;
import com.disease_control.service.MeetingRoomInfoService;
import com.disease_control.service.StaffInfoService;
import com.disease_control.web.form.CarUseApply;
import com.disease_control.web.form.MeetingRoomApply;
import com.disease_control.web.form.MeetingRoomInfo;
import com.yakov.utils.DateUtil;
import com.yakov.utils.JsonUtil;
import com.yakov.utils.RoleTools;

/**
 * 会议室申请
 * 
 * @author
 * 
 */
public class MeetingRoomApplyAction extends BaseAction<MeetingRoomApply> {
	/**
	 * 进入申请列表
	 * 
	 * @return
	 */
	public String initList() {
		initRequest();
		request.setAttribute("from", this.request.getParameter("from"));
		request.setAttribute("MeetingRoomList", meetingRoomInfoService.list());
		request.setAttribute("staffInfoList", staffInfoService.list());
		request.setAttribute("departmentList", departmentInfoService.list());
		return SUCCESS;
	}

	/**
	 * 列表
	 */
	public void list() {
		initRequest();
		MeetingRoomApply meetingRoomApply = getForm();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		int is_read = -100;
		String from = this.request.getParameter("from");
		if ("welcome".equals(from)) {
			if (!RoleTools.isRole(currentUser, "8_1_3")) { // 是否具有会议室审批权限，如果没有则只能查询未读信息
				is_read = 0;
			}
		}
		Page page = meetingRoomApplyService.list(meetingRoomApply.getPageIndex(), meetingRoomApply.getPageSize(), meetingRoomApply.getMeetingRoomId(), meetingRoomApply.getApplyStaffId(),
				meetingRoomApply.getMeetingStartTime(), meetingRoomApply.getMeetingEndTime(), meetingRoomApply.getStatus(), meetingRoomApply.getDepartmentId(),is_read);
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	/**
	 * 进入可申请会议室列表页
	 * 
	 * @return
	 */
	public String initIdleMeetRoomList() {
		return SUCCESS;
	}

	/**
	 * 查出可申请的会议室列表
	 */
	public void idleMeetRoomList() {
		initRequest();
		MeetingRoomApply meetingRoomApply = getForm();
		HashMap jsonMap = new HashMap();
		if (meetingRoomApply.getMeetingStartTime() == null || "".equals(meetingRoomApply.getMeetingStartTime()) || meetingRoomApply.getMeetingEndTime() == null
				|| "".equals(meetingRoomApply.getMeetingEndTime())) {
			getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
			return;
		}
		List idMeetingRoomList = meetingRoomApplyService.idleMeetRoom(meetingRoomApply.getMeetingStartTime(), meetingRoomApply.getMeetingEndTime());
		jsonMap.put("total", 1);
		jsonMap.put("page", 1);
		jsonMap.put("records", idMeetingRoomList.size());
		jsonMap.put("rows", idMeetingRoomList);
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	/**
	 * 进入申请页
	 * 
	 * @return
	 */
	public String initApply() {
		initRequest();
		MeetingRoomApply meetingRoomApply = getForm();
		request.setAttribute("meetingRoomInfo", meetingRoomInfoService.get(meetingRoomApply.getMeetingRoomId()));
		return SUCCESS;
	}

	/**
	 * 申请
	 * 
	 * @return
	 */
	public String apply() {
		initRequest();
		MeetingRoomApply meetingRoomApply = getForm();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		int applyStaffId = Integer.parseInt(currentUser.get("staffId").toString());
		int departmentId = Integer.parseInt(currentUser.get("departmentId").toString());
		meetingRoomApply.setApplyStaffId(applyStaffId);
		meetingRoomApply.setDepartmentId(departmentId);
		int addApplyResult = meetingRoomApplyService.add_Tx(meetingRoomApply);
		if (addApplyResult == 1) {
			getPrintWriter().println("<script>parent.applyOK();</script>");
			return NONE;
		} else if (addApplyResult == -1) {
			getPrintWriter().println("<script>parent.applyError_1();</script>");
			return NONE;
		}
		return ERROR;
	}

	/**
	 * 详情
	 * 
	 * @return
	 */
	public String info() {
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		MeetingRoomApply meetingRoomApply = getForm();
		Map meetingRoomApplyMap = meetingRoomApplyService.get(meetingRoomApply.getId(),currentUser);
		request.setAttribute("meetingRoomApply", meetingRoomApplyMap);
		request.setAttribute("meetingRoomInfo", meetingRoomInfoService.get(Integer.parseInt(meetingRoomApplyMap.get("meeting_room_id").toString())));
		return SUCCESS;
	}

	public String del() {
		initRequest();
		MeetingRoomApply meetingRoomApply = getForm();
		meetingRoomApplyService.del(meetingRoomApply.getId());
		return SUCCESS;
	}

	/**
	 * 审核
	 */
	public void audit() {
		initRequest();
		MeetingRoomApply meetingRoomApply = getForm();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		meetingRoomApply.setAuditStaffId(Integer.parseInt(currentUser.get("staffId").toString()));
		if (meetingRoomApplyService.audit_Tx(meetingRoomApply) == 1) {
			getPrintWriter().println(1);
		} else {
			getPrintWriter().println(0);
		}
	}

	public String initCalendar() {
		initRequest();
		MeetingRoomApply meetingRoomApply = getForm();
		meetingRoomApply.setMeetingStartTime(DateUtil.getMonday(meetingRoomApply.getDay()));
		/*
		 * if (meetingRoomApply.getMeetingStartTime() == null) {
		 * meetingRoomApply.setMeetingStartTime(new Date()); }
		 */
		List<String> dateList = new ArrayList<String>();
		for (int i = 0; i < 7; i++) {
			dateList.add(DateUtil.getDateTime("yyyy-MM-dd", DateUtil.dayOffset(meetingRoomApply.getMeetingStartTime(), i)));
		}
		request.setAttribute("nowTime", DateUtil.getDateTime("yyyy-MM-dd HH:mm:ss", new Date()));
		request.setAttribute("dateList", dateList);
		return SUCCESS;
	}

	public void calendar() {
		initRequest();
		MeetingRoomApply meetingRoomApply = getForm();
		if (meetingRoomApply.getMeetingStartTime() == null) {
			meetingRoomApply.setMeetingStartTime(new Date());
		}
		List<String> dateList = new ArrayList<String>();
		for (int i = 0; i < 7; i++) {
			dateList.add(DateUtil.getDateTime("yyyy-MM-dd", DateUtil.dayOffset(meetingRoomApply.getMeetingStartTime(), i)));
		}
		List<Map> dataMeetingRoomUseTimeList = dataMeetingRoomUseTimeService.list();
		List<Map> meetingRoomInfoList = meetingRoomInfoService.list(1);
		List resultList = meetingRoomApplyService.calendar(dateList, dataMeetingRoomUseTimeList, meetingRoomInfoList);
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
	
	public void cancel() {
		initRequest();
		MeetingRoomApply meetingRoomApply = getForm();
		meetingRoomApplyService.cancel(meetingRoomApply.getId());
		getPrintWriter().println(1);
	}

	private DepartmentInfoService departmentInfoService;
	private MeetingRoomApplyService meetingRoomApplyService;
	private MeetingRoomInfoService meetingRoomInfoService;
	private MeetingRoomDeviceService meetingRoomDeviceService;
	private StaffInfoService staffInfoService;
	private DataMeetingRoomUseTimeService dataMeetingRoomUseTimeService;

	public void setMeetingRoomApplyService(MeetingRoomApplyService meetingRoomApplyService) {
		this.meetingRoomApplyService = meetingRoomApplyService;
	}

	public void setMeetingRoomInfoService(MeetingRoomInfoService meetingRoomInfoService) {
		this.meetingRoomInfoService = meetingRoomInfoService;
	}

	public void setMeetingRoomDeviceService(MeetingRoomDeviceService meetingRoomDeviceService) {
		this.meetingRoomDeviceService = meetingRoomDeviceService;
	}

	public void setStaffInfoService(StaffInfoService staffInfoService) {
		this.staffInfoService = staffInfoService;
	}

	public void setDataMeetingRoomUseTimeService(DataMeetingRoomUseTimeService dataMeetingRoomUseTimeService) {
		this.dataMeetingRoomUseTimeService = dataMeetingRoomUseTimeService;
	}

	public void setDepartmentInfoService(DepartmentInfoService departmentInfoService) {
		this.departmentInfoService = departmentInfoService;
	}

}
