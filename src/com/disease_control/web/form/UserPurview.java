package com.disease_control.web.form;

import com.disease_control.core.status.BaseForm;
   /**
    * 权限信息
    * @author
    *
    */
public class UserPurview extends BaseForm{
	//权限Id
	private int id;
	//用户ID
	private int userId;
	//动作ID
	private int actionId;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getActionId() {
		return actionId;
	}
	public void setActionId(int actionId) {
		this.actionId = actionId;
	}

}
