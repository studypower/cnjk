package com.disease_control.service;

import java.util.List;

import com.disease_control.db.dao.BasalDao;

public class UserMenuService {

	public List list(int userId) {
		String sql = "select id,user_id,menu_key from user_menu where user_id=?";
		return basalDao.queryList(sql, new Object[] { userId });
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
