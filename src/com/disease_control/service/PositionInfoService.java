package com.disease_control.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.PositionInfo;

/**
 * 职位管理
 * 
 * @author
 * 
 */
public class PositionInfoService {

	public List list(int departmentId) {
		String sql = "select pi.id as id,pi.name as name from department_position as dp left join position_info as pi on dp.position_id=pi.id where dp.department_id=? and pi.status=1";
		return basalDao.queryList(sql, new Object[] { departmentId });
	}

	public List list() {
		String sql = "select id,name from position_info where status=1";
		return basalDao.queryList(sql, new Object[] {});
	}

	public Page list(int pageIndex, int pageSize, String name) {
		List paramList = new ArrayList();
		String sql = "select id,name,status from position_info where 1=1";
		if (name != null && !"".equals(name)) {
			sql += " and name like ?";
			paramList.add("%" + name + "%");
		}
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		return basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, params);
	}

	public int add(PositionInfo positionInfo) {
		String sql = "select count(1) from position_info where name=?";
		if (basalDao.queryInt(sql, new Object[] { positionInfo.getName() }) > 0) {
			return 0;
		}
		sql = "insert into position_info(name,status) values(?,?)";
		return basalDao.runUSql(sql, new Object[] { positionInfo.getName(), positionInfo.getStatus() });
	}

	public Map get(int id) {
		String sql = "select id,name,status from position_info where id=?";
		return basalDao.queryMap(sql, new Object[] { id });
	}

	public int update(PositionInfo positionInfo) {
		String sql = "select count(1) from position_info where name=?";
		if (basalDao.queryInt(sql, new Object[] { positionInfo.getName() }) > 0) {
			sql = "update position_info set status=? where id=?";
			return basalDao.runUSql(sql, new Object[] { positionInfo.getStatus(), positionInfo.getId() });
		}
		sql = "update position_info set name=?,status=? where id=?";
		return basalDao.runUSql(sql, new Object[] { positionInfo.getName(), positionInfo.getStatus(), positionInfo.getId() });
	}

	public int updtestatus(int id, int status) {
		String sql = "update position_info set status=? where id=?";
		return basalDao.runUSql(sql, new Object[] { status, id });
	}

	public void del(int id) {
		String sql = "delete from position_info where id=?";
		basalDao.runUSql(sql, new Object[] { id });
		sql = "update staff_info set position_id=0 where position_id=?";
		basalDao.runUSql(sql, new Object[] { id });
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}
}
