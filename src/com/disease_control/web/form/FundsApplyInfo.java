package com.disease_control.web.form;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.disease_control.core.status.BaseForm;

/**
 * 经费申请表
 * 
 * @author
 * 
 */
public class FundsApplyInfo extends BaseForm {
	private int id;
	private String name;// 申请单名称
	private double money;// 金额
	private int isSyscg; // 是否实验室采购
	private String remark;// 说明
	private int applyStaffId;// 申请人
	private Date applyTime;// 申请时间
	private int step;// 审批步骤
	private int status;// 状态
	private String num;// 编号
	private String typeName;// 经费类别Id
	private int applyDepartmentId;
	private String workContent;
	private FundsApproval fundsApproval;

	private List<DataFileInfo> dataFileInfoList;
	private String payDetails;// 支出明细

	private List<File> file;
	private List<String> fileType;
	private List<String> fileFileName;

	private List<String> fileUrl;
	private List<String> fileName;

	private Date startTime;
	private Date endTime;

	private double startMoney;
	private double endMoney;

	private List<FundsApplyStockEntry> fundsApplyStockEntryList;
	private List<String> deviceName;
	private List<Double> deviceMoney;
	private List<Integer> deviceAmount;
	private List<String> deviceRemark;

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

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public int getApplyStaffId() {
		return applyStaffId;
	}

	public void setApplyStaffId(int applyStaffId) {
		this.applyStaffId = applyStaffId;
	}

	public Date getApplyTime() {
		return applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
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

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public int getApplyDepartmentId() {
		return applyDepartmentId;
	}

	public void setApplyDepartmentId(int applyDepartmentId) {
		this.applyDepartmentId = applyDepartmentId;
	}

	public String getWorkContent() {
		return workContent;
	}

	public void setWorkContent(String workContent) {
		this.workContent = workContent;
	}

	public FundsApproval getFundsApproval() {
		return fundsApproval;
	}

	public void setFundsApproval(FundsApproval fundsApproval) {
		this.fundsApproval = fundsApproval;
	}

	public List<FundsApplyStockEntry> getFundsApplyStockEntryList() {
		return fundsApplyStockEntryList;
	}

	public void setFundsApplyStockEntryList(List<FundsApplyStockEntry> fundsApplyStockEntryList) {
		this.fundsApplyStockEntryList = fundsApplyStockEntryList;
	}

	public List<DataFileInfo> getDataFileInfoList() {
		return dataFileInfoList;
	}

	public void setDataFileInfoList(List<DataFileInfo> dataFileInfoList) {
		this.dataFileInfoList = dataFileInfoList;
	}

	public String getPayDetails() {
		return payDetails;
	}

	public void setPayDetails(String payDetails) {
		this.payDetails = payDetails;
	}

	public List<File> getFile() {
		return file;
	}

	public void setFile(List<File> file) {
		this.file = file;
	}

	public List<String> getFileType() {
		return fileType;
	}

	public void setFileType(List<String> fileType) {
		this.fileType = fileType;
	}

	public List<String> getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(List<String> fileFileName) {
		this.fileFileName = fileFileName;
	}

	public List<String> getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(List<String> fileUrl) {
		this.fileUrl = fileUrl;
	}

	public List<String> getFileName() {
		return fileName;
	}

	public void setFileName(List<String> fileName) {
		this.fileName = fileName;
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

	public double getStartMoney() {
		return startMoney;
	}

	public void setStartMoney(double startMoney) {
		this.startMoney = startMoney;
	}

	public double getEndMoney() {
		return endMoney;
	}

	public void setEndMoney(double endMoney) {
		this.endMoney = endMoney;
	}

	public List<String> getDeviceName() {
		return deviceName;
	}

	public void setDeviceName(List<String> deviceName) {
		this.deviceName = deviceName;
	}

	public List<Double> getDeviceMoney() {
		return deviceMoney;
	}

	public void setDeviceMoney(List<Double> deviceMoney) {
		this.deviceMoney = deviceMoney;
	}

	public List<Integer> getDeviceAmount() {
		return deviceAmount;
	}

	public void setDeviceAmount(List<Integer> deviceAmount) {
		this.deviceAmount = deviceAmount;
	}

	public List<String> getDeviceRemark() {
		return deviceRemark;
	}

	public void setDeviceRemark(List<String> deviceRemark) {
		this.deviceRemark = deviceRemark;
	}

	public int getIsSyscg() {
		return isSyscg;
	}

	public void setIsSyscg(int isSyscg) {
		this.isSyscg = isSyscg;
	}

}
