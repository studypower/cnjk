package com.disease_control.service;

import java.util.ArrayList;
import java.util.Date;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.SupplierInspectionLog;

public class SupplierInspectionLogService {

	public Page list(int pageIndex, int pageSize, int supplierId, Date startTime, Date endTime) {
		StringBuffer sql = new StringBuffer(
				"select sil.*,si.name as supplier_name,st.name as data_supplier_type from supplier_inspection_log as sil inner join supplier_info as si on si.id=sil.supplier_id inner join data_supplier_type as st on st.id=si.`type` where 1=1");
		ArrayList paramList = new ArrayList();
		if (supplierId != -100) {
			sql.append(" and sil.supplier_id = ?");
			paramList.add(supplierId);
		}
		if (startTime != null) {
			sql.append(" and sil.create_time >= ?");
			paramList.add(startTime);
		}
		if (endTime != null) {
			sql.append(" and sil.create_time <= ?");
			paramList.add(endTime);
		}
		sql.append(" order by sil.id desc");
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		return basalDao.pagedQuery_mysql_sql(sql.toString(), pageIndex, pageSize, params);
	}

	public int add_Tx(SupplierInspectionLog supplierInspectionLog) {
		String sql = "insert into supplier_inspection_log(supplier_id,complex_level,price_level,quality_level,service_level,`year`,remark,staff_id,create_time) values(?,?,?,?,?,?,?,?,now())";
		int resultInt = basalDao.runUSql(sql, new Object[] { supplierInspectionLog.getSupplierId(), supplierInspectionLog.getComplexLevel(), supplierInspectionLog.getPriceLevel(),
				supplierInspectionLog.getQualityLevel(), supplierInspectionLog.getServiceLevel(),supplierInspectionLog.getYear(),supplierInspectionLog.getRemark(), supplierInspectionLog.getStaffId() });
		if (resultInt == 1) {
			sql = "update supplier_info set complex_level=?,last_inspection_time=now() where id=?";
			resultInt = basalDao.runUSql(sql, new Object[] { supplierInspectionLog.getComplexLevel(), supplierInspectionLog.getSupplierId() });
		}
		return resultInt;
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}
}
