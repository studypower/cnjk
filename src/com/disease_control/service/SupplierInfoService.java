package com.disease_control.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.SupplierInfo;

public class SupplierInfoService {

	public List list() {
		return basalDao.queryList("select si.*,st.name as type_name from supplier_info as si left join data_supplier_type as st on st.id=si.`type` where 1=1", null);
	}

	public List listByOrder() {
		return basalDao
				.queryList(
						"select si.*,st.name as type_name from supplier_info as si left join data_supplier_type as st on st.id=si.`type` where UNIX_TIMESTAMP(si.business_license_expiry_time)-UNIX_TIMESTAMP(?)>30*24*60*60 and si.complex_level<>3 order by si.complex_level asc",
						new Object[] { new Date() });
	}

	public Page list(int pageIndex, int pageSize, String name, int type, String businessLicenseNum, int complexLevel) {
		StringBuffer sql = new StringBuffer("select si.*,st.name as type_name from supplier_info as si left join data_supplier_type as st on st.id=si.`type` where 1=1");
		ArrayList paramList = new ArrayList();
		if (name != null && !name.equals("")) {
			sql.append(" and si.`name` like ?");
			paramList.add("%" + name + "%");
		}
		if (businessLicenseNum != null && !"".equals(businessLicenseNum)) {
			sql.append(" and si.business_license_num like ?");
			paramList.add("%" + businessLicenseNum + "%");
		}
		if (complexLevel != 0) {
			sql.append(" and si.complex_level=?");
			paramList.add(complexLevel);
		}
		if (type != -100) {
			sql.append(" and si.`type` = ?");
			paramList.add(type);
		}
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		return basalDao.pagedQuery_mysql_sql(sql.toString(), pageIndex, pageSize, params);
	}

	public int add_Tx(SupplierInfo supplierInfo) {
		String sql = "insert into supplier_info(name,business_license_num,business_license_file_url,business_license_expiry_time,type,complex_level,contact_name,contact_phone,address,staff_id,create_time,status) values(?,?,?,?,?,?,?,?,?,?,now(),1)";
		return basalDao.runUSql(
				sql,
				new Object[] { supplierInfo.getName(), supplierInfo.getBusinessLicenseNum(), supplierInfo.getBusinessLicenseFileUrl(), supplierInfo.getBusinessLicenseExpiryTime(),
						supplierInfo.getType(), supplierInfo.getComplexLevel(), supplierInfo.getContactName(), supplierInfo.getContactPhone(), supplierInfo.getAddress(), supplierInfo.getStaffId() });
	}

	public Map info(int id) {
		return basalDao.queryMap("select si.*,st.name as type_name from supplier_info as si left join data_supplier_type as st on st.id=si.`type` where si.id=?", new Object[] { id });
	}

	public int update_Tx(SupplierInfo supplierInfo) {
		String sql = "update supplier_info set name=?,business_license_num=?,business_license_file_url=?,business_license_expiry_time=?,type=?,complex_level=?,contact_name=?,contact_phone=?,address=? where id=?";
		return basalDao.runUSql(
				sql,
				new Object[] { supplierInfo.getName(), supplierInfo.getBusinessLicenseNum(), supplierInfo.getBusinessLicenseFileUrl(), supplierInfo.getBusinessLicenseExpiryTime(),
						supplierInfo.getType(), supplierInfo.getComplexLevel(), supplierInfo.getContactName(), supplierInfo.getContactPhone(), supplierInfo.getAddress(), supplierInfo.getId() });
	}

	/**
	 * 查出所有的状态为1的供应商 (推荐供应商时用)
	 * 
	 * @return
	 */
	public List rcommendList() {
		String sql = "select si.*,st.name as typeName from supplier_info as si inner join data_supplier_type as st on st.id=si.`type` where si.status=1";
		return basalDao.queryList(sql, new Object[] {});
	}

	public List exportData(String name, int type, String businessLicenseNum, int complexLevel) {
		StringBuffer sql = new StringBuffer("select si.*,st.name as type_name from supplier_info as si left join data_supplier_type as st on st.id=si.`type` where 1=1");
		ArrayList paramList = new ArrayList();
		if (name != null && !name.equals("")) {
			sql.append(" and si.`name` like ?");
			paramList.add("%" + name + "%");
		}
		if (businessLicenseNum != null && !"".equals(businessLicenseNum)) {
			sql.append(" and si.business_license_num like ?");
			paramList.add("%" + businessLicenseNum + "%");
		}
		if (complexLevel != 0) {
			sql.append(" and si.complex_level=?");
			paramList.add(complexLevel);
		}
		if (type != -100) {
			sql.append(" and si.`type` = ?");
			paramList.add(type);
		}
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		return basalDao.queryList(sql.toString(), params);
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
