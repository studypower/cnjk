package com.disease_control.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.DepartmentPosition;

public class DepartmentPositionService {

	public Page list(int pageIndex, int pageSize, int departmentId,String name) {
		List paramList=new ArrayList();
		String sql = "select dp.id as id, di.id as department_id, di.name as department_name, pi.id as position_id, pi.name as position_name from department_position as dp inner join department_info as di on di.id=dp.department_id inner join position_info as pi on pi.id=dp.position_id where di.id=?";
		paramList.add(departmentId);
		if(name!=null && !"".equals(name)){
			sql+=" and pi.name like ?";
			paramList.add("%"+name+"%");
		}
		Object[] params=new Object[paramList.size()];
		for(int i=0;i<paramList.size();i++){
			params[i]=paramList.get(i);
		}
		return basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize,params);
	}

	public int add(DepartmentPosition departmentPosition) {
		String sql = "select count(1) from department_position where department_id=? and position_id=?";
		if (basalDao.queryInt(sql, new Object[] { departmentPosition.getDepartmentId(), departmentPosition.getPositionId() }) == 1) {
			return 0;
		}
		sql = "insert into department_position(department_id,position_id) values(?,?)";
		return basalDao.runUSql(sql, new Object[] { departmentPosition.getDepartmentId(), departmentPosition.getPositionId() });
	}

	public int update(DepartmentPosition departmentPosition) {
		String sql = "update department_position set department_id=?,position_id=? where id=?";
		return basalDao.runUSql(sql, new Object[] { departmentPosition.getDepartmentId(), departmentPosition.getPositionId(), departmentPosition.getId() });
	}

	public int del(int id) {
		String sql = "delete from department_position where id=?";
		return basalDao.runUSql(sql, new Object[] { id });
	}

	public Map get(int id) {
		String sql = "select dp.id as id,di.id as department_id, di.name as department_name, pi.id as position_id, pi.name as position_name from department_position as dp inner join department_info as di on di.id=dp.department_id inner join position_info as pi on pi.id=dp.position_id where dp.id=?";
		return basalDao.queryMap(sql, new Object[] { id });
	}

	public List list(int departmentId) {
		String sql = "select pi.id as position_id, pi.name as position_name from department_position as dp inner join department_info as di on di.id=dp.department_id inner join position_info as pi on pi.id=dp.position_id where di.id=?";
		return basalDao.queryList(sql, new Object[] { departmentId });
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
