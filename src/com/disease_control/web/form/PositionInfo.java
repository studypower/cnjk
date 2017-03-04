package com.disease_control.web.form;

import com.disease_control.core.status.BaseForm;

/**
 * 职位信息
 * 
 * @author
 * 
 */
public class PositionInfo extends BaseForm {
	// 职位Id
	private int id;
	// 职位名称
	private String name;
	// 状态
	private int status;
	
	private int departmentId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}

}
