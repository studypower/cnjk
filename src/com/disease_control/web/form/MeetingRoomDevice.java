package com.disease_control.web.form;

import com.disease_control.core.status.BaseForm;
/**
 * 会议室设备表
 * @author 
 *
 */
public class MeetingRoomDevice extends BaseForm{
    
	private int id;
	private String deviceName;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDeviceName() {
		return deviceName;
	}
	public void setDeviceName(String deviceName) {
		this.deviceName = deviceName;
	}
}
