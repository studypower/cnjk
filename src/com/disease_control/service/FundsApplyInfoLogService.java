package com.disease_control.service;

import java.util.Map;

import com.disease_control.db.dao.BasalDao;

public class FundsApplyInfoLogService {
	
	/**
	 * 获取详情
	 * 
	 * @param id
	 * @return
	 */
	public Map info(int approvalId) {
		String sql = "select fai.*,si.name as applyStaffName,di.name as applyDepartmentName from funds_apply_info_log as fai inner join staff_info as si on fai.apply_staff_id=si.id inner join department_info as di on fai.apply_department_id=di.id and di.status=1 where fai.approval_id=?";
		Map map = basalDao.queryMap(sql, new Object[] {approvalId});
		return map;
	}
	
	
	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
