package com.disease_control.service;

import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.DataMzInfo;

public class DataMzInfoService {

	public Page list(int pageIndex, int pageSize) {
		String sql = "select * from data_mz_info";
		return basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, new Object[] {});
	}

	public int add_Tx(DataMzInfo dataMzInfo) {
		String sql = "insert into data_mz_info(name) values(?)";
		return basalDao.runUSql(sql, new Object[] { dataMzInfo.getName() });
	}

	public Map get(int id) {
		String sql = "select * from data_mz_info where id=?";
		return basalDao.queryMap(sql, new Object[] { id });
	}

	public int update_Tx(DataMzInfo dataMzInfo) {
		String sql = "update data_mz_info set name=? where id=?";
		return basalDao.runUSql(sql, new Object[] { dataMzInfo.getName(), dataMzInfo.getId() });

	}

	public int del_Tx(int id) {
		String sql = "delete from data_mz_info where id=?";
		return basalDao.runUSql(sql, new Object[] { id });
	}

	public List list() {
		String sql = "select * from data_mz_info";
		return basalDao.queryList(sql, new Object[] {});
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
