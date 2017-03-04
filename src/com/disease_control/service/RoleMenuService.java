package com.disease_control.service;

import java.util.List;

import com.disease_control.db.dao.BasalDao;

public class RoleMenuService {

	public List list(int roleId) {
		String sql = "select id,role_id,menu_key from role_menu where role_id=?";
		return basalDao.queryList(sql, new Object[] { roleId });
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
