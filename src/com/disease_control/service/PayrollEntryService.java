package com.disease_control.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;

public class PayrollEntryService {

	public Page list(int tableId, int batchId, String staffName, int pageIndex, int pageSize) {
		ArrayList paramList = new ArrayList();
		Map payrollTableInfo = basalDao.queryMap("select * from payroll_table_info where id=?", new Object[] { tableId });
		String sql = "select * from payroll_column_info where (table_id=0 or table_id=?) and status=1 order by index_num asc";
		List<Map> payrollColumnInfoList = basalDao.queryList(sql, new Object[] { tableId });
		sql = "select ";
		for (Map payrollColumnInfo : payrollColumnInfoList) {
			sql += "pe.";
			sql += payrollColumnInfo.get("column_name");
			sql += ",";
		}
		sql += "pb.name as batch_name";
		sql += " from ";
		sql += payrollTableInfo.get("table_name");
		sql += " as pe inner join payroll_batch as pb on pb.id=pe.batch_id inner join staff_info as si on pe.staff_id=si.id where pe.batch_id=?";
		paramList.add(batchId);
		if (staffName != null && !staffName.equals("")) {
			sql += " and si.name like ?";
			paramList.add("%" + staffName + "%");
		}
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		Page page = basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, params);
		List resultList = (List) page.getResult();
		if (resultList.size() == 0) {
			return page;
		}
		sql = "select ";
		for (Map payrollColumnInfo : payrollColumnInfoList) {
			if (!payrollColumnInfo.get("column_name").equals("staff_id") && !payrollColumnInfo.get("column_name").equals("staff_name") && !payrollColumnInfo.get("column_name").equals("bz")
					&& !payrollColumnInfo.get("column_name").equals("read_status") && !payrollColumnInfo.get("column_name").equals("release_status")) {
				sql += "sum(pe.";
				sql += payrollColumnInfo.get("column_name");
				sql += ") as " + payrollColumnInfo.get("column_name") + ",";
			}
		}
		sql += "'合计' as batch_name";
		sql += " from ";
		sql += payrollTableInfo.get("table_name");
		sql += " as pe inner join payroll_batch as pb on pb.id=pe.batch_id inner join staff_info as si on pe.staff_id=si.id where pb.status=1 and pe.batch_id=?";
		if (staffName != null && !staffName.equals("")) {
			sql += " and si.name like ?";
		}
		Map sumResultMap = basalDao.queryMap(sql, params);
		resultList.add(sumResultMap);
		return page;
	}

	public Page list(int tableId, int staffId, int pageIndex, int pageSize, Date startTime, Date endTime) {
		List paramList = new ArrayList();
		Map payrollTableInfo = basalDao.queryMap("select * from payroll_table_info where id=?", new Object[] { tableId });
		String sql = "select * from payroll_column_info where (table_id=0 or table_id=?) and status=1 order by index_num asc";
		List<Map> payrollColumnInfoList = basalDao.queryList(sql, new Object[] { tableId });
		sql = "select ";
		for (Map payrollColumnInfo : payrollColumnInfoList) {
			sql += "pe.";
			sql += payrollColumnInfo.get("column_name");
			sql += ",";
		}
		sql += "pb.name as batch_name";
		sql += " from ";
		sql += payrollTableInfo.get("table_name");
		sql += " as pe inner join payroll_batch as pb on pb.id=pe.batch_id inner join staff_info as si on pe.staff_id=si.id where pe.release_status=1 and staff_id=?";
		paramList.add(staffId);
		if (startTime != null && !"".equals(startTime)) {
			sql += " and pb.create_time>=?";
			paramList.add(startTime);
		}
		if (endTime != null && !"".equals(endTime)) {
			sql += " and pb.create_time<=?";
			paramList.add(endTime);
		}
		sql += "  order by id desc";
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		return basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, params);
	}

	/**
	 * 根据用户的员工姓名查询该员工的工资单列表
	 * 
	 * @param name
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public Page listByStaff(int staffId, int pageIndex, int pageSize, int bacthId, Date startTime, Date endTime) {
		List paramList = new ArrayList();
		String sql = "select * from payroll_column_info where table_id=0 and status=1 and column_name<>'staff_id'";
		List<Map> payrollColumnInfoList = basalDao.queryList(sql, null);
		sql = "select ";
		for (Map payrollColumnInfo : payrollColumnInfoList) {
			sql += "pe.";
			sql += payrollColumnInfo.get("column_name");
			sql += ",";
		}
		sql += "pb.name as batch_name from payroll_entry as pe inner join payroll_batch as pb on pb.id=pe.batch_id where pe.staff_id=? and pe.release_status=1";
		paramList.add(staffId);
		if (bacthId != 0) {
			sql += " and pb.id=?";
			paramList.add(bacthId);
		}
		if (startTime != null && !"".equals(startTime)) {
			sql += " and pb.name>=?";
			paramList.add(startTime);
		}
		if (endTime != null && !"".equals(endTime)) {
			sql += " and pb.name<=?";
			paramList.add(endTime);
		}
		sql += " order by id desc";
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		return basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, params);
	}

	/**
	 * 批量添加工资信息
	 * 
	 * @param bacthId
	 * @param version
	 * @param list
	 * @return
	 */
	public int add_Tx(int bacthId, int version, List<Object[]> list) {
		String sql = "select pti.id as table_id,pti.table_name as table_name,pti.version as version from payroll_batch as pb inner join payroll_table_info as pti on pb.table_id=pti.id where pb.id=?";
		Map payrollTableInfoMap = basalDao.queryMap(sql, new Object[] { bacthId });
		if (version != Integer.parseInt(payrollTableInfoMap.get("version").toString())) {
			return -1;// 说明版本不对
		}
		sql = "select column_name as columnName from payroll_column_info where status=1 and column_auto=0 and table_id=0 and column_name<>'read_status' and column_name<>'release_status' order by index_num";
		List<Map> columnList = basalDao.queryList(sql, new Object[] {});// 查出默认表的字段
		String columns = "";
		String values = "";
		for (Map map : columnList) {
			if (columns != "") {
				columns += ",";
			}
			if (values != "") {
				values += ",";
			}
			columns += map.get("columnName");
			values += "?";
		}
		String insertPayrollEntrySql = "insert into payroll_entry (" + columns + ") values (" + values + ")";
		String countPayrollEntrySql = "select count(1) from payroll_entry where batch_id=? and staff_id=?";
		String deletePayrollEntrySql = "delete from payroll_entry where batch_id=? and staff_id=?";
		sql = "select column_name as columnName from payroll_column_info where status=1 and column_auto=0 and column_name<>'read_status' and column_name<>'release_status' and (table_id=0 or table_id=?) order by index_num";
		List<Map> _columnList = basalDao.queryList(sql, new Object[] { payrollTableInfoMap.get("table_id") });// 查出该表的所有字段
		String _columns = "";
		String _values = "";
		for (Map map : _columnList) {
			if (_columns != "") {
				_columns += ",";
			}
			if (_values != "") {
				_values += ",";
			}
			_columns += map.get("columnName");
			_values += "?";
		}
		String _insertPayrollEntrySql = "insert into " + payrollTableInfoMap.get("table_name") + " (id," + _columns + ") values (?," + _values + ")";
		String _countPayrollEntrySql = "select count(1) from " + payrollTableInfoMap.get("table_name") + " where batch_id=? and staff_id=?";
		String _deletePayrollEntrySql = "delete from " + payrollTableInfoMap.get("table_name") + " where batch_id=? and staff_id=?";
		int resultInt = 0;
		int n = 0;
		for (int i = 0; i < list.size(); i++) {
			if (basalDao.queryInt(countPayrollEntrySql, new Object[] { bacthId, list.get(i)[1] }) > 0) {// 判断默认表中信息是否存在
				basalDao.runUSql(deletePayrollEntrySql, new Object[] { bacthId, list.get(i)[1] });
			}
			Object[] params = new Object[columnList.size()];
			for (int j = 0; j < columnList.size(); j++) {
				if (columnList.get(j).get("columnName").equals("bz")) {
					params[j] = list.get(i)[list.get(i).length - 1];
				} else if (columnList.get(j).get("columnName").equals("wage_sum")) {
					params[j] = list.get(i)[list.get(i).length - 2];
				} else {
					params[j] = list.get(i)[j];
				}
			}
			resultInt = basalDao.runUSql(insertPayrollEntrySql, params);
			if (resultInt == 1) {
				int id = basalDao.queryInt("select id from payroll_entry where batch_id=? and staff_id=? limit 1", new Object[] { bacthId, list.get(i)[1] });
				if (basalDao.queryInt(_countPayrollEntrySql, new Object[] { bacthId, list.get(i)[1] }) > 0) {
					basalDao.runUSql(_deletePayrollEntrySql, new Object[] { bacthId, list.get(i)[1] });
				}
				Object[] objs = new Object[list.get(i).length + 1];
				objs[0] = id;
				for (int objIndex = 1; objIndex < objs.length; objIndex++) {
					objs[objIndex] = list.get(i)[objIndex - 1];
				}
				resultInt = basalDao.runUSql(_insertPayrollEntrySql, objs);
				//if (resultInt != 0) {
				//	basalDao.runUSql("update " + payrollTableInfoMap.get("table_name") + " set id=? where batch_id=? and staff_id=?", new Object[] { id, bacthId, list.get(i)[1] });
				//}
			}
		}
		return resultInt;
	}

	public Map info(int id) {
		Map payrollBatchInfo = basalDao.queryMap("select pb.* from payroll_batch as pb inner join payroll_entry as pe on pb.id=pe.batch_id where pe.id=?", new Object[] { id });
		Map payrollTableInfo = basalDao.queryMap("select * from payroll_table_info where id=?", new Object[] { payrollBatchInfo.get("table_id") });
		String sql = "select * from payroll_column_info where (table_id=0 or table_id=?) and status=1";
		List<Map> payrollColumnInfoList = basalDao.queryList(sql, new Object[] { payrollBatchInfo.get("table_id") });
		sql = "select ";
		for (Map payrollColumnInfo : payrollColumnInfoList) {
			sql += payrollColumnInfo.get("column_name");
			sql += ",";
		}
		sql = sql.substring(0, sql.length() - 1);
		sql += " from ";
		sql += payrollTableInfo.get("table_name");
		sql += " where id=?";
		return basalDao.queryMap(sql, new Object[] { id });
	}

	public int update_Tx(Map entryMap, List columnInfoList, int tableId) {
		String sql = "select * from payroll_table_info where id=?";
		Map tableMap = basalDao.queryMap(sql, new Object[] { tableId });
		sql = "update payroll_entry set staff_name=?,wage_sum=?,read_status=?,bz=?,release_status=? where id=?";
		int resultInt = basalDao.runUSql(sql, new Object[] { entryMap.get("staff_name"), entryMap.get("wage_sum"), entryMap.get("read_status"), entryMap.get("bz"), entryMap.get("release_status"),
				entryMap.get("id") });
		List paramList = new ArrayList();
		if (resultInt > 0) {
			sql = "update " + tableMap.get("table_name") + " set ";
			for (int i = 0; i < columnInfoList.size(); i++) {
				Map columnInfoMap = (Map) columnInfoList.get(i);
				if (i + 1 == columnInfoList.size()) {
					sql += columnInfoMap.get("column_name") + "=? where id=?";
					paramList.add(entryMap.get(columnInfoMap.get("column_name")));
					paramList.add(entryMap.get("id"));
				} else {
					sql += columnInfoMap.get("column_name") + "=?,";
					paramList.add(entryMap.get(columnInfoMap.get("column_name")));
				}
			}
			Object[] params = new Object[paramList.size()];
			for (int i = 0; i < paramList.size(); i++) {
				params[i] = paramList.get(i);
			}
			resultInt = basalDao.runUSql(sql, params);
		}
		return resultInt;
	}

	/**
	 * 将工资条状态更改为已阅
	 * 
	 * @param id
	 */
	public void read(int id) {
		String sql = "update payroll_entry set read_status=1 where id=?";
		basalDao.runUSql(sql, new Object[] { id });
		Map payrollBatchInfo = basalDao.queryMap("select pb.* from payroll_batch as pb inner join payroll_entry as pe on pb.id=pe.batch_id where pe.id=?", new Object[] { id });
		Map payrollTableInfo = basalDao.queryMap("select * from payroll_table_info where id=?", new Object[] { payrollBatchInfo.get("table_id") });
		basalDao.runUSql(sql.replace("payroll_entry", (String) payrollTableInfo.get("table_name")), new Object[] { id });
	}

	public int delete_Tx(int id, int bacthId) {
		String sql = "select table_id from payroll_batch where id=?";
		int tableId = basalDao.queryInt(sql, new Object[] { bacthId });
		sql = "select * from payroll_table_info where id=?";
		Map tableMap = basalDao.queryMap(sql, new Object[] { tableId });
		sql = "delete from " + tableMap.get("table_name") + " where id=?";
		int resultInt = basalDao.runUSql(sql, new Object[] { id });
		if (resultInt > 0) {
			sql = "delete from payroll_entry where id=?";
			resultInt = basalDao.runUSql(sql, new Object[] { id });
		}
		return resultInt;
	}

	/**
	 * 根据员工ID和起止时间，查询此时间段内，员工工资总和
	 * 
	 * @param staffId
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public Map wageSum(int staffId, Date startTime, Date endTime) {
		List paramList = new ArrayList();
		String sql = "select si.name as staff_name,di.name as department_name,pi.name as position_name,IFNULL(pe.wage_sum,0) as wage_sum,IFNULL(pe4.wage_sum,0) as wage_sum4,IFNULL(pe5.wage_sum,0) as wage_sum5,IFNULL(pe6.wage_sum,0) as wage_sum6 from (select sum(wage_sum) as wage_sum,staff_id from payroll_entry as pe inner join payroll_batch as pb on pb.id=pe.batch_id and pb.create_time>=? and pb.create_time<=? group by pe.staff_id) as pe";
		sql += " left join (select sum(wage_sum) as wage_sum,staff_id from payroll_entry as pe inner join payroll_batch as pb on pb.id=pe.batch_id where pb.table_id=4 and pb.create_time>=? and pb.create_time<=? group by pe.staff_id) as pe4 on pe.staff_id=pe4.staff_id";
		sql += " left join (select sum(wage_sum) as wage_sum,staff_id from payroll_entry as pe inner join payroll_batch as pb on pb.id=pe.batch_id where pb.table_id=5 and pb.create_time>=? and pb.create_time<=? group by pe.staff_id) as pe5 on pe.staff_id=pe5.staff_id";
		sql += " left join (select sum(wage_sum) as wage_sum,staff_id from payroll_entry as pe inner join payroll_batch as pb on pb.id=pe.batch_id where pb.table_id=6 and pb.create_time>=? and pb.create_time<=? group by pe.staff_id) as pe6 on pe.staff_id=pe6.staff_id";
		sql += " inner join staff_info as si on pe.staff_id=si.id inner join department_info as di on di.id=si.department_id inner join position_info as pi on pi.id=si.position_id";
		sql += " where 1=1 and si.id=?";
		paramList.add(startTime);
		paramList.add(endTime);
		paramList.add(startTime);
		paramList.add(endTime);
		paramList.add(startTime);
		paramList.add(endTime);
		paramList.add(startTime);
		paramList.add(endTime);
		paramList.add(staffId);
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		return basalDao.queryMap(sql, params);
	}

	public Page wageSumList(int pageIndex, int pageSize, int departmentId, int positionId, Date startTime, Date endTime) {
		List paramList = new ArrayList();
		String sql = "select si.name as staff_name,di.name as department_name,pi.name as position_name,IFNULL(pe.wage_sum,0) as wage_sum,IFNULL(pe4.wage_sum,0) as wage_sum4,IFNULL(pe5.wage_sum,0) as wage_sum5,IFNULL(pe6.wage_sum,0) as wage_sum6 from (select sum(wage_sum) as wage_sum,staff_id from payroll_entry as pe inner join payroll_batch as pb on pb.id=pe.batch_id and pb.create_time>=? and pb.create_time<=? group by pe.staff_id) as pe";
		sql += " left join (select sum(wage_sum) as wage_sum,staff_id from payroll_entry as pe inner join payroll_batch as pb on pb.id=pe.batch_id where pb.table_id=4 and pb.create_time>=? and pb.create_time<=? group by pe.staff_id) as pe4 on pe.staff_id=pe4.staff_id";
		sql += " left join (select sum(wage_sum) as wage_sum,staff_id from payroll_entry as pe inner join payroll_batch as pb on pb.id=pe.batch_id where pb.table_id=5 and pb.create_time>=? and pb.create_time<=? group by pe.staff_id) as pe5 on pe.staff_id=pe5.staff_id";
		sql += " left join (select sum(wage_sum) as wage_sum,staff_id from payroll_entry as pe inner join payroll_batch as pb on pb.id=pe.batch_id where pb.table_id=6 and pb.create_time>=? and pb.create_time<=? group by pe.staff_id) as pe6 on pe.staff_id=pe6.staff_id";
		sql += " inner join staff_info as si on pe.staff_id=si.id inner join department_info as di on di.id=si.department_id inner join position_info as pi on pi.id=si.position_id";
		sql += " where 1=1";
		paramList.add(startTime);
		paramList.add(endTime);
		paramList.add(startTime);
		paramList.add(endTime);
		paramList.add(startTime);
		paramList.add(endTime);
		paramList.add(startTime);
		paramList.add(endTime);
		if (departmentId != 0) {
			sql += " and si.department_id=?";
			paramList.add(departmentId);
		}
		if (positionId != 0) {
			sql += " and si.position_id=?";
			paramList.add(positionId);
		}
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		return basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, params);
	}

	public List wageSumList(int departmentId, int positionId, Date startTime, Date endTime) {
		List paramList = new ArrayList();
		String sql = "select si.name as staff_name,di.name as department_name,pi.name as position_name,IFNULL(pe.wage_sum,0) as wage_sum,IFNULL(pe4.wage_sum,0) as wage_sum4,IFNULL(pe5.wage_sum,0) as wage_sum5,IFNULL(pe6.wage_sum,0) as wage_sum6 from (select sum(wage_sum) as wage_sum,staff_id from payroll_entry as pe inner join payroll_batch as pb on pb.id=pe.batch_id and pb.create_time>=? and pb.create_time<=? group by pe.staff_id) as pe";
		sql += " left join (select sum(wage_sum) as wage_sum,staff_id from payroll_entry as pe inner join payroll_batch as pb on pb.id=pe.batch_id where pb.table_id=4 and pb.create_time>=? and pb.create_time<=? group by pe.staff_id) as pe4 on pe.staff_id=pe4.staff_id";
		sql += " left join (select sum(wage_sum) as wage_sum,staff_id from payroll_entry as pe inner join payroll_batch as pb on pb.id=pe.batch_id where pb.table_id=5 and pb.create_time>=? and pb.create_time<=? group by pe.staff_id) as pe5 on pe.staff_id=pe5.staff_id";
		sql += " left join (select sum(wage_sum) as wage_sum,staff_id from payroll_entry as pe inner join payroll_batch as pb on pb.id=pe.batch_id where pb.table_id=6 and pb.create_time>=? and pb.create_time<=? group by pe.staff_id) as pe6 on pe.staff_id=pe6.staff_id";
		sql += " inner join staff_info as si on pe.staff_id=si.id inner join department_info as di on di.id=si.department_id inner join position_info as pi on pi.id=si.position_id";
		sql += " where 1=1";
		paramList.add(startTime);
		paramList.add(endTime);
		paramList.add(startTime);
		paramList.add(endTime);
		paramList.add(startTime);
		paramList.add(endTime);
		paramList.add(startTime);
		paramList.add(endTime);
		if (departmentId != 0) {
			sql += " and si.department_id=?";
			paramList.add(departmentId);
		}
		if (positionId != 0) {
			sql += " and si.position_id=?";
			paramList.add(positionId);
		}
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		return basalDao.queryList(sql, params);
	}

	public Page columnSumList(int pageIndex, int pageSize, int tableId, int departmentId, int positionId, Date startTime, Date endTime) {
		List paramList = new ArrayList();
		Map payrollTableInfo = basalDao.queryMap("select * from payroll_table_info where id=?", new Object[] { tableId });
		String sql = "select * from payroll_column_info where (table_id=0 or table_id=?) and status=1 order by index_num asc";
		List<Map> payrollColumnInfoList = basalDao.queryList(sql, new Object[] { tableId });
		sql = "select * from (select ";
		for (Map payrollColumnInfo : payrollColumnInfoList) {
			if (!payrollColumnInfo.get("column_name").equals("batch_id") && !payrollColumnInfo.get("column_name").equals("read_status") && !payrollColumnInfo.get("column_name").equals("staff_name")
					&& !payrollColumnInfo.get("column_name").equals("staff_id") && !payrollColumnInfo.get("column_name").equals("release_status") && !payrollColumnInfo.get("column_name").equals("bz")
					&& !payrollColumnInfo.get("column_name").equals("id")) {
				sql += "sum(pe.";
				sql += payrollColumnInfo.get("column_name");
				sql += ") as ";
				sql += payrollColumnInfo.get("column_name");
				sql += ",";
			}
		}
		sql += "si.name as staff_name from ";
		sql += payrollTableInfo.get("table_name");
		sql += " as pe inner join payroll_batch as pb on pb.id=pe.batch_id inner join staff_info as si on pe.staff_id=si.id inner join department_info as di on di.id=si.department_id inner join position_info as pi on pi.id=si.position_id where pe.release_status=1";
		if (departmentId != 0) {
			sql += " and si.department_id=?";
			paramList.add(departmentId);
		}
		if (positionId != 0) {
			sql += " and si.position_id=?";
			paramList.add(positionId);
		}
		if (startTime != null && !"".equals(startTime)) {
			sql += " and pb.create_time>=?";
			paramList.add(startTime);
		}
		if (endTime != null && !"".equals(endTime)) {
			sql += " and pb.create_time<=?";
			paramList.add(endTime);
		}
		sql += " group by si.id ) as payroll_entry_snap";
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		return basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, params);
	}

	public List columnSumList(int tableId, int departmentId, int positionId, Date startTime, Date endTime) {
		List paramList = new ArrayList();
		Map payrollTableInfo = basalDao.queryMap("select * from payroll_table_info where id=?", new Object[] { tableId });
		String sql = "select * from payroll_column_info where (table_id=0 or table_id=?) and status=1 order by index_num asc";
		List<Map> payrollColumnInfoList = basalDao.queryList(sql, new Object[] { tableId });
		sql = "select * from (select ";
		for (Map payrollColumnInfo : payrollColumnInfoList) {
			if (!payrollColumnInfo.get("column_name").equals("batch_id") && !payrollColumnInfo.get("column_name").equals("read_status") && !payrollColumnInfo.get("column_name").equals("staff_name")
					&& !payrollColumnInfo.get("column_name").equals("staff_id") && !payrollColumnInfo.get("column_name").equals("release_status") && !payrollColumnInfo.get("column_name").equals("bz")
					&& !payrollColumnInfo.get("column_name").equals("id")) {
				sql += "sum(pe.";
				sql += payrollColumnInfo.get("column_name");
				sql += ") as ";
				sql += payrollColumnInfo.get("column_name");
				sql += ",";
			}
		}
		sql += "si.name as staff_name from ";
		sql += payrollTableInfo.get("table_name");
		sql += " as pe inner join payroll_batch as pb on pb.id=pe.batch_id inner join staff_info as si on pe.staff_id=si.id inner join department_info as di on di.id=si.department_id inner join position_info as pi on pi.id=si.position_id where pe.release_status=1";
		if (departmentId != 0) {
			sql += " and si.department_id=?";
			paramList.add(departmentId);
		}
		if (positionId != 0) {
			sql += " and si.position_id=?";
			paramList.add(positionId);
		}
		if (startTime != null && !"".equals(startTime)) {
			sql += " and pb.create_time>=?";
			paramList.add(startTime);
		}
		if (endTime != null && !"".equals(endTime)) {
			sql += " and pb.create_time<=?";
			paramList.add(endTime);
		}
		sql += " group by si.id ) as payroll_entry_snap";
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		return basalDao.queryList(sql, params);
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}
}
