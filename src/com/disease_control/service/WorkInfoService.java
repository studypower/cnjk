package com.disease_control.service;

import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.WorkInfo;

/**
 * 考勤记录表
 * @author 
 *
 */
public class WorkInfoService {
	
	
	
	public int add_Tx(WorkInfo workInfo){
		String sql="delete from work_info where staff_id=? and start_time>=? and end_time<=?";
		int resultInt=basalDao.runUSql(sql,new Object[]{workInfo.getStaffId(),workInfo.getStartTime(),workInfo.getEndTime()});
		sql="insert into work_info(staff_id,type_id,entry_id,start_time,end_time,remark,audit_status) values (?,?,?,?,?,?)";
		resultInt=basalDao.runUSql(sql,new Object[]{workInfo.getStaffId(),workInfo.getTypeId(),workInfo.getEntryId(),workInfo.getStartTime(),workInfo.getEndTime(),workInfo.getRemark(),workInfo.getAuditStatus()});
		if(resultInt>0){
			if(workInfo.getTypeId()!=3 && workInfo.getTypeId()!=4){//如果不为值班和请假
				sql="delete from work_log where staff_id=? and start_time>=? and end_time<=?";
				resultInt=basalDao.runUSql(sql,new Object[]{workInfo.getStaffId(),workInfo.getStartTime(),workInfo.getEndTime()});
				
			}
		}
		return resultInt;
	}
	
	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
