package com.disease_control.web.form;

import java.util.Date;

import com.disease_control.core.status.BaseForm;
/**
 * 工作日管理表
 * @author tangxian
 *
 */
public class WorkDatePlan extends BaseForm{
	private Date planTime;//日期
	private int type;//上班/公休
	public Date getPlanTime() {
		return planTime;
	}
	public void setPlanTime(Date planTime) {
		this.planTime = planTime;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}

}
