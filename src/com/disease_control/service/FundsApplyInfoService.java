package com.disease_control.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.DataFileInfo;
import com.disease_control.web.form.FundsApplyInfo;
import com.disease_control.web.form.FundsApplyStockEntry;
import com.disease_control.web.form.FundsApproval;
import com.yakov.utils.DateUtil;
import com.yakov.utils.JsonUtil;
import com.yakov.utils.StringUtil;

/**
 * 经费管理
 * 
 * @author
 * 
 */
public class FundsApplyInfoService {

	/**
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @param step
	 * @param status
	 * @param name
	 * @param typeName
	 * @param num
	 * @param startMoney
	 * @param endMoney
	 * @param applyDepartmentId
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public Page search(int pageIndex, int pageSize, int step, int status, String name, String typeName, String num, double startMoney, double endMoney, int applyStaffId, int applyDepartmentId,
			Date startTime, Date endTime, String sidx, String sord) {
		ArrayList paramList = new ArrayList();
		String sql = "select fai.*,si.name as applyStaffName,di.name as applyDepartmentName from funds_apply_info as fai inner join staff_info as si on fai.apply_staff_id=si.id inner join department_info as di on fai.apply_department_id=di.id and di.status=1 where 1=1";
		if (name != null && !"".equals(name)) {
			sql += " and fai.name like ?";
			paramList.add("%" + name + "%");
		}
		if (num != null && !"".equals(num)) {
			sql += " and fai.num like ?";
			paramList.add("%" + num + "%");
		}
		if (startMoney != 0) {
			sql += " and fai.money>=?";
			paramList.add(startMoney);
		}
		if (endMoney != 0) {
			sql += " and fai.money<=?";
			paramList.add(endMoney);
		}
		if (applyStaffId != 0) {
			sql += " and fai.apply_staff_id=?";
			paramList.add(applyStaffId);
		}
		if (applyDepartmentId != 0) {
			sql += " and fai.apply_department_id in (select id from department_info where id=? or base_id=?)";
			paramList.add(applyDepartmentId);
			paramList.add(applyDepartmentId);
		}
		if (startTime != null) {
			sql += " and fai.apply_time>=?";
			paramList.add(startTime);
		}
		if (endTime != null) {
			sql += " and fai.apply_time<=?";
			paramList.add(endTime);
		}
		if (typeName != null && !typeName.equals("")) {
			sql += " and fai.type_name like ?";
			paramList.add("%" + typeName + "%");
		}
		if (step != -100) {
			sql += " and fai.step=?";
			paramList.add(step);
		}
		if (status != -100) {
			sql += " and fai.status=?";
			paramList.add(status);
		}
		if (sidx != null && !"".equals(sidx) && sord != null && !"".equals(sord)) {
			sql += " order by fai." + sidx + " " + sord;
		} else {
			sql += " order by fai.id desc";
		}
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		Page page = basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, params);
		List<Map> resultList = (List<Map>) page.getResult();
		Map resultMap = new HashMap();
		resultMap.put("num", "金额总计");
		resultMap.put("money", basalDao.queryInt(sql.replace("fai.*,si.name as applyStaffName,di.name as applyDepartmentName", "sum(fai.money)"), params));
		resultList.add(resultMap);
		return page;
	}

	/**
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @param step
	 * @param status
	 * @param name
	 * @param typeName
	 * @param num
	 * @param startMoney
	 * @param endMoney
	 * @param applyDepartmentId
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public List exportDate(int step, int status, String name, String typeName, String num, double startMoney, double endMoney, int applyDepartmentId, Date startTime, Date endTime) {
		ArrayList paramList = new ArrayList();
		String sql = "select fai.*,si.name as applyStaffName,di.name as applyDepartmentName from funds_apply_info as fai inner join staff_info as si on fai.apply_staff_id=si.id inner join department_info as di on fai.apply_department_id=di.id and di.status=1 where 1=1";
		if (name != null && !"".equals(name)) {
			sql += " and fai.name like ?";
			paramList.add("%" + name + "%");
		}
		if (num != null && !"".equals(num)) {
			sql += " and fai.num like ?";
			paramList.add("%" + num + "%");
		}
		if (startMoney != 0) {
			sql += " and fai.money>=?";
			paramList.add(startMoney);
		}
		if (endMoney != 0) {
			sql += " and fai.money<=?";
			paramList.add(endMoney);
		}
		if (applyDepartmentId != 0) {
			sql += " and fai.apply_department_id in (select id from department_info where id=? or base_id=?)";
			paramList.add(applyDepartmentId);
			paramList.add(applyDepartmentId);
		}
		if (startTime != null) {
			sql += " and fai.apply_time>=?";
			paramList.add(startTime);
		}
		if (endTime != null) {
			sql += " and fai.apply_time<=?";
			paramList.add(endTime);
		}
		if (typeName != null && !typeName.equals("")) {
			sql += " and fai.type_name like ?";
			paramList.add("%" + typeName + "%");
		}
		if (step != -100) {
			sql += " and fai.step=?";
			paramList.add(step);
		}
		if (status != -100) {
			sql += " and fai.status=?";
			paramList.add(status);
		}
		sql += " order by fai.id desc";
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		List<Map> resultList = basalDao.queryList(sql, params);
		for (Map map : resultList) {
			String str = "";
			if (map.get("step").toString().equals("0")) {
				str = "经费申请";
			} else if (map.get("step").toString().equals("1")) {
				str = "部门审批";
			} else if (map.get("step").toString().equals("3")) {
				str = "财务审批";
			} else if (map.get("step").toString().equals("4")) {
				str = "分管审批";
			} else if (map.get("step").toString().equals("5")) {
				str = "中心审批";
			} else if (map.get("step").toString().equals("6")) {
				str = "'三重一大'审批";
			}

			if (map.get("status").toString().equals("1")) {
				str += "-->通过";
			} else if (map.get("status").toString().equals("-1")) {
				str += "-->退回修改";
			} else if (map.get("status").toString().equals("0")) {
				str += "-->等待处理";
			}
			map.put("status", str);
		}
		Map resultMap = new HashMap();
		resultMap.put("num", "金额总计");
		resultMap.put("money", basalDao.queryInt(sql.replace("fai.*,si.name as applyStaffName,di.name as applyDepartmentName", "sum(fai.money)"), params));
		resultList.add(resultMap);
		return resultList;
	}

	/**
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @param staffId
	 * @param step
	 * @param departmentId
	 * @param name
	 * @param typeName
	 * @param num
	 * @param money
	 * @param applyDepartmentId
	 * @param applyStaffId
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	public Page list(int pageIndex, int pageSize, int staffId, int step, int departmentId, String name, String typeName, String num, double money, int applyDepartmentId, int applyStaffId,
			Date startTime, Date endTime, int status) {
		ArrayList paramList = new ArrayList();
		String sql = "select fai.*,si.name as applyStaffName,di.name as applyDepartmentName,(case fai.status when '0' then '0' else '1' end) as sortField from funds_apply_info as fai inner join staff_info as si on fai.apply_staff_id=si.id inner join department_info as di on fai.apply_department_id=di.id and di.status=1 where 1=1";
		if (status == -100) {
			sql += " and fai.status=0 and fai.step=?";
		} else {
			sql += " and fai.step>=?";
		}
		paramList.add(step);
		if (name != null && !"".equals(name)) {
			sql += " and fai.name like ?";
			paramList.add("%" + name + "%");
		}
		if (num != null && !"".equals(num)) {
			sql += " and fai.num like ?";
			paramList.add("%" + num + "%");
		}
		if (money != 0) {
			sql += " and fai.money>=?";
			paramList.add(money);
		}
		if (applyDepartmentId != 0) {
			sql += " and fai.apply_department_id=?";
			paramList.add(applyDepartmentId);
		}
		if (applyStaffId != 0) {
			sql += " and fai.apply_staff_id=?";
			paramList.add(applyStaffId);
		}
		if (startTime != null && !"".equals(startTime)) {
			sql += " and fai.apply_time>=?";
			paramList.add(startTime);
		}
		if (endTime != null && !"".equals(endTime)) {
			sql += " and fai.apply_time<=?";
			paramList.add(endTime);
		}
		if (typeName != null && !typeName.equals("")) {
			sql += " and fai.type_name like ?";
			paramList.add("%" + typeName + "%");
		}
		if (step == 0 && staffId > 0) {
			sql += " and fai.apply_staff_id=?";
			paramList.add(staffId);
		}
		if (step == 1) {
			sql += " and fai.apply_department_id in (select id from department_info where id=? or base_id=?)";
			paramList.add(departmentId);
			paramList.add(departmentId);
		}
		if (step == 2) {
			sql += " and fai.is_syscg=1";
		}
		if (step == 4) {
			String _sql = "select department_ids from charge_range where staff_id=?";
			Map chargeRangeMap = basalDao.queryMap(_sql, new Object[] { staffId });// 查出分管的部门Ids
			String departmentIds = "0";
			if (chargeRangeMap != null) {
				departmentIds = chargeRangeMap.get("department_ids").toString();
			}
			sql += " and fai.apply_department_id in (" + departmentIds + ")";
		}
		if (step == 6) {
			sql += " and fai.money>=30000";
		}
		if (status == -100) {
			sql += " order by fai.id asc";
		} else {
			sql += " order by sortField asc,fai.id desc";
		}
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		return basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, params);
	}

	/**
	 * 查出所有通过审核的经费列表
	 * 
	 * @return
	 */
	public Page listByPurchase(int pageIndex, int pageSize) {
		StringBuffer sql = new StringBuffer("select fai.*,di.name as applyDepartmentName,si.name as applyStaffName from funds_apply_info as fai");
		sql.append(" inner join department_info as di on fai.apply_department_id=di.id and di.status=1");
		sql.append(" inner join staff_info as si on fai.apply_staff_id=si.id");
		sql.append(" left join (select count(*) as countCanBuy,apply_id from funds_apply_stock_entry where buy_amount<>amount group by apply_id) as snap_table1 on snap_table1.apply_id=fai.id");
		sql.append(" where ((fai.money>=30000 and fai.step=6 and fai.status=1) or (fai.money<30000 and fai.step=5 and fai.status=1)) and snap_table1.countCanBuy is not null and snap_table1.countCanBuy>0");
		sql.append(" order by fai.id desc");
		Page page = basalDao.pagedQuery_mysql_sql(sql.toString(), pageIndex, pageSize, new Object[] {});
		return page;
	}

	/**
	 * 添加
	 * 
	 * @param fundsApplyInfo
	 * @return
	 */
	public int add_Tx(FundsApplyInfo fundsApplyInfo) {
		String sql = "select count(id) from funds_apply_info where apply_time=?";
		int count = basalDao.queryInt(sql, new Object[] { "" + DateUtil.getNewDate() + "" }) + 1;
		sql = "insert into funds_apply_info (num,name,type_name,money,work_content,remark,pay_details,apply_staff_id,apply_department_id,apply_time,step,status,is_buy,is_syscg) values (?,?,?,?,?,?,?,?,?,now(),1,0,0,?)";
		int resultInt = basalDao.runUSql(sql, new Object[] { "JF-" + StringUtil.tonicZero(fundsApplyInfo.getApplyDepartmentId(), 2) + "-" + DateUtil.getYmd() + "-" + StringUtil.tonicZero(count, 3),
				fundsApplyInfo.getName(), fundsApplyInfo.getTypeName(), fundsApplyInfo.getMoney(), fundsApplyInfo.getWorkContent(), fundsApplyInfo.getRemark(), fundsApplyInfo.getPayDetails(),
				fundsApplyInfo.getApplyStaffId(), fundsApplyInfo.getApplyDepartmentId(), fundsApplyInfo.getIsSyscg() });
		if (resultInt == 1) {
			int applyId = basalDao.queryInt("select max(id) from funds_apply_info where name=? and money=? and remark=? and apply_staff_id=? limit 1", new Object[] { fundsApplyInfo.getName(),
					fundsApplyInfo.getMoney(), fundsApplyInfo.getRemark(), fundsApplyInfo.getApplyStaffId() });
			for (DataFileInfo dataFileInfo : fundsApplyInfo.getDataFileInfoList()) {
				sql = "insert into data_file_info (target_table,target_id,file_name,file_url) values (?,?,?,?)";
				basalDao.runUSql(sql, new Object[] { dataFileInfo.getTargetTable(), applyId, dataFileInfo.getFileName(), dataFileInfo.getFileUrl() });
			}
			for (FundsApplyStockEntry fundsApplyStockEntry : fundsApplyInfo.getFundsApplyStockEntryList()) {
				sql = "insert into funds_apply_stock_entry(apply_id,name,money,amount,remark,buy_amount) values(?,?,?,?,?,?)";
				basalDao.runUSql(sql, new Object[] { applyId, fundsApplyStockEntry.getName(), fundsApplyStockEntry.getMoney(), fundsApplyStockEntry.getAmount(), fundsApplyStockEntry.getRemark(), 0 });
			}
			sql = "insert into funds_approval(apply_id,approval_staff_id,approval_time,result,step,remark,file_url) values (?,?,now(),?,?,?,?)";
			basalDao.runUSql(sql, new Object[] { applyId, fundsApplyInfo.getApplyStaffId(), 0, 0, "", null });
			int approvalId = basalDao.queryInt("select id from funds_approval where apply_id=? and approval_staff_id=? and result=? and step=? order by id desc limit 1", new Object[] { applyId,
					fundsApplyInfo.getApplyStaffId(), 0, 0 });
			basalDao.runUSql(
					"insert into funds_apply_info_log (apply_id,approval_id,num,name,type_name,money,work_content,remark,pay_details,apply_staff_id,apply_department_id,apply_time,step,status,is_buy) values (?,?,?,?,?,?,?,?,?,?,?,now(),0,1,0)",
					new Object[] { applyId, approvalId, "JF-" + StringUtil.tonicZero(fundsApplyInfo.getApplyDepartmentId(), 2) + "-" + DateUtil.getYmd() + "-" + StringUtil.tonicZero(count, 3),
							fundsApplyInfo.getName(), fundsApplyInfo.getTypeName(), fundsApplyInfo.getMoney(), fundsApplyInfo.getWorkContent(), fundsApplyInfo.getRemark(),
							fundsApplyInfo.getPayDetails(), fundsApplyInfo.getApplyStaffId(), fundsApplyInfo.getApplyDepartmentId() });
		}
		return resultInt;
	}

	/**
	 * 获取详情
	 * 
	 * @param id
	 * @return
	 */
	public Map info(int id) {
		String sql = "select fai.*,si.name as applyStaffName,di.name as applyDepartmentName from funds_apply_info as fai inner join staff_info as si on fai.apply_staff_id=si.id inner join department_info as di on fai.apply_department_id=di.id and di.status=1 where fai.id=?";
		Map map = basalDao.queryMap(sql, new Object[] { id });
		sql = "select fa.*,si.name as staff_name from funds_approval as fa inner join staff_info as si on fa.approval_staff_id=si.id where fa.apply_id=? order by fa.id asc";
		map.put("approvalList", JsonUtil.listToJsonStr(basalDao.queryList(sql, new Object[] { id })));
		sql = "select * from funds_apply_stock_entry where apply_id=?";
		map.put("stockEntryList", basalDao.queryList(sql, new Object[] { id }));
		sql = "select dfi.* from data_file_info as dfi inner join funds_apply_info as fai on fai.id=dfi.target_id where fai.id=? and dfi.target_table='funds_apply_info'";
		map.put("dataFileInfoList", basalDao.queryList(sql, new Object[] { id }));
		return map;
	}

	public Map infoByWzcg(int id) {
		String sql = "select fai.*,si.name as applyStaffName,di.name as applyDepartmentName from funds_apply_info as fai inner join staff_info as si on fai.apply_staff_id=si.id inner join department_info as di on fai.apply_department_id=di.id and di.status=1 where fai.id=?";
		Map map = basalDao.queryMap(sql, new Object[] { id });
		sql = "select * from funds_apply_stock_entry where apply_id=? and amount<>buy_amount";
		map.put("stockEntryList", basalDao.queryList(sql, new Object[] { id }));
		return map;
	}

	/**
	 * 修改
	 * 
	 * @param fundsApplyInfo
	 * @return
	 */
	public int update_Tx(FundsApplyInfo fundsApplyInfo) {
		String sql = "update funds_apply_info set name=?,type_name=?,money=?,remark=?,work_content=?,pay_details=?,step=1,status=0,is_syscg=? where id=?";
		int resultInt = basalDao.runUSql(
				sql,
				new Object[] { fundsApplyInfo.getName(), fundsApplyInfo.getTypeName(), fundsApplyInfo.getMoney(), fundsApplyInfo.getRemark(), fundsApplyInfo.getWorkContent(),
						fundsApplyInfo.getPayDetails(), fundsApplyInfo.getIsSyscg(), fundsApplyInfo.getId() });
		if (resultInt == 1) {
			basalDao.runUSql("delete from data_file_info where target_table='funds_apply_info' and target_id=?", new Object[] { fundsApplyInfo.getId() });
			for (DataFileInfo dataFileInfo : fundsApplyInfo.getDataFileInfoList()) {
				sql = "insert into data_file_info (target_table,target_id,file_name,file_url) values (?,?,?,?)";
				basalDao.runUSql(sql, new Object[] { dataFileInfo.getTargetTable(), fundsApplyInfo.getId(), dataFileInfo.getFileName(), dataFileInfo.getFileUrl() });
			}
			basalDao.runUSql("delete from funds_apply_stock_entry where apply_id=?", new Object[] { fundsApplyInfo.getId() });
			for (FundsApplyStockEntry fundsApplyStockEntry : fundsApplyInfo.getFundsApplyStockEntryList()) {
				sql = "insert into funds_apply_stock_entry(apply_id,name,money,amount,remark,buy_amount) values(?,?,?,?,?,?)";
				basalDao.runUSql(sql,
						new Object[] { fundsApplyInfo.getId(), fundsApplyStockEntry.getName(), fundsApplyStockEntry.getMoney(), fundsApplyStockEntry.getAmount(), fundsApplyStockEntry.getRemark(), 0 });
			}
			sql = "insert into funds_approval(apply_id,approval_staff_id,approval_time,result,step) values (?,?,now(),0,0)";
			basalDao.runUSql(sql, new Object[] { fundsApplyInfo.getId(), fundsApplyInfo.getApplyStaffId() });
			int approvalId = basalDao.queryInt("select id from funds_approval where apply_id=? and approval_staff_id=? and result=? and step=? order by id desc limit 1",
					new Object[] { fundsApplyInfo.getId(), fundsApplyInfo.getApplyStaffId(), 0, 0 });
			basalDao.runUSql(
					"insert into funds_apply_info_log (apply_id,approval_id,num,name,type_name,money,work_content,remark,pay_details,apply_staff_id,apply_department_id,apply_time,step,status,is_buy) values (?,?,?,?,?,?,?,?,?,?,?,now(),0,0,0)",
					new Object[] { fundsApplyInfo.getId(), approvalId, fundsApplyInfo.getNum(), fundsApplyInfo.getName(), fundsApplyInfo.getTypeName(), fundsApplyInfo.getMoney(),
							fundsApplyInfo.getWorkContent(), fundsApplyInfo.getRemark(), fundsApplyInfo.getPayDetails(), fundsApplyInfo.getApplyStaffId(), fundsApplyInfo.getApplyDepartmentId() });
		}
		return resultInt;
	}

	/**
	 * 修改
	 * 
	 * @param fundsApplyInfo
	 * @return
	 */
	public int update_Tx(FundsApplyInfo fundsApplyInfo, FundsApproval fundsApproval) {
		if (fundsApproval.getResult() == 1) {
			if (fundsApplyInfo.getStep() == 6) {
				fundsApplyInfo.setStep(fundsApproval.getStep());
				fundsApplyInfo.setStatus(1);
			} else if (fundsApplyInfo.getStep() == 5 && fundsApplyInfo.getMoney() < 30000) {
				fundsApplyInfo.setStep(fundsApproval.getStep());
				fundsApplyInfo.setStatus(1);
			} else if (fundsApplyInfo.getStep() == 1 && fundsApplyInfo.getIsSyscg() == 0) {
				fundsApplyInfo.setStep(fundsApproval.getStep() + 2);
				fundsApplyInfo.setStatus(0);
			} else {
				fundsApplyInfo.setStep(fundsApproval.getStep() + 1);
				fundsApplyInfo.setStatus(0);
			}
		} else {
			fundsApplyInfo.setStatus(fundsApproval.getResult());
		}
		String sql = "update funds_apply_info set name=?,type_name=?,money=?,remark=?,work_content=?,pay_details=?,step=?,status=? where id=?";
		int resultInt = basalDao.runUSql(
				sql,
				new Object[] { fundsApplyInfo.getName(), fundsApplyInfo.getTypeName(), fundsApplyInfo.getMoney(), fundsApplyInfo.getRemark(), fundsApplyInfo.getWorkContent(),
						fundsApplyInfo.getPayDetails(), fundsApplyInfo.getStep(), fundsApplyInfo.getStatus(), fundsApplyInfo.getId() });
		if (resultInt == 1) {
			basalDao.runUSql("delete from data_file_info where target_table='funds_apply_info' and target_id=?", new Object[] { fundsApplyInfo.getId() });
			for (DataFileInfo dataFileInfo : fundsApplyInfo.getDataFileInfoList()) {
				sql = "insert into data_file_info (target_table,target_id,file_name,file_url) values (?,?,?,?)";
				basalDao.runUSql(sql, new Object[] { dataFileInfo.getTargetTable(), fundsApplyInfo.getId(), dataFileInfo.getFileName(), dataFileInfo.getFileUrl() });
			}
			basalDao.runUSql("delete from funds_apply_stock_entry where apply_id=?", new Object[] { fundsApplyInfo.getId() });
			for (FundsApplyStockEntry fundsApplyStockEntry : fundsApplyInfo.getFundsApplyStockEntryList()) {
				sql = "insert into funds_apply_stock_entry(apply_id,name,money,amount,remark,buy_amount) values(?,?,?,?,?,?)";
				basalDao.runUSql(sql,
						new Object[] { fundsApplyInfo.getId(), fundsApplyStockEntry.getName(), fundsApplyStockEntry.getMoney(), fundsApplyStockEntry.getAmount(), fundsApplyStockEntry.getRemark(), 0 });
			}
			sql = "insert into funds_approval(apply_id,approval_staff_id,approval_time,result,step,remark,file_name,file_url) values (?,?,now(),?,?,?,?,?)";
			basalDao.runUSql(sql, new Object[] { fundsApplyInfo.getId(), fundsApproval.getApprovalStaffId(), fundsApproval.getResult(), fundsApproval.getStep(), fundsApproval.getRemark(),
					fundsApproval.getFileName(), fundsApproval.getFileUrl() });
			int approvalId = basalDao.queryInt("select id from funds_approval where apply_id=? and approval_staff_id=? and result=? and step=? order by id desc limit 1",
					new Object[] { fundsApplyInfo.getId(), fundsApproval.getApprovalStaffId(), fundsApproval.getResult(), fundsApproval.getStep() });
			basalDao.runUSql(
					"insert into funds_apply_info_log (apply_id,approval_id,num,name,type_name,money,work_content,remark,pay_details,apply_staff_id,apply_department_id,apply_time,step,status,is_buy) values (?,?,?,?,?,?,?,?,?,?,?,now(),?,?,0)",
					new Object[] { fundsApplyInfo.getId(), approvalId, fundsApplyInfo.getNum(), fundsApplyInfo.getName(), fundsApplyInfo.getTypeName(), fundsApplyInfo.getMoney(),
							fundsApplyInfo.getWorkContent(), fundsApplyInfo.getRemark(), fundsApplyInfo.getPayDetails(), fundsApplyInfo.getApplyStaffId(), fundsApplyInfo.getApplyDepartmentId(),
							fundsApproval.getStep(), fundsApproval.getResult() });
		}
		return resultInt;
	}

	public void del(int id) {
		String sql = "delete from funds_apply_info where id=?";
		basalDao.runUSql(sql, new Object[] { id });
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
