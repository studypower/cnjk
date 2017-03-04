package com.disease_control.web.form;

import java.util.Date;

import com.disease_control.core.status.BaseForm;
/**
 * 会议室信息表
 */
public class MeetingRoomInfo extends BaseForm{

	private int id;
	private String name;
	private String address;
	private int maxCountUse;
	private String remark;
	private String deviceIds;
	private String deviceNames;
	private int active;
	private Date startTime;
	private Date endTime;
	private int status;
	
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getMaxCountUse() {
		return maxCountUse;
	}
	public void setMaxCountUse(int maxCountUse) {
		this.maxCountUse = maxCountUse;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
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
	public String getDeviceIds() {
		return deviceIds;
	}
	public void setDeviceIds(String deviceIds) {
		this.deviceIds = deviceIds;
	}
	public String getDeviceNames() {
		return deviceNames;
	}
	public void setDeviceNames(String deviceNames) {
		this.deviceNames = deviceNames;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

}
