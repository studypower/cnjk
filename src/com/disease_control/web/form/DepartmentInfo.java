package com.disease_control.web.form;

import com.disease_control.core.status.BaseForm;

/**
 * 部门信息
 * 
 * @author
 * 
 */
public class DepartmentInfo extends BaseForm {
	// 部门表ID
	private int id;
	// 部门名称
	private String name;
	
	private int roleId;
	
	private int baseId;
	
	// 状态
	private int status;
	
	private int isKqsyShow;//是否在考勤首页上展示
	
	private int kqsyOrder;//在考勤首页上的展示排序

	public int getIsKqsyShow() {
		return isKqsyShow;
	}

	public void setIsKqsyShow(int isKqsyShow) {
		this.isKqsyShow = isKqsyShow;
	}

	public int getKqsyOrder() {
		return kqsyOrder;
	}

	public void setKqsyOrder(int kqsyOrder) {
		this.kqsyOrder = kqsyOrder;
	}

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

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getBaseId() {
		return baseId;
	}

	public void setBaseId(int baseId) {
		this.baseId = baseId;
	}

}
