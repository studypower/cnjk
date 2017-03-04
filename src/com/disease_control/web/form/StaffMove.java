package com.disease_control.web.form;

import com.disease_control.core.status.BaseForm;
/**
 * 人员调动
 * @author 
 *
 */
public class StaffMove extends BaseForm{
     private int id;
     //所属人员
     private int staffId;
     //原部门
     private int formerDepartmentId;
     //员职位
     private int formerPositionId;
     //新部门
     private int departmentId;
     //新职位
     private int positionId;
     //调动时间
     private String moveTime;
     
     private int status;
     
     private String startTime;
     private String endTime;
     
     private String name;
     
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStaffId() {
		return staffId;
	}
	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}
	public int getFormerDepartmentId() {
		return formerDepartmentId;
	}
	public void setFormerDepartmentId(int formerDepartmentId) {
		this.formerDepartmentId = formerDepartmentId;
	}
	public int getFormerPositionId() {
		return formerPositionId;
	}
	public void setFormerPositionId(int formerPositionId) {
		this.formerPositionId = formerPositionId;
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
	public String getMoveTime() {
		return moveTime;
	}
	public void setMoveTime(String moveTime) {
		this.moveTime = moveTime;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
