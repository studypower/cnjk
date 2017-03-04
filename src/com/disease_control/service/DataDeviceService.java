package com.disease_control.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.DataDevice;

public class DataDeviceService {

	public Page list(int pageIndex, int pageSize, int typeId, String name) {
		ArrayList paramList = new ArrayList();
		StringBuffer sql = new StringBuffer("select dd.*,ddt.name as type_name from data_device as dd inner join data_device_type as ddt on ddt.id=dd.type_id where 1=1");
		if (typeId != -100) {
			sql.append(" and dd.type_id=?");
			paramList.add(typeId);
		}
		if (name != null && !name.equals("")) {
			sql.append(" and dd.name like ?");
			paramList.add("%" + name + "%");
		}
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		return basalDao.pagedQuery_mysql_sql(sql.toString(), pageIndex, pageSize, params);
	}

	public List list(int typeId) {
		String sql = "select dd.*,ddt.name as type_name from data_device as dd inner join data_device_type as ddt on ddt.id=dd.type_id where 1=1 and dd.type_id=?";
		return basalDao.queryList(sql, new Object[] { typeId });
	}
	
	public Map info(int id){
		String sql = "select dd.*,ddt.id as type_id,ddt.name as type_name from data_device as dd inner join data_device_type as ddt on ddt.id=dd.type_id where 1=1 and dd.id=?";
		return basalDao.queryMap(sql, new Object[] { id });
	}

	public int add_Tx(DataDevice dataDevice) {
		String sql = "insert into data_device(name,type_id) values(?,?)";
		return basalDao.runUSql(sql, new Object[] { dataDevice.getName(), dataDevice.getTypeId() });
	}
	
	public int update_Tx(DataDevice dataDevice){
		String sql="update data_device set name=? where id=?";
		return basalDao.runUSql(sql, new Object[]{dataDevice.getName(),dataDevice.getId()});
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
