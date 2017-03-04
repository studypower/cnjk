package com.disease_control.web.action.xtsz.sjzd;

import java.util.HashMap;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.MeetingRoomDeviceService;
import com.disease_control.web.form.DataMeetingRoomUseTime;
import com.disease_control.web.form.MeetingRoomDevice;
import com.yakov.utils.JsonUtil;

/**
 * 会议室设备
 * 
 * @author
 * 
 */
public class DateMeetingRoomDeviceAction extends BaseAction<MeetingRoomDevice> {
	public String initList() {
		initRequest();
		return SUCCESS;
	}

	public void list() {
		initRequest();
		MeetingRoomDevice meetingRoomDevice = getForm();
		Page page = meetingRoomDeviceService.list(meetingRoomDevice.getPageIndex(), meetingRoomDevice.getPageSize());
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	public String initAdd() {
		initRequest();
		return SUCCESS;
	}

	public String add() {
		initRequest();
		MeetingRoomDevice meetingRoomDevice = getForm();
		int resultInt = meetingRoomDeviceService.add(meetingRoomDevice);
		if (resultInt == 0) {
			request.setAttribute("result", 0);
			return ERROR;
		} else if (resultInt == -1) {
			request.setAttribute("result", -1);
			return ERROR;
		}
		return SUCCESS;
	}

	public String initUpdate() {
		initRequest();
		MeetingRoomDevice meetingRoomDevice = getForm();
		Map meetingRoomDeviceMap = meetingRoomDeviceService.get(meetingRoomDevice.getId());
		request.setAttribute("meetingRoomDevice", meetingRoomDeviceMap);
		return SUCCESS;
	}

	public String update() {
		initRequest();
		MeetingRoomDevice meetingRoomDevice = getForm();
		int resultInt = meetingRoomDeviceService.update(meetingRoomDevice);
		if (resultInt == 0) {
			request.setAttribute("result", 0);
			return ERROR;
		} else if (resultInt == -1) {
			request.setAttribute("result", -1);
			return ERROR;
		}
		return SUCCESS;
	}

	public String del() {
		initRequest();
		MeetingRoomDevice meetingRoomDevice = getForm();
		meetingRoomDeviceService.del(meetingRoomDevice.getId());
		return SUCCESS;
	}

	private MeetingRoomDeviceService meetingRoomDeviceService;

	public void setMeetingRoomDeviceService(MeetingRoomDeviceService meetingRoomDeviceService) {
		this.meetingRoomDeviceService = meetingRoomDeviceService;
	}

}
