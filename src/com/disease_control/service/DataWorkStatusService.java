package com.disease_control.service;

import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.DataWorkStatus;

public class DataWorkStatusService {

	public List list() {
		String sql = "select * from data_work_status";
		return basalDao.queryList(sql, null);
	}

	public Page list(int pageIndex, int pageSize) {
		String sql = "select * from data_work_status";
		return basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, null);
	}

	public Map info(int id) {
		String sql = "select * from data_work_status where id=?";
		return basalDao.queryMap(sql, new Object[] { id });
	}

	public void save(DataWorkStatus dataWorkStatus) {
		String sql = "insert into data_work_status(name,is_system) values(?,?)";
		basalDao.runUSql(sql, new Object[] { dataWorkStatus.getName(), 0 });
	}

	public void update(DataWorkStatus dataWorkStatus) {
		String sql = "update data_work_status set name=? where id=?";
		basalDao.runUSql(sql, new Object[] { dataWorkStatus.getName(), dataWorkStatus.getId() });
	}

	public void del(int id) {
		String sql = "delete from data_work_status where id=?";
		basalDao.runUSql(sql, new Object[] { id });
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}
}
