package com.disease_control.service;

import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.DataMzInfo;
import com.disease_control.web.form.DataZzmmInfo;

public class DataZzmmInfoService {

	public Page list(int pageIndex, int pageSize) {
		String sql = "select * from data_zzmm_info";
		return basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, new Object[] {});
	}

	public int add_Tx(DataZzmmInfo dataZzmmInfo) {
		String sql = "insert into data_zzmm_info(name) values(?)";
		return basalDao.runUSql(sql, new Object[] { dataZzmmInfo.getName() });
	}

	public Map get(int id) {
		String sql = "select * from data_zzmm_info where id=?";
		return basalDao.queryMap(sql, new Object[] { id });
	}

	public int update_Tx(DataZzmmInfo dataZzmmInfo) {
		String sql = "update data_zzmm_info set name=? where id=?";
		return basalDao.runUSql(sql, new Object[] { dataZzmmInfo.getName(), dataZzmmInfo.getId() });

	}

	public int del_Tx(int id) {
		String sql = "delete from data_zzmm_info where id=?";
		return basalDao.runUSql(sql, new Object[] { id });
	}

	public List list() {
		String sql = "select * from data_zzmm_info";
		return basalDao.queryList(sql, new Object[] {});
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
