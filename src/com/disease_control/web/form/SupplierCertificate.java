package com.disease_control.web.form;

import java.io.File;
import java.util.Date;

import com.disease_control.core.status.BaseForm;

public class SupplierCertificate extends BaseForm {

	private int id;
	private int supplierId;
	private int typeId;
	private String num;
	private String fileUrl1;
	private Date expiryTime;
	private int needInspection;

	private File file1;
	private String file1Type;
	private String file1FileName;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getFileUrl1() {
		return fileUrl1;
	}

	public void setFileUrl1(String fileUrl1) {
		this.fileUrl1 = fileUrl1;
	}

	public Date getExpiryTime() {
		return expiryTime;
	}

	public void setExpiryTime(Date expiryTime) {
		this.expiryTime = expiryTime;
	}

	public int getNeedInspection() {
		return needInspection;
	}

	public void setNeedInspection(int needInspection) {
		this.needInspection = needInspection;
	}

	public File getFile1() {
		if (file1FileName == null || file1FileName.equals("")) {
			return null;
		}
		return file1;
	}

	public void setFile1(File file1) {
		this.file1 = file1;
	}

	public String getFile1Type() {
		return file1Type;
	}

	public void setFile1Type(String file1Type) {
		this.file1Type = file1Type;
	}

	public String getFile1FileName() {
		return file1FileName;
	}

	public void setFile1FileName(String file1FileName) {
		this.file1FileName = file1FileName;
	}

}
