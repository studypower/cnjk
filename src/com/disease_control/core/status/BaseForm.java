package com.disease_control.core.status;

import java.io.Serializable;

public class BaseForm implements Serializable {

	private int pageSize = 20;
	private int pageIndex = 1;

	private int rows = 20;
	private int page = 1;

	private String sidx;
	private String sord;

	public int getPageSize() {
		pageSize = rows;
		if (pageSize < 1) {
			pageSize = 1;
		}
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageIndex() {
		pageIndex = page;
		if (pageIndex < 1) {
			pageIndex = 1;
		}
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getSidx() {
		return sidx;
	}

	public void setSidx(String sidx) {
		this.sidx = sidx;
	}

	public String getSord() {
		return sord;
	}

	public void setSord(String sord) {
		this.sord = sord;
	}

}
