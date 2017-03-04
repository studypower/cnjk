package com.disease_control.web.form;

import com.disease_control.core.status.BaseForm;

/***
 * 供应商类别
 * @author 
 *
 */
public class DataSupplierType extends BaseForm{
     
	private int id;
	private String name;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
