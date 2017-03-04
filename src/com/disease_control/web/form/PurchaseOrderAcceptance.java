package com.disease_control.web.form;

import java.util.Date;

import com.disease_control.core.status.BaseForm;

public class PurchaseOrderAcceptance extends BaseForm {

	private int id;
	private int orderId;
	private int acceptanceStaffId;
	private String remark;
	private Date createTime;

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

	public int getAcceptanceStaffId() {
		return acceptanceStaffId;
	}

	public void setAcceptanceStaffId(int acceptanceStaffId) {
		this.acceptanceStaffId = acceptanceStaffId;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}
