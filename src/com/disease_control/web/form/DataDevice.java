package com.disease_control.web.form;

import com.disease_control.core.status.BaseForm;

public class DataDevice extends BaseForm {
	private int id;
	private String name;
	private int typeId;

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

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

}
