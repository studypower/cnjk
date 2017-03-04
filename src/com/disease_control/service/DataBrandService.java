package com.disease_control.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.DataBrand;

public class DataBrandService {

	public Page list(int pageIndex, int pageSize, int deviceId, String name) {
		ArrayList paramList = new ArrayList();
		StringBuffer sql = new StringBuffer("select db.*,dd.name as device_name from data_brand as db inner join data_device as dd on dd.id=db.device_id where 1=1");
		if (deviceId != -100) {
			sql.append(" and db.device_id = ?");
			paramList.add(deviceId);
		}
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

	public Map info(int id) {
		String sql = "select db.*,dd.id as device_id,dd.name as device_name from data_brand as db inner join data_device as dd on dd.id=db.device_id where 1=1 and db.id=?";
		return basalDao.queryMap(sql, new Object[] { id });
	}

	public int add_Tx(DataBrand dataBrand) {
		String sql = "insert into data_brand(name,device_id) values(?,?)";
		return basalDao.runUSql(sql, new Object[] { dataBrand.getName(), dataBrand.getDeviceId() });
	}

	public List list(int deviceId) {
		String sql = "select db.*,dd.name as device_name from data_brand as db inner join data_device as dd on dd.id=db.device_id where 1=1 and db.device_id = ?";
		return basalDao.queryList(sql, new Object[] { deviceId });
	}
	
	public int update_Tx(DataBrand dataBrand){
		String sql="update data_brand set name=? where id=?";
		return basalDao.runUSql(sql,new Object[]{dataBrand.getName(),dataBrand.getId()});
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
