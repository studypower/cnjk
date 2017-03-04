package com.disease_control.web.form;

import com.disease_control.core.status.BaseForm;

public class FundsApplyStockEntry extends BaseForm {

	private int id;
	private String name; // 设备名称
	private double money; // 采购单价
	private int amount; // 采购数量
	private String remark; // 备注
	private int buyAmount; // 已购数量

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

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public int getBuyAmount() {
		return buyAmount;
	}

	public void setBuyAmount(int buyAmount) {
		this.buyAmount = buyAmount;
	}

}
