package com.disease_control.web.action.hysgl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.MeetingRoomDeviceService;
import com.disease_control.service.MeetingRoomInfoService;
import com.disease_control.web.form.MeetingRoomInfo;
import com.yakov.utils.JsonUtil;

/**
 * 会议室信息
 * 
 * @author
 * 
 */
public class MeetingRoomInfoAction extends BaseAction<MeetingRoomInfo> {

	public String initList() {
		initRequest();
		request.setAttribute("meetingRoomInfoList", meetingRoomInfoService.list());
		return SUCCESS;
	}

	/**
	 * 列表
	 */
	public void list() {
		initRequest();
		MeetingRoomInfo meetingRoomInfo = getForm();
		Page page = meetingRoomInfoService.list(meetingRoomInfo.getPageIndex(), meetingRoomInfo.getPageSize(), meetingRoomInfo.getId(), meetingRoomInfo.getActive());
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
	 * 进入添加页
	 * 
	 * @return
	 */
	public String initAdd() {
		initRequest();
		MeetingRoomInfo meetingRoomInfo = getForm();
		request.setAttribute("meetingRoomDeviceList", meetingRoomDeviceService.list());// 查出基础设备
		return SUCCESS;
	}

	/**
	 * 添加
	 * 
	 * @return
	 */
	public String add() {
		initRequest();
		MeetingRoomInfo meetingRoomInfo = getForm();
		if (meetingRoomInfoService.add(meetingRoomInfo) <= 0) {
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
		MeetingRoomInfo meetingRoomInfo = getForm();
		request.setAttribute("meetingRoomInfo", meetingRoomInfoService.get(meetingRoomInfo.getId()));
		return SUCCESS;
	}

	/**
	 * 进入修改页
	 * 
	 * @return
	 */
	public String initUpdate() {
		initRequest();
		MeetingRoomInfo meetingRoomInfo = getForm();
		request.setAttribute("meetingRoomDeviceList", meetingRoomDeviceService.list());// 查出基础设备
		request.setAttribute("meetingRoomInfo", meetingRoomInfoService.get(meetingRoomInfo.getId()));
		return SUCCESS;
	}

	/**
	 * 修改
	 * 
	 * @return
	 */
	public String update() {
		initRequest();
		MeetingRoomInfo meetingRoomInfo = getForm();
		if (meetingRoomInfoService.update(meetingRoomInfo) <= 0) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	
	public String del(){
		initRequest();
		MeetingRoomInfo meetingRoomInfo = getForm();
		meetingRoomInfoService.del(meetingRoomInfo.getId());
		return SUCCESS;
	}

	private MeetingRoomInfoService meetingRoomInfoService;
	private MeetingRoomDeviceService meetingRoomDeviceService;

	public void setMeetingRoomInfoService(MeetingRoomInfoService meetingRoomInfoService) {
		this.meetingRoomInfoService = meetingRoomInfoService;
	}

	public void setMeetingRoomDeviceService(MeetingRoomDeviceService meetingRoomDeviceService) {
		this.meetingRoomDeviceService = meetingRoomDeviceService;
	}

}
