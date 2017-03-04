package com.disease_control.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.PayrollTableInfo;
import com.yakov.utils.DateUtil;

public class PayrollTableInfoService {

	public Page list(int pageIndex, int pageSize) {
		String sql = "select * from payroll_table_info";
		return basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, null);
	}

	public Page list(int status, int pageIndex, int pageSize, int id) {
		List paramList = new ArrayList();
		String sql = "select * from payroll_table_info where status=?";
		paramList.add(status);
		if (id != 0) {
			sql += " and id=?";
			paramList.add(id);
		}
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		return basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, params);
	}

	/**
	 * 查询启用状态的工资单模板
	 * 
	 * @return
	 */
	public List list() {
		String sql = "select * from payroll_table_info where status=1";
		return basalDao.queryList(sql, null);
	}

	public Map info(int id) {
		String sql = "select * from payroll_table_info where id=?";
		return basalDao.queryMap(sql, new Object[] { id });
	}

	public int add_Tx(PayrollTableInfo payrollTableInfo) {
		String sql = "insert into payroll_table_info(name,table_name,remark,build,version,status,create_time) values(?,?,?,?,?,?,?)";
		return basalDao.runUSql(
				sql,
				new Object[] { payrollTableInfo.getName(), payrollTableInfo.getTableName(), payrollTableInfo.getRemark(), payrollTableInfo.getBuild(), payrollTableInfo.getVersion(),
						payrollTableInfo.getStatus(), payrollTableInfo.getCreateTime() });
	}

	public int update_Tx(PayrollTableInfo payrollTableInfo) {
		String sql = "update payroll_table_info set name=?,remark=? where id=?";
		return basalDao.runUSql(sql, new Object[] { payrollTableInfo.getName(), payrollTableInfo.getRemark(), payrollTableInfo.getId() });
	}

	public int build_Tx(int id) {
		String sql = "select * from payroll_table_info where id = ?";
		Map payrollTableInfo = basalDao.queryMap(sql, new Object[] { id });
		String tableName = (String) payrollTableInfo.get("table_name");
		sql = "select COUNT(1) from `INFORMATION_SCHEMA`.`TABLES` where `TABLE_SCHEMA`='disease_control' and `TABLE_NAME` = ?";
		if (basalDao.queryInt(sql, new Object[] { tableName }) == 0) {
			basalDao.runUSql("create table " + tableName + " like payroll_entry;", null);
			sql = "select * from payroll_column_info where table_id=?";
			List<Map> payrollColumnInfoList = basalDao.queryList(sql, new Object[] { id });
			for (Map payrollColumnInfo : payrollColumnInfoList) {
				ArrayList paramList = new ArrayList();
				sql = "alter table " + tableName + " add " + payrollColumnInfo.get("column_name") + " " + payrollColumnInfo.get("column_type");
				if (!payrollColumnInfo.get("column_length").equals(0)) {
					sql += "(" + payrollColumnInfo.get("column_length") + ")";
				}
				if (payrollColumnInfo.get("column_required").equals(1)) {
					sql += " not null";
					if (payrollColumnInfo.get("column_default") != null) {
						sql += " default ?";
						paramList.add(payrollColumnInfo.get("column_default"));
					}
				}
				Object[] params = new Object[paramList.size()];
				for (int i = 0; i < paramList.size(); i++) {
					params[i] = paramList.get(i);
				}
				basalDao.runUSql(sql, params);
			}
			sql = "ALTER TABLE " + tableName + " MODIFY COLUMN id int(11) NOT NULL";
			basalDao.runUSql(sql, null);
		}
		sql = "update payroll_table_info set build=1,version=? where id=?";
		return basalDao.runUSql(sql, new Object[] { DateUtil.getNowTime(), id });
	}

	public void status(int id, int status) {
		String sql = "update payroll_table_info set status=? where id = ?";
		basalDao.runUSql(sql, new Object[] { status, id });
	}

	/**
	 * 查出需要下载的模板数据
	 * 
	 * @return
	 */
	public Map exportData(int id) {
		String sql = "select version from payroll_table_info where id=?";
		Map payrollTableInfoMap = basalDao.queryMap(sql, new Object[] { id });
		sql = "select name,column_name as columnName,column_required as columnRequired from payroll_column_info where status=1 and column_auto=0 and column_name<>'batch_id' and column_name<>'read_status' and column_name<>'create_time' and column_name<>'release_status' and (table_id=0 or table_id=?) order by index_num";
		List<Map> payrollColumns = basalDao.queryList(sql, new Object[] { id });
		for (Map columnMap : payrollColumns) {
			if (columnMap.get("columnRequired") != null && !"".equals(columnMap.get("columnRequired"))) {
				if (columnMap.get("columnRequired").equals(0)) {
					columnMap.put("columnRequired", "可为空");
				} else if (columnMap.get("columnRequired").equals(1)) {
					columnMap.put("columnRequired", "不为空");
				}
			}
		}
		payrollTableInfoMap.put("payrollColumns", payrollColumns);
		return payrollTableInfoMap;
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
