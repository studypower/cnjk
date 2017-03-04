package com.disease_control.service;

import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;

public class MsgInfoService {

	public int countMsg(int staffId) {
		String sql = "select count(1) from msg_info where msg_status=0 and msg_addressee = ?";
		return basalDao.queryInt(sql, new Object[] { staffId });
	}

	public Page list(int pageIndex, int pageSize, int staffId) {
		String sql = "select * from msg_info where msg_addressee = ? order by msg_time desc,id desc";
		return basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, new Object[] { staffId });
	}

	public void read(int id, int staffId) {
		if (id != 0) {
			basalDao.runUSql("update msg_info set msg_status=1 where id = ?", new Object[] { id });
		} else {
			basalDao.runUSql("update msg_info set msg_status=1 where msg_addressee = ?", new Object[] { staffId });
		}
	}

	public void del(int id) {
		basalDao.runUSql("delete from msg_info where id = ?", new Object[] { id });
	}

	public Map info(int id) {
		return basalDao.queryMap("select * from msg_info where id=?", new Object[] { id });
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
