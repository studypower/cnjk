package com.disease_control.web.form;

import java.io.File;
import java.util.Date;

import com.disease_control.core.status.BaseForm;

public class SupplierInfo extends BaseForm {

	private int id;
	private String name;
	private int type;
	private String contactName;
	private String contactPhone;
	private String address;
	private int complexLevel;
	private int staffId;
	private Date createTime;
	private Date lastInspectionTime;
	private String businessLicenseNum;
	private String businessLicenseFileUrl;
	private Date businessLicenseExpiryTime;
	private File file;
	private String fileContentType;
	private String fileFileName;
	private int status;
	
	private Date startTime;
	private Date endTime;

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

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getComplexLevel() {
		return complexLevel;
	}

	public void setComplexLevel(int complexLevel) {
		this.complexLevel = complexLevel;
	}

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getContactPhone() {
		return contactPhone;
	}

	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getStaffId() {
		return staffId;
	}

	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getLastInspectionTime() {
		return lastInspectionTime;
	}

	public void setLastInspectionTime(Date lastInspectionTime) {
		this.lastInspectionTime = lastInspectionTime;
	}

	public String getBusinessLicenseNum() {
		return businessLicenseNum;
	}

	public void setBusinessLicenseNum(String businessLicenseNum) {
		this.businessLicenseNum = businessLicenseNum;
	}

	public String getBusinessLicenseFileUrl() {
		return businessLicenseFileUrl;
	}

	public void setBusinessLicenseFileUrl(String businessLicenseFileUrl) {
		this.businessLicenseFileUrl = businessLicenseFileUrl;
	}

	public Date getBusinessLicenseExpiryTime() {
		return businessLicenseExpiryTime;
	}

	public void setBusinessLicenseExpiryTime(Date businessLicenseExpiryTime) {
		this.businessLicenseExpiryTime = businessLicenseExpiryTime;
	}

	public File getFile() {
		if(fileFileName==null||"".equals(fileFileName)){
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
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

}
