package com.disease_control.web.form;

import com.disease_control.core.status.BaseForm;

public class DataBrand extends BaseForm {
	private int id;
	private String name;
	private int deviceId;

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

	public int getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(int deviceId) {
		this.deviceId = deviceId;
	}

}
