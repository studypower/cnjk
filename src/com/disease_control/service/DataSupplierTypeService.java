package com.disease_control.service;

import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.DataSupplierType;
/**
 * 供应商类别
 * @author 
 *
 */
public class DataSupplierTypeService {

	public List list() {
		String sql = "select * from data_supplier_type where status=1";
		return basalDao.queryList(sql, null);
	}
	
	/**
	 * 列表
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public Page list(int pageIndex,int pageSize){
		String sql="select * from data_supplier_type order by id desc";
		return basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, new Object[]{});
	}
	
	/**
	 * 添加
	 * @param dataSupplierType
	 * @return
	 */
	public int add_Tx(DataSupplierType dataSupplierType){
		String sql="select count(1) from data_supplier_type where name=?";
		if(basalDao.queryInt(sql,new Object[]{dataSupplierType.getName()})>0){
			return -1;
		}
		sql="insert into data_supplier_type(name,status) values (?,1)";
		return basalDao.runUSql(sql,new Object[]{dataSupplierType.getName()});
	}
	
	/**
	 * 详情
	 * @param id
	 * @return
	 */
	public Map get(int id){
		String sql="select * from data_supplier_type where id=?";
		return basalDao.queryMap(sql, new Object[]{id});
	}
	
	/**
	 * 修改
	 * @param dataSupplierType
	 * @return
	 */
	public int update_Tx(DataSupplierType dataSupplierType){
		String sql="select count(1) from data_supplier_type where name=? and id<>?";
		if(basalDao.queryInt(sql,new Object[]{dataSupplierType.getName(),dataSupplierType.getId()})>0){
			return -1;
		}
	   sql="update data_supplier_type set name=? where id=?";
		return basalDao.runUSql(sql, new Object[]{dataSupplierType.getName(),dataSupplierType.getId()});
	}
	
	/**
	 * 修改状态
	 * @param id
	 * @param status
	 * @return
	 */
	public int updateStatus_Tx(int id,int status){
		String sql="update data_supplier_type set status=? where id=?";
		return basalDao.runUSql(sql, new Object[]{status,id});
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
