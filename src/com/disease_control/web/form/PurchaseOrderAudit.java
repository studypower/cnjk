package com.disease_control.web.form;

import java.util.Date;

import com.disease_control.core.status.BaseForm;

public class PurchaseOrderAudit extends BaseForm {

	private int id;
	private int orderId;
	private int auditStaffId;
	private int step;
	private int status;
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

	public int getAuditStaffId() {
		return auditStaffId;
	}

	public void setAuditStaffId(int auditStaffId) {
		this.auditStaffId = auditStaffId;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
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
