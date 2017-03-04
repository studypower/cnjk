package com.disease_control.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.DataDeviceType;

public class DataDeviceTypeService {

	public Page list(int pageIndex, int pageSize, String name) {
		ArrayList paramList = new ArrayList();
		StringBuffer sql = new StringBuffer("select * from data_device_type where 1=1");
		if (name != null && !name.equals("")) {
			sql.append(" and name like ?");
			paramList.add("%" + name + "%");
		}
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		return basalDao.pagedQuery_mysql_sql(sql.toString(), pageIndex, pageSize, params);
	}

	public List list() {
		String sql = "select * from data_device_type";
		return basalDao.queryList(sql, null);
	}

	public Map info(int id) {
		String sql = "select * from data_device_type where id=?";
		return basalDao.queryMap(sql, new Object[] { id });
	}

	public int add_Tx(DataDeviceType dataDeviceType) {
		String sql = "insert into data_device_type(name) values(?)";
		return basalDao.runUSql(sql, new Object[] { dataDeviceType.getName() });
	}
	
	public int update_Tx(DataDeviceType dataDeviceType){
		String sql="update data_device_type set name=? where id=?";
		return basalDao.runUSql(sql,new Object[]{dataDeviceType.getName(),dataDeviceType.getId()});
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
