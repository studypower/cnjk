package com.disease_control.web.form;

import java.util.Date;

import com.disease_control.core.status.BaseForm;

public class AssetsInfoLog extends BaseForm{
	private int id;
	private int type;//1.发放 2.归还 3.维修  4.正常
	private int assetsId;//固定资产表Id
    private int operatingStaffId;//操作人
    private Date operatingTime;//操作时间
    private int useStaffId;//使用人
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getAssetsId() {
		return assetsId;
	}
	public void setAssetsId(int assetsId) {
		this.assetsId = assetsId;
	}
	public int getOperatingStaffId() {
		return operatingStaffId;
	}
	public void setOperatingStaffId(int operatingStaffId) {
		this.operatingStaffId = operatingStaffId;
	}
	public Date getOperatingTime() {
		return operatingTime;
	}
	public void setOperatingTime(Date operatingTime) {
		this.operatingTime = operatingTime;
	}
	public int getUseStaffId() {
		return useStaffId;
	}
	public void setUseStaffId(int useStaffId) {
		this.useStaffId = useStaffId;
	}
}
