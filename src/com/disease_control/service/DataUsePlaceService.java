package com.disease_control.service;

import java.util.ArrayList;
import java.util.List;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.DataUsePlace;

public class DataUsePlaceService {

	public Page list(int pageIndex, int pageSize) {
		ArrayList paramList = new ArrayList();
		StringBuffer sql = new StringBuffer("select dup.*,di.name as department_name from data_use_place as dup inner join department_info as di on di.id=dup.department_id where 1=1");
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		return basalDao.pagedQuery_mysql_sql(sql.toString(), pageIndex, pageSize, params);
	}

	public int add_Tx(DataUsePlace dataUsePlace) {
		String sql = "insert into data_use_place(department_id,room_num) values(?,?)";
		return basalDao.runUSql(sql, new Object[] { dataUsePlace.getDepartmentId(), dataUsePlace.getRoomNum() });
	}

	public List list() {
		String sql = "select dup.*,di.name as department_name from data_use_place as dup inner join department_info as di on di.id=dup.department_id where 1=1";
		return basalDao.queryList(sql, null);
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
