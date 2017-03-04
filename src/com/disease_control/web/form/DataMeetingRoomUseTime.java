package com.disease_control.web.form;

import com.disease_control.core.status.BaseForm;

public class DataMeetingRoomUseTime extends BaseForm {

	private int id;
	private String startTime;
	private String endTime;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

}
