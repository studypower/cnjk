package com.disease_control.web.form;

import com.disease_control.core.status.BaseForm;

public class DataUsePlace extends BaseForm {
	
	private int id;
	private int departmentId;
	private String roomNum;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}

	public String getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(String roomNum) {
		this.roomNum = roomNum;
	}
}
