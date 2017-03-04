package com.disease_control.web.action.xtsz.sjzd;

import java.util.HashMap;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.DataMeetingRoomUseTimeService;
import com.disease_control.web.form.DataCarUseTime;
import com.disease_control.web.form.DataMeetingRoomUseTime;
import com.yakov.utils.JsonUtil;

public class DataMeetingRoomUseTimeAction extends BaseAction<DataMeetingRoomUseTime>{
	
	public String initList() {
		initRequest();
		return SUCCESS;
	}

	public void list() {
		initRequest();
		DataMeetingRoomUseTime dataMeetingRoomUseTime= getForm();
		Page page = dataMeetingRoomUseTimeService.list(dataMeetingRoomUseTime.getPageIndex(), dataMeetingRoomUseTime.getPageSize());
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	public String initUpdate() {
		initRequest();
		DataMeetingRoomUseTime dataMeetingRoomUseTime= getForm();
		Map dataMeetingRoomUseTimeMap = dataMeetingRoomUseTimeService.info(dataMeetingRoomUseTime.getId());
		request.setAttribute("dataMeetingRoomUseTime", dataMeetingRoomUseTimeMap);
		return SUCCESS;
	}

	public String update() {
		initRequest();
		DataMeetingRoomUseTime dataMeetingRoomUseTime= getForm();
		if (dataMeetingRoomUseTimeService.update(dataMeetingRoomUseTime) <= 0) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	
	private DataMeetingRoomUseTimeService dataMeetingRoomUseTimeService;

	public void setDataMeetingRoomUseTimeService(DataMeetingRoomUseTimeService dataMeetingRoomUseTimeService) {
		this.dataMeetingRoomUseTimeService = dataMeetingRoomUseTimeService;
	}

}
