package com.disease_control.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.PayrollBatch;

public class PayrollBatchService {

	public Page list(int pageIndex, int pageSize, int tableId, Date startTime, Date endTime) {
		List paramList = new ArrayList();
		String sql = "select pb.*,pti.name as table_name from payroll_batch as pb inner join payroll_table_info as pti on pb.table_id=pti.id where 1=1";
		if (tableId != 0) {
			sql += " and pti.id=?";
			paramList.add(tableId);
		}
		if (startTime != null && !"".equals(startTime)) {
			sql += " and pb.create_time>=?";
			paramList.add(startTime);
		}

		if (endTime != null && !"".equals(endTime)) {
			sql += " and pb.create_time<=?";
			paramList.add(endTime);
		}
		sql += " order by pb.id desc";
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		Page page = basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, params);
		List<Map> payrollBatchList = (List<Map>) page.getResult();
		for (Map payrollBatch : payrollBatchList) {
			sql = "select count(*) from payroll_entry where batch_id=?";
			payrollBatch.put("peCount", basalDao.queryInt(sql, new Object[] { payrollBatch.get("id") }));
			sql = "select count(*) from payroll_entry where batch_id=? and release_status=1";
			payrollBatch.put("pe1Count", basalDao.queryInt(sql, new Object[] { payrollBatch.get("id") }));
		}
		return page;
	}

	public int add_Tx(PayrollBatch payrollBatch) {
		String sql = "insert into payroll_batch(table_id,name,create_time) values(?,?,now())";
		return basalDao.runUSql(sql, new Object[] { payrollBatch.getTableId(), payrollBatch.getName() });
	}

	public Map info(int id) {
		String sql = "select pb.*,pti.name as table_name from payroll_batch as pb inner join payroll_table_info as pti on pb.table_id=pti.id where pb.id=?";
		return basalDao.queryMap(sql, new Object[] { id });
	}

	public void release_Tx(int id) {
		String sql = "update payroll_entry set release_status=1 where batch_id=?";
		basalDao.runUSql(sql, new Object[] { id });
		sql = "select pb.*,pti.table_name from payroll_batch as pb inner join payroll_table_info as pti on pb.table_id=pti.id where pb.id=?";
		Map payrollBatchMap = basalDao.queryMap(sql, new Object[] { id });
		sql = "update " + payrollBatchMap.get("table_name") + " set release_status=1 where batch_id=?";
		basalDao.runUSql(sql, new Object[] { id });
		sql = "update payroll_batch set release_time=now() where id=?";
		basalDao.runUSql(sql, new Object[] { id });
	}

	public int del_Tx(int id) {
		String sql = "select table_id from payroll_batch where id=?";
		int tableId = basalDao.queryInt(sql, new Object[] { id });
		sql = "select * from payroll_table_info where id=?";
		Map tableMap = basalDao.queryMap(sql, new Object[] { tableId });
		sql = "delete from payroll_batch where id=?";
		int resultInt = basalDao.runUSql(sql, new Object[] { id });
		if (resultInt > 0) {
			sql = "delete from payroll_entry where batch_id=?";
			basalDao.runUSql(sql, new Object[] { id });
			sql = "delete from " + tableMap.get("table_name") + " where batch_id=?";
			basalDao.runUSql(sql, new Object[] { id });
		}
		return resultInt;
	}

	public List list() {
		String sql = "select * from payroll_batch";
		return basalDao.queryList(sql, new Object[] {});
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}
}
