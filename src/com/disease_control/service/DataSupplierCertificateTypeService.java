package com.disease_control.service;

import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.DataSupplierCertificateType;
import com.disease_control.web.form.DataSupplierType;
/**
 * 供应商证书类别
 * @author 
 *
 */
public class DataSupplierCertificateTypeService {

	public List list() {
		String sql = "select * from data_supplier_certificate_type";
		return basalDao.queryList(sql, null);
	}


	/**
	 * 列表
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public Page list(int pageIndex,int pageSize){
		String sql="select * from data_supplier_certificate_type order by id desc";
		return basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, new Object[]{});
	}
	
	/**
	 * 添加
	 * @param dataSupplierCertificateType
	 * @return
	 */
	public int add_Tx(DataSupplierCertificateType dataSupplierCertificateType) {
		String sql="select count(1) from data_supplier_certificate_type where name=?";
		if(basalDao.queryInt(sql,new Object[]{dataSupplierCertificateType.getName()})>0){
			return -1;
		}
	    sql = "insert into data_supplier_certificate_type(name) values(?)";
		return basalDao.runUSql(sql, new Object[] { dataSupplierCertificateType.getName() });
	}
	
	
	/**
	 * 详情
	 * @param id
	 * @return
	 */
	public Map get(int id){
		String sql="select * from data_supplier_certificate_type where id=?";
		return basalDao.queryMap(sql, new Object[]{id});
	}
	
	/**
	 * 修改
	 * @param dataSupplierCertificateType
	 * @return
	 */
	public int update_Tx(DataSupplierCertificateType dataSupplierCertificateType){
		String sql="select count(1) from data_supplier_certificate_type where name=? and id<>?";
		if(basalDao.queryInt(sql,new Object[]{dataSupplierCertificateType.getName(),dataSupplierCertificateType.getId()})>0){
			return -1;
		}
	   sql="update data_supplier_certificate_type set name=? where id=?";
		return basalDao.runUSql(sql, new Object[]{dataSupplierCertificateType.getName(),dataSupplierCertificateType.getId()});
	}
	

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
