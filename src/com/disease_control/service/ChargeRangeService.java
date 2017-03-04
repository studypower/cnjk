package com.disease_control.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.From;
import javax.persistence.criteria.Order;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.ChargeRange;

/**
 * 分管范围
 * 
 * @author
 * 
 */
public class ChargeRangeService {
	/**
	 * 列表
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @param staffId
	 * @param departmentName
	 * @return
	 */
	public Page list(int pageIndex, int pageSize, int staffId) {
		List paramList = new ArrayList();
		String sql = "select cr.id,cr.department_ids,si.name as staffName from charge_range as cr inner join staff_info as si on cr.staff_id=si.id where 1=1";
		if (staffId > 0) {
			sql += " and cr.staff_id=?";
			paramList.add(staffId);
		}
        sql+=" order by cr.id desc";
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		Page page = basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, params);
		List<Map> list = (List<Map>) page.getResult();
		for (Map map : list) {
			sql = "select name from department_info where id in(" + map.get("department_ids") + ") and status=1";
			List<Map> departmentList = basalDao.queryList(sql, new Object[] {});
			String departmentNames = "";
			for (Map departmnetMap : departmentList) {
				if (departmentNames != "") {
					departmentNames += ",";
				}
				departmentNames += departmnetMap.get("name");
			}
			map.put("departmentNames", departmentNames);
		}
		return page;
	}

	/**
	 * 添加
	 * 
	 * @param chargeRange
	 * @return
	 */
	public int add(ChargeRange chargeRange) {
		String sql = "select count(1) from charge_range where staff_id=?";
		if (basalDao.queryInt(sql, new Object[] { chargeRange.getStaffId() }) > 0) {
			return -1;
		}
		sql = "insert into charge_range(staff_id,department_ids) values (?,?)";
		return basalDao.runUSql(sql, new Object[] { chargeRange.getStaffId(), chargeRange.getDepartmentIds() });
	}

	/**
	 * 详情
	 * 
	 * @param id
	 * @return
	 */
	public Map get(int id) {
		String sql = "select cr.id,cr.department_ids,si.name as staffName from charge_range as cr inner join staff_info as si on cr.staff_id=si.id where cr.id=?";
		Map map=basalDao.queryMap(sql, new Object[] { id });
		sql = "select id,name from department_info where id in(" + map.get("department_ids") + ") and status=1";
		List<Map> departmentList = basalDao.queryList(sql, new Object[] {});
		map.put("departmentList",departmentList);
		return map;
	}

	/**
	 * 修改
	 * 
	 * @param chargeRange
	 * @return
	 */
	public int update(ChargeRange chargeRange) {
		String sql = "update charge_range set department_ids=? where id=?";
		return basalDao.runUSql(sql, new Object[] { chargeRange.getDepartmentIds(),chargeRange.getId() });
	}
	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	public void del(int id){
		String sql="delete from charge_range where id=?";
		basalDao.runUSql(sql,new Object[]{id});
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
