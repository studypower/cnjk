package com.disease_control.web.form;

import java.util.Date;

import com.disease_control.core.status.BaseForm;

public class RoleInfo extends BaseForm {

	private int id;
	private String name;
	private int status;
	private Date insertTime;
	private String menuKeys;

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

	public Date getInsertTime() {
		return insertTime;
	}

	public void setInsertTime(Date insertTime) {
		this.insertTime = insertTime;
	}

	public String getMenuKeys() {
		return menuKeys;
	}

	public void setMenuKeys(String menuKeys) {
		this.menuKeys = menuKeys;
	}

}
