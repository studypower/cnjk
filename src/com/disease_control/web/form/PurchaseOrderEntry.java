package com.disease_control.web.form;

import com.disease_control.core.status.BaseForm;

public class PurchaseOrderEntry extends BaseForm {

	private int id;
	private int orderId;
	private int fundsApplyEntryId;
	private double money;
	private int amount;
	private int sgAmount;
	private int ysAmount;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getFundsApplyEntryId() {
		return fundsApplyEntryId;
	}

	public void setFundsApplyEntryId(int fundsApplyEntryId) {
		this.fundsApplyEntryId = fundsApplyEntryId;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public int getSgAmount() {
		return sgAmount;
	}

	public void setSgAmount(int sgAmount) {
		this.sgAmount = sgAmount;
	}

	public int getYsAmount() {
		return ysAmount;
	}

	public void setYsAmount(int ysAmount) {
		this.ysAmount = ysAmount;
	}

}
