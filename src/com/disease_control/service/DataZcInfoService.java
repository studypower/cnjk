package com.disease_control.service;

import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.DataZcInfo;

public class DataZcInfoService {

	public Page list(int pageIndex, int pageSize) {
		String sql = "select * from data_zc_info";
		return basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, new Object[] {});
	}

	public int add_Tx(DataZcInfo dataZcInfo) {
		String sql = "insert into data_zc_info(name) values(?)";
		return basalDao.runUSql(sql, new Object[] { dataZcInfo.getName() });
	}

	public Map get(int id) {
		String sql = "select * from data_zc_info where id=?";
		return basalDao.queryMap(sql, new Object[] { id });
	}

	public int update_Tx(DataZcInfo dataZcInfo) {
		String sql = "update data_zc_info set name=? where id=?";
		return basalDao.runUSql(sql, new Object[] { dataZcInfo.getName(), dataZcInfo.getId() });

	}

	public int del_Tx(int id) {
		String sql = "delete from data_zc_info where id=?";
		return basalDao.runUSql(sql, new Object[] { id });
	}

	public List list() {
		String sql = "select * from data_zc_info";
		return basalDao.queryList(sql, new Object[] {});
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
