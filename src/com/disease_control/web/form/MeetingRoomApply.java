package com.disease_control.web.form;

import java.util.Date;

import com.disease_control.core.status.BaseForm;
/**
 * 会议室申请
 * @author 
 *
 */
public class MeetingRoomApply extends BaseForm{
	private int id;
	private int meetingRoomId;//会议室Id
	private int departmentId;//部门Id
	private int applyStaffId;//申请人
	private Date  applyTime;//申请时间
	private Date meetingStartTime;//会议开始时间
	private Date meetingEndTime;//会议结束时间
    private String meetingTheme;//会议主题
    private String meetingContent;//会议内容
    private int meetingStaffCount;//与会人数
    private String meetingStaffNames;//与会人员
    private String meetingDeviceIds;//需要设备
    private String remark;//备注
    private int auditStaffId;//涉河人
    private Date auditTime;//审核时间
    private int status;//状态
    private int day;
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMeetingRoomId() {
		return meetingRoomId;
	}
	public void setMeetingRoomId(int meetingRoomId) {
		this.meetingRoomId = meetingRoomId;
	}
	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
	public int getApplyStaffId() {
		return applyStaffId;
	}
	public void setApplyStaffId(int applyStaffId) {
		this.applyStaffId = applyStaffId;
	}
	public String getMeetingTheme() {
		return meetingTheme;
	}
	public void setMeetingTheme(String meetingTheme) {
		this.meetingTheme = meetingTheme;
	}
	public String getMeetingContent() {
		return meetingContent;
	}
	public void setMeetingContent(String meetingContent) {
		this.meetingContent = meetingContent;
	}
	public int getMeetingStaffCount() {
		return meetingStaffCount;
	}
	public void setMeetingStaffCount(int meetingStaffCount) {
		this.meetingStaffCount = meetingStaffCount;
	}
	public String getMeetingStaffNames() {
		return meetingStaffNames;
	}
	public void setMeetingStaffNames(String meetingStaffNames) {
		this.meetingStaffNames = meetingStaffNames;
	}
	public String getMeetingDeviceIds() {
		return meetingDeviceIds;
	}
	public void setMeetingDeviceIds(String meetingDeviceIds) {
		this.meetingDeviceIds = meetingDeviceIds;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getAuditStaffId() {
		return auditStaffId;
	}
	public void setAuditStaffId(int auditStaffId) {
		this.auditStaffId = auditStaffId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Date getApplyTime() {
		return applyTime;
	}
	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}
	public Date getMeetingStartTime() {
		return meetingStartTime;
	}
	public void setMeetingStartTime(Date meetingStartTime) {
		this.meetingStartTime = meetingStartTime;
	}
	public Date getMeetingEndTime() {
		return meetingEndTime;
	}
	public void setMeetingEndTime(Date meetingEndTime) {
		this.meetingEndTime = meetingEndTime;
	}
	public Date getAuditTime() {
		return auditTime;
	}
	public void setAuditTime(Date auditTime) {
		this.auditTime = auditTime;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
}
