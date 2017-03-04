package com.disease_control.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.PayrollColumnInfo;
import com.yakov.utils.DateUtil;

public class PayrollColumnInfoService {

	public Page list(int tableId, int pageIndex, int pageSize) {
		String sql = "select * from payroll_column_info where (table_id=0 or table_id=?) order by index_num asc";
		return basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, new Object[] { tableId });
	}

	/**
	 * 根绝工资单模板编号，查询显示的、启用的模板字段
	 * 
	 * @param tableId
	 * @return
	 */
	public List list(Object tableId) {
		String sql = "select * from payroll_column_info where column_name<>'staff_id' and (table_id=0 or table_id=?) and `status`=1 order by index_num";
		return basalDao.queryList(sql, new Object[] { tableId });
	}

	public int add_Tx(PayrollColumnInfo payrollColumnInfo) {
		String sql = "insert into payroll_column_info(table_id,name,column_name,column_type,column_length,column_required,column_default,remark,index_num,`system`,status,create_time)";
		sql += " values(?,?,?,?,?,?,?,?,?,?,?,?)";
		int result = basalDao.runUSql(sql, new Object[] { payrollColumnInfo.getTableId(), payrollColumnInfo.getName(), payrollColumnInfo.getColumnName(), payrollColumnInfo.getColumnType(),
				payrollColumnInfo.getColumnLength(), payrollColumnInfo.getColumnRequired(), payrollColumnInfo.getColumnDefault(), payrollColumnInfo.getRemark(), payrollColumnInfo.getIndexNum(),
				payrollColumnInfo.getSystem(), payrollColumnInfo.getStatus(), payrollColumnInfo.getCreateTime() });
		if (result == 1) {
			ArrayList paramList = new ArrayList();
			sql = "alter table payroll_entry add " + payrollColumnInfo.getColumnName() + " " + payrollColumnInfo.getColumnType();
			if (payrollColumnInfo.getColumnLength() != 0) {
				sql += "(" + payrollColumnInfo.getColumnLength() + ")";
			}
			if (payrollColumnInfo.getColumnRequired() == 1) {
				sql += " not null";
				if (payrollColumnInfo.getColumnDefault() != null && !payrollColumnInfo.getColumnDefault().equals("")) {
					sql += " default ?";
					paramList.add(payrollColumnInfo.getColumnDefault());
				}
			}
			Object[] params = new Object[paramList.size()];
			for (int i = 0; i < paramList.size(); i++) {
				params[i] = paramList.get(i);
			}
			if (payrollColumnInfo.getTableId() == 0) {
				basalDao.runUSql(sql, params);
				List<Map> payrollTableInfoList = basalDao.queryList("select * from payroll_table_info", null);
				for (Map payrollTableInfo : payrollTableInfoList) {
					String tableName = (String) payrollTableInfo.get("table_name");
					String countTableSql = "select COUNT(1) from `INFORMATION_SCHEMA`.`TABLES` where `TABLE_SCHEMA`='disease_control' and `TABLE_NAME` = ?";
					if (basalDao.queryInt(countTableSql, new Object[] { tableName }) == 1) {
						basalDao.runUSql(sql.replace("payroll_entry", tableName), params);
						basalDao.runUSql("update payroll_table_info set version=? where id=?", new Object[] { DateUtil.getNowTime(), payrollTableInfo.get("id") });
					}
				}
			} else {
				List<Map> payrollTableInfoList = basalDao.queryList("select * from payroll_table_info where id=?", new Object[] { payrollColumnInfo.getTableId() });
				for (Map payrollTableInfo : payrollTableInfoList) {
					String tableName = (String) payrollTableInfo.get("table_name");
					String countTableSql = "select COUNT(1) from `INFORMATION_SCHEMA`.`TABLES` where `TABLE_SCHEMA`='disease_control' and `TABLE_NAME` = ?";
					if (basalDao.queryInt(countTableSql, new Object[] { tableName }) == 1) {
						basalDao.runUSql(sql.replace("payroll_entry", tableName), params);
						basalDao.runUSql("update payroll_table_info set version=? where id=?", new Object[] { DateUtil.getNowTime(), payrollTableInfo.get("id") });
					}
				}
			}
		}
		return result;
	}

	public int delete_Tx(int id) {
		String sql = "select * from payroll_column_info where id=?";
		Map payrollColumnInfo = basalDao.queryMap(sql, new Object[] { id });
		sql = "delete from payroll_column_info where id=?";
		int result = basalDao.runUSql(sql, new Object[] { id });
		sql = "alter table payroll_entry drop column " + payrollColumnInfo.get("column_name");
		if (result == 1) {
			if (payrollColumnInfo.get("table_id").equals(0)) {
				basalDao.runUSql(sql, null);
				List<Map> payrollTableInfoList = basalDao.queryList("select * from payroll_table_info", null);
				for (Map payrollTableInfo : payrollTableInfoList) {
					String tableName = (String) payrollTableInfo.get("table_name");
					String countTableSql = "select COUNT(1) from `INFORMATION_SCHEMA`.`TABLES` where `TABLE_SCHEMA`='disease_control' and `TABLE_NAME` = ?";
					if (basalDao.queryInt(countTableSql, new Object[] { tableName }) == 1) {
						basalDao.runUSql(sql.replace("payroll_entry", tableName), null);
						basalDao.runUSql("update payroll_table_info set version=? where id=?", new Object[] { DateUtil.getNowTime(), payrollTableInfo.get("id") });
					}
				}
			} else {
				List<Map> payrollTableInfoList = basalDao.queryList("select * from payroll_table_info where id=?", new Object[] { payrollColumnInfo.get("table_id") });
				for (Map payrollTableInfo : payrollTableInfoList) {
					String tableName = (String) payrollTableInfo.get("table_name");
					String countTableSql = "select COUNT(1) from `INFORMATION_SCHEMA`.`TABLES` where `TABLE_SCHEMA`='disease_control' and `TABLE_NAME` = ?";
					if (basalDao.queryInt(countTableSql, new Object[] { tableName }) == 1) {
						basalDao.runUSql(sql.replace("payroll_entry", tableName), null);
						basalDao.runUSql("update payroll_table_info set version=? where id=?", new Object[] { DateUtil.getNowTime(), payrollTableInfo.get("id") });
					}
				}
			}
		}
		return result;
	}

	public Map info(int id) {
		String sql = "select * from payroll_column_info where id=?";
		return basalDao.queryMap(sql, new Object[] { id });
	}

	/**
	 * 修改工资单字段状态
	 * 
	 * @param id
	 * @param status
	 * @return
	 */
	public void status(int id, int status) {
		String sql = "select * from payroll_column_info where id=?";
		Map payrollColumnInfo = basalDao.queryMap(sql, new Object[] { id });
		sql = "update payroll_column_info set status=? where id=?";
		int result = basalDao.runUSql(sql, new Object[] { status, id });
		if (result == 1) {
			if (payrollColumnInfo.get("table_id").equals(0)) {
				sql = "update payroll_table_info set version=?";
				basalDao.runUSql(sql, new Object[] { DateUtil.getNowTime() });
			} else {
				sql = "update payroll_table_info set version=? where id=?";
				basalDao.runUSql(sql, new Object[] { DateUtil.getNowTime(), payrollColumnInfo.get("table_id") });
			}
		}
	}

	public int update(int id, String name, int indexNum, String remark) {
		String sql = "select * from payroll_column_info where id=?";
		Map payrollColumnInfo = basalDao.queryMap(sql, new Object[] { id });
		sql = "update payroll_column_info set name=?, index_num=?, remark=? where id=?";
		int result = basalDao.runUSql(sql, new Object[] { name, indexNum, remark, id });
		if (result == 1) {
			if (payrollColumnInfo.get("table_id").equals(0)) {
				sql = "update payroll_table_info set version=?";
				basalDao.runUSql(sql, new Object[] { DateUtil.getNowTime() });
			} else {
				sql = "update payroll_table_info set version=? where id=?";
				basalDao.runUSql(sql, new Object[] { DateUtil.getNowTime(), payrollColumnInfo.get("table_id") });
			}
		}
		return result;
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
