package com.disease_control.web.form;

import java.io.File;
import java.util.Date;

import com.disease_control.core.status.BaseForm;

public class PayrollEntry extends BaseForm {

	private int id;
	private int batchId;
	private int staffId;
	private String staffName;
	private double wageSum;
	private Date createTime;
	private PayrollBatch payrollBatch;

	private File file;
	private String fileContentType;
	private String fileFileName;

	private Date startTime;
	private Date endTime;

	private int departmentId;
	private int positionId;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getBatchId() {
		return batchId;
	}

	public void setBatchId(int batchId) {
		this.batchId = batchId;
	}

	public int getStaffId() {
		return staffId;
	}

	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}

	public String getStaffName() {
		return staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

	public double getWageSum() {
		return wageSum;
	}

	public void setWageSum(double wageSum) {
		this.wageSum = wageSum;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public File getFile() {
		if (fileFileName == null || fileFileName.equals("")) {
			return null;
		}
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public PayrollBatch getPayrollBatch() {
		return payrollBatch;
	}

	public void setPayrollBatch(PayrollBatch payrollBatch) {
		this.payrollBatch = payrollBatch;
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

	public int getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}

	public int getPositionId() {
		return positionId;
	}

	public void setPositionId(int positionId) {
		this.positionId = positionId;
	}

}
