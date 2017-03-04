package com.disease_control.web.form;

import com.disease_control.core.status.BaseForm;

public class DataWorkStatus extends BaseForm {

	private int id;
	private String name;
	private int isSystem;

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

	public int getIsSystem() {
		return isSystem;
	}

	public void setIsSystem(int isSystem) {
		this.isSystem = isSystem;
	}

}
