package com.disease_control.web.form;

import com.disease_control.core.status.BaseForm;

public class DataBrandFormat extends BaseForm {
	private int id;
	private String name;
	private int brandId;
	private double money;

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

	public int getBrandId() {
		return brandId;
	}

	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

}
