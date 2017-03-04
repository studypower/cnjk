package com.disease_control.service;

import java.util.List;

import com.disease_control.db.dao.BasalDao;

public class DataSystemService {

	public List list(String label) {
		String sql = "select * from data_system where label=?";
		return basalDao.queryList(sql, new Object[] { label });
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
