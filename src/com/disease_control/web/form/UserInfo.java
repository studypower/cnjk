package com.disease_control.web.form;

import com.disease_control.core.status.BaseForm;

/**
 * 用户信息
 * 
 * @author
 * 
 */
public class UserInfo extends BaseForm {
	// 用户表Id
	private int id;
	// 用户名
	private String name;
	// 密码
	private String pwd;
	// 用户级别
	private int grade;
	// 员工Id
	private int staffId;

	private int roleId;
	// 状态
	private int status;

	private String staffName;
	private String roleName;
	private String gradeType;

	private String menuKeys;

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

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getStaffId() {
		return staffId;
	}

	public void setStaffId(int staffId) {
		this.staffId = staffId;
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

	public String getStaffName() {
		return staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	public String getMenuKeys() {
		return menuKeys;
	}

	public void setMenuKeys(String menuKeys) {
		this.menuKeys = menuKeys;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getGradeType() {
		return gradeType;
	}

	public void setGradeType(String gradeType) {
		this.gradeType = gradeType;
	}

	public int getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}

}
