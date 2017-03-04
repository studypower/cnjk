package com.disease_control.web.form;

import com.disease_control.core.status.BaseForm;

public class DepotRkEntry extends BaseForm {

	private int id;
	private int wzcgInfoId;
	private int deviceTypeId;
	private int deviceId;
	private int brandId;
	private int brandFormatId;
	private int amount;
	private double money;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getDeviceTypeId() {
		return deviceTypeId;
	}

	public void setDeviceTypeId(int deviceTypeId) {
		this.deviceTypeId = deviceTypeId;
	}

	public int getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(int deviceId) {
		this.deviceId = deviceId;
	}

	public int getBrandId() {
		return brandId;
	}

	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}

	public int getBrandFormatId() {
		return brandFormatId;
	}

	public void setBrandFormatId(int brandFormatId) {
		this.brandFormatId = brandFormatId;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getWzcgInfoId() {
		return wzcgInfoId;
	}

	public void setWzcgInfoId(int wzcgInfoId) {
		this.wzcgInfoId = wzcgInfoId;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

}
