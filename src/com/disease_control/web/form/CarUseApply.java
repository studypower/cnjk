package com.disease_control.web.form;

import java.util.Date;

import com.disease_control.core.status.BaseForm;

public class CarUseApply extends BaseForm {

	private int id;
	private int applyDepartmentId;
	private int applyStaffId;
	private int auditStaffId;
	private String title;
	private int carId;
	private int seatsNum;
	private String destination; // 目的地
	private int freight; // 是否货运
	private Date startTime;
	private Date endTime;
	private int applyType;
	private String remark;
	private Date createTime;
	private Date auditTime;
	private int status;

	private int day;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getApplyDepartmentId() {
		return applyDepartmentId;
	}

	public void setApplyDepartmentId(int applyDepartmentId) {
		this.applyDepartmentId = applyDepartmentId;
	}

	public int getApplyStaffId() {
		return applyStaffId;
	}

	public void setApplyStaffId(int applyStaffId) {
		this.applyStaffId = applyStaffId;
	}

	public int getAuditStaffId() {
		return auditStaffId;
	}

	public void setAuditStaffId(int auditStaffId) {
		this.auditStaffId = auditStaffId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getCarId() {
		return carId;
	}

	public void setCarId(int carId) {
		this.carId = carId;
	}

	public int getSeatsNum() {
		return seatsNum;
	}

	public void setSeatsNum(int seatsNum) {
		this.seatsNum = seatsNum;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public int getFreight() {
		return freight;
	}

	public void setFreight(int freight) {
		this.freight = freight;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public int getApplyType() {
		return applyType;
	}

	public void setApplyType(int applyType) {
		this.applyType = applyType;
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

	public Date getAuditTime() {
		return auditTime;
	}

	public void setAuditTime(Date auditTime) {
		this.auditTime = auditTime;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

}
