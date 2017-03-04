package com.disease_control.web.form;

import java.util.List;

import com.disease_control.core.status.BaseForm;

@SuppressWarnings("serial")
public class TzggForm extends BaseForm {

	private int id;
	private String keyword;
	private String startTime;
	private String endTime;
	private String status;
	private String topSort;
	private String top;

	private String noticeContent;// 内容
	private String notice;// 标题
	private List accepts;// 接收者

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTopSort() {
		return topSort;
	}

	public void setTopSort(String topSort) {
		this.topSort = topSort;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNotice() {
		return notice;
	}

	public void setNotice(String notice) {
		this.notice = notice;
	}

	public List getAccepts() {
		return accepts;
	}

	public void setAccepts(List accepts) {
		this.accepts = accepts;
	}

	public String getTop() {
		return top;
	}

	public void setTop(String top) {
		this.top = top;
	}
}
