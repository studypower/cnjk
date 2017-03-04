package com.disease_control.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.RoleInfo;

public class RoleInfoService {
	public Page list(int pageIndex, int pageSize) {
		String sql = "select id, name, status, insert_time from role_info where status=1";
		return basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, new Object[] {});
	}

	public Page list(int pageIndex, int pageSize, String name) {
		if (name == null || name.equals("")) {
			return list(pageIndex, pageSize);
		}
		String sql = "select id, name, status, insert_time from role_info where name like ? and status=1";
		return basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, new Object[] { "%" + name + "%" });
	}

	public int add_Tx(RoleInfo roleInfo) {
		String sql = "select count(1) from role_info where name = ? and status=1";
		if (basalDao.queryInt(sql, new Object[] { roleInfo.getName() }) == 1) {
			return 0;
		}
		sql = "insert into role_info(name,status,insert_time) values(?, 1, now())";
		int resultInt = basalDao.runUSql(sql, new Object[] { roleInfo.getName() });
		if (resultInt == 1 && roleInfo.getMenuKeys() != null && !roleInfo.getMenuKeys().equals("")) {
			sql = "select max(id) from role_info where name=? and status=1";
			int roleId = basalDao.queryInt(sql, new Object[] { roleInfo.getName() });
			String[] menuKeys = roleInfo.getMenuKeys().split(",");
			List<Object[]> paramsList = new ArrayList<Object[]>();
			for (String menuKey : menuKeys) {
				paramsList.add(new Object[] { roleId, menuKey });
			}
			basalDao.runUSqls("insert into role_menu(role_id, menu_key) values(?,?)", paramsList);
		}
		return resultInt;
	}

	public int del(int id) {
		//String sql = "update role_info set status=0 where id=? and status=1";
		String sql = "delete from role_info where id=?";
		return basalDao.runUSql(sql, new Object[] { id });
	}

	public Map get(int id) {
		String sql = "select id, name, status, insert_time from role_info where id=?";
		return basalDao.queryMap(sql, new Object[] { id });
	}

	public int update(RoleInfo roleInfo) {
		String sql = "update role_info set name=? where id=?";
		int resultInt = basalDao.runUSql(sql, new Object[] { roleInfo.getName(), roleInfo.getId() });
		if (resultInt == 1 && roleInfo.getMenuKeys() != null && !roleInfo.getMenuKeys().equals("")) {
			sql = "delete from role_menu where role_id=?";
			basalDao.runUSql(sql, new Object[] { roleInfo.getId() });
			String[] menuKeys = roleInfo.getMenuKeys().split(",");
			List<Object[]> paramsList = new ArrayList<Object[]>();
			for (String menuKey : menuKeys) {
				paramsList.add(new Object[] { roleInfo.getId(), menuKey });
			}
			basalDao.runUSqls("insert into role_menu(role_id, menu_key) values(?,?)", paramsList);
		}
		return resultInt;
	}

	public List list() {
		String sql = "select id, name, status, insert_time from role_info where status=1";
		return basalDao.queryList(sql, new Object[] {});
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}
}
