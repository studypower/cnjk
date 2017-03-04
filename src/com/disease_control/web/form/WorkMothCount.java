package com.disease_control.web.form;

import java.util.Date;

import com.disease_control.core.status.BaseForm;
/**
 * 约汇表
 * @author 
 *
 */
public class WorkMothCount extends BaseForm{
	
	private int id;
	private int staffId;
	private Date startTime;
    private Date endTime;
    private Double quanqinCount;
    private Double gjCount;
    private Double txCount;
    private Double bjCount;
    private Double sjCount;
    private Double wcCount;
    private Double dsCount;
    private Double jxCount;
    private Double queqinCount;
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
	public Double getQuanqinCount() {
		return quanqinCount;
	}
	public void setQuanqinCount(Double quanqinCount) {
		this.quanqinCount = quanqinCount;
	}
	public Double getGjCount() {
		return gjCount;
	}
	public void setGjCount(Double gjCount) {
		this.gjCount = gjCount;
	}
	public Double getTxCount() {
		return txCount;
	}
	public void setTxCount(Double txCount) {
		this.txCount = txCount;
	}
	public Double getBjCount() {
		return bjCount;
	}
	public void setBjCount(Double bjCount) {
		this.bjCount = bjCount;
	}
	public Double getSjCount() {
		return sjCount;
	}
	public void setSjCount(Double sjCount) {
		this.sjCount = sjCount;
	}
	public Double getWcCount() {
		return wcCount;
	}
	public void setWcCount(Double wcCount) {
		this.wcCount = wcCount;
	}
	public Double getDsCount() {
		return dsCount;
	}
	public void setDsCount(Double dsCount) {
		this.dsCount = dsCount;
	}
	public Double getJxCount() {
		return jxCount;
	}
	public void setJxCount(Double jxCount) {
		this.jxCount = jxCount;
	}
	public Double getQueqinCount() {
		return queqinCount;
	}
	public void setQueqinCount(Double queqinCount) {
		this.queqinCount = queqinCount;
	}
}
