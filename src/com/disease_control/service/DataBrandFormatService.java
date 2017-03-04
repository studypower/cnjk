package com.disease_control.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.DataBrandFormat;

public class DataBrandFormatService {

	public Page list(int pageIndex, int pageSize, int brandId, String name) {
		ArrayList paramList = new ArrayList();
		StringBuffer sql = new StringBuffer("select dbf.*,db.name as brand_name from data_brand_format as dbf inner join data_brand as db on db.id=dbf.brand_id where 1=1");
		if (brandId != -100) {
			sql.append(" and dbf.brand_id=?");
			paramList.add(brandId);
		}
		if (name != null && !name.equals("")) {
			sql.append(" and dbf.name like ?");
			paramList.add("%" + name + "%");
		}
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		return basalDao.pagedQuery_mysql_sql(sql.toString(), pageIndex, pageSize, params);
	}

	public int add_Tx(DataBrandFormat dataBrandFormat) {
		String sql = "insert into data_brand_format(name,brand_id,money) values(?,?,?)";
		return basalDao.runUSql(sql, new Object[] { dataBrandFormat.getName(), dataBrandFormat.getBrandId(),dataBrandFormat.getMoney()});
	}
	
	public Map get(int id){
		String sql="select dbf.*,db.id as brand_id,db.name as brand_name from data_brand_format as dbf inner join data_brand as db on db.id=dbf.brand_id where dbf.id=?";
		return basalDao.queryMap(sql, new Object[]{id});
	}
	
	public int update_Tx(DataBrandFormat dataBrandFormat){
		String sql="update data_brand_format set name=?,money=? where id=?";
		return basalDao.runUSql(sql, new Object[]{dataBrandFormat.getName(),dataBrandFormat.getMoney(),dataBrandFormat.getId()});
	}

	public List list(int brandId) {
		String sql = "select dbf.*,db.name as brand_name from data_brand_format as dbf inner join data_brand as db on db.id=dbf.brand_id where 1=1 and dbf.brand_id=?";
		return basalDao.queryList(sql, new Object[] { brandId });
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
