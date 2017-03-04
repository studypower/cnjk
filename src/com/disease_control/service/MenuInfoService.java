package com.disease_control.service;

import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.MenuInfo;

import java.util.List;

public class MenuInfoService {

	public Page list(int pageIndex, int pageSize, String parentKey) {
		if (parentKey == null || "".equals(parentKey)) {
			String sql = "select mi.`key`, mi.name, mi.url, mi.parent_key, mi.status, mi2.name as parent_name from menu_info as mi left join menu_info as mi2 on mi2.`key`=mi.parent_key where mi.parent_key is null";
			return basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, new Object[] {});
		}
		String sql = "select mi.`key`, mi.name, mi.url, mi.parent_key, mi.status, mi2.name as parent_name from menu_info as mi left join menu_info as mi2 on mi2.`key`=mi.parent_key where mi.parent_key=?";
		return basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, new Object[] { parentKey });
	}

	/**
	 * 获取全部导航信息，用于权限分配时生成导航树
	 * 
	 * @return
	 */
	public List list() {
		String sql = "select `key`, parent_key, name from menu_info where status=1";
		return basalDao.queryList(sql, new Object[] {});
	}

	public int add(MenuInfo menuInfo) {
		String sql = "select count(1) from menu_info where `key`=?";
		if (basalDao.queryInt(sql, new Object[] { menuInfo.getKey() }) > 0) {
			return -1;
		}
		sql = "insert into menu_info(`key`,name,url,parent_key,status) values (?,?,?,?,1)";
		return basalDao.runUSql(sql, new Object[] { menuInfo.getKey(), menuInfo.getName(), menuInfo.getUrl(), menuInfo.getParentKey() });
	}

	public Map get(String key) {
		String sql = "select mi.`key`, mi.name, mi.url, mi.parent_key as parent_key, mi2.name as parent_name, count(mi1.`key`) as countChild from menu_info as mi left join menu_info as mi1 on mi.`key`=mi1.parent_key left join menu_info as mi2 on mi2.`key`=mi.parent_key where mi.`key`=?";
		return basalDao.queryMap(sql, new Object[] { key });
	}

	public int update(MenuInfo menuInfo) {
		String sql = "update menu_info set name=?,url=? where `key`=?";
		return basalDao.runUSql(sql, new Object[] { menuInfo.getName(), menuInfo.getUrl(), menuInfo.getKey() });
	}

	public int del(String key, String paterKey) {
		if (paterKey == null || "".equals(paterKey)) {
			String sql = "select count(1) from menu_info where parent_key=?";
			if (basalDao.queryInt(sql, new Object[] { key }) > 0) {
				return -1;
			}
		}
		String sql = "delete from menu_info where `key`=?";
		return basalDao.runUSql(sql, new Object[] { key });
	}

	public String getKey(String url) {
		String sql = "select `key`,name from menu_info where url=? limit 1";
		Map actionInfoMap = basalDao.queryMap(sql, new Object[] { url });
		if (actionInfoMap == null || actionInfoMap.get("key") == null) {
			return null;
		}
		return actionInfoMap.get("key").toString();
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
