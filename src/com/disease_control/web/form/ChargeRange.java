package com.disease_control.web.form;

import com.disease_control.core.status.BaseForm;

public class ChargeRange extends BaseForm{
	private int id;
	private int staffId;
	private String departmentIds;
    private int departmentId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStaffId() {
		return staffId;
	}
	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}
	public String getDepartmentIds() {
		return departmentIds;
	}
	public void setDepartmentIds(String departmentIds) {
		this.departmentIds = departmentIds;
	}
	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}

}
