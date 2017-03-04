package com.disease_control.service;

import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.SupplierCertificate;

public class SupplierCertificateService {

	public Page list(int supplierId, int pageIndex, int pageSize) {
		StringBuffer sql = new StringBuffer("select sc.*,si.name as supplier_name,dsct.name as type_name from supplier_certificate as sc");
		sql.append(" inner join supplier_info as si on si.id=sc.supplier_id");
		sql.append(" inner join data_supplier_certificate_type as dsct on dsct.id=sc.type_id");
		sql.append(" where sc.supplier_id=?");
		return basalDao.pagedQuery_mysql_sql(sql.toString(), pageIndex, pageSize, new Object[] { supplierId });
	}

	public int add_Tx(SupplierCertificate supplierCertificate) {
		String sql = "insert into supplier_certificate(supplier_id,type_id,num,file_url1,expiry_time,need_inspection) values(?,?,?,?,?,?)";
		return basalDao.runUSql(sql, new Object[] { supplierCertificate.getSupplierId(), supplierCertificate.getTypeId(), supplierCertificate.getNum(), supplierCertificate.getFileUrl1(),
				supplierCertificate.getExpiryTime(), supplierCertificate.getNeedInspection() });
	}

	public Map info(int id) {
		StringBuffer sql = new StringBuffer("select sc.*,si.name as supplier_name,dsct.name as type_name from supplier_certificate as sc");
		sql.append(" inner join supplier_info as si on si.id=sc.supplier_id");
		sql.append(" inner join data_supplier_certificate_type as dsct on dsct.id=sc.type_id");
		sql.append(" where sc.id=?");
		return basalDao.queryMap(sql.toString(), new Object[] { id });
	}

	public int update_Tx(SupplierCertificate supplierCertificate) {
		String sql = "update supplier_certificate set type_id=?,num=?,file_url1=?,expiry_time=?,need_inspection=? where id=?";
		return basalDao.runUSql(sql, new Object[] { supplierCertificate.getTypeId(), supplierCertificate.getNum(), supplierCertificate.getFileUrl1(), supplierCertificate.getExpiryTime(),
				supplierCertificate.getNeedInspection(), supplierCertificate.getId() });
	}

	public void delete_Tx(int id) {
		String sql = "delete from supplier_certificate where id=?";
		basalDao.runUSql(sql, new Object[] { id });
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
