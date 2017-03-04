package com.disease_control.web.form;

import com.disease_control.core.status.BaseForm;

public class StaffDimission extends BaseForm{
       private int id;
       //人员ID
       private int staffId;
       //描述
       private String remark;
       //离职时间
       private String dimissionTime;
       //状态
       private int status;
       
       private String startTime;
       private String endTime;
       
       private String name;
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
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getDimissionTime() {
		return dimissionTime;
	}
	public void setDimissionTime(String dimissionTime) {
		this.dimissionTime = dimissionTime;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
}
