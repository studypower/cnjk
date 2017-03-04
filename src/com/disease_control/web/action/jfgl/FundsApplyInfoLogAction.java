package com.disease_control.web.action.jfgl;

import com.disease_control.core.status.BaseAction;
import com.disease_control.service.FundsApplyInfoLogService;
import com.disease_control.web.form.FundsApplyInfoLog;

/**
 * 经费管理
 * 
 * @author
 * 
 */
public class FundsApplyInfoLogAction extends BaseAction<FundsApplyInfoLog> {

	/**
	 * 详情
	 * 
	 * @return
	 */
	public String info() {
		initRequest();
		FundsApplyInfoLog fundsApplyInfoLog=getForm();
		request.setAttribute("fundsApplyInfoLog", fundsApplyInfoLogService.info(fundsApplyInfoLog.getApprovalId()));
		return SUCCESS;
	}

	private FundsApplyInfoLogService fundsApplyInfoLogService;

	public void setFundsApplyInfoLogService(FundsApplyInfoLogService fundsApplyInfoLogService) {
		this.fundsApplyInfoLogService = fundsApplyInfoLogService;
	}
	

}
