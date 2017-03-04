package com.disease_control.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.DepartmentInfo;

/**
 * 处理部门业务
 * 
 * @author
 * 
 */
public class DepartmentInfoService {

	public Page list(int pageIndex, int pageSize, int baseId, String name) {
		ArrayList paramList = new ArrayList();
		String sql = "select di.*,di2.name as baseName from department_info as di left join department_info as di2 on di.base_id=di2.id where di.base_id=?";
		paramList.add(baseId);
		if (name != null && !name.equals("")) {
			paramList.add("%" + name + "%");
		}
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		Page page = basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, params);
		ArrayList<Map> resultList = (ArrayList<Map>) page.getResult();
		for (Map result : resultList) {
			List<Map> childDepartmentInfoList = (List<Map>) basalDao.queryList("select * from department_info where base_id=?", new Object[] { result.get("id") });
			String childDepartmentNames = "";
			for (Map childDepartmentInfo : childDepartmentInfoList) {
				if (!childDepartmentNames.equals("")) {
					childDepartmentNames += ",";
				}
				childDepartmentNames += childDepartmentInfo.get("name");
			}
			result.put("child_department_names", childDepartmentNames);
		}
		return page;
	}

	/**
	 * 添加部门信息
	 * 
	 * @param departmentInfo
	 * @return
	 */
	public int add(DepartmentInfo departmentInfo) {
		String sql = "insert into department_info (name,role_id,base_id,status,isKqsyShow,kqsyOrder) values (?,?,?,1,?,?)";
		return basalDao.runUSql(sql, new Object[] { departmentInfo.getName(), departmentInfo.getRoleId(), departmentInfo.getBaseId(), departmentInfo.getIsKqsyShow(), departmentInfo.getKqsyOrder() });
	}

	/**
	 * 获取部门信息
	 * 
	 * @param id
	 * @return
	 */
	public Map get(int id) {
		String sql = "select id,name,role_id,isKqsyShow,kqsyOrder from department_info where id=?";
		return basalDao.queryMap(sql, new Object[] { id });
	}

	/**
	 * 更改部门信息
	 * 
	 * @param departmentInfo
	 * @return
	 */
	public int update(DepartmentInfo departmentInfo) {
		String sql = "update department_info set name=?,role_id=?,isKqsyShow=?,kqsyOrder=? where id=?";
		return basalDao.runUSql(sql, new Object[] { departmentInfo.getName(), departmentInfo.getRoleId(), departmentInfo.getIsKqsyShow(), departmentInfo.getKqsyOrder(), departmentInfo.getId() });
	}

	/**
	 * 修改状态
	 * 
	 * @return
	 */
	public void updateStatus(int id, int status) {
		String sql = "update department_info set status=? where id=?";
		basalDao.runUSql(sql, new Object[] { status, id });
	}

	/**
	 * 删除部门信息
	 * 
	 * @param id
	 * @return
	 */
	public int del(int id, int baseId) {
		String sql = "select count(1) from staff_info where department_id=?";
		if (basalDao.queryInt(sql, new Object[] { id }) > 0) {
			return -1;// 说明还有在职员工信息
		}
		if (baseId == 0) {
			sql = "select count(1) from department_info where base_id=?";
			if (basalDao.queryInt(sql, new Object[] { id }) > 0) {
				return -2;// 说明存在下级部门
			}
		}
		sql = "delete from department_info where id=?";
		int resultInt = basalDao.runUSql(sql, new Object[] { id });
		if (resultInt > 0) {
			sql = "delete from department_position where department_id=?";
			basalDao.runUSql(sql, new Object[] { id });
		}
		return resultInt;
	}

	/**
	 * 获取所有状态为开启的部门
	 * 
	 * @return
	 */
	public List list() {
		String sql = "select id,name from department_info where status=1 order by id asc";
		return basalDao.queryList(sql, new Object[] {});
	}
	
	/**
	 * 获取所有状态为开启的部门
	 * 
	 * @return
	 */
	public List listById(Integer deptId) {
		String sql = "select id,name from department_info where status=1 and id=? order by id asc";
		return basalDao.queryList(sql, new Object[] {deptId});
	}
	/**
	 * 考勤首页可以展示的部门内容
	 */
	public List kqsyList() {
		String sql = "select di.id,di.name,(select count(*) from staff_info si where si.department_id=di.id and si.status=1 ) usersize from department_info di where di.status=1 and di.isKqsyShow=1 order by di.kqsyOrder asc ";
		return basalDao.queryList(sql, new Object[] {});
	}

	/**
	 * 查询列表用于生成树形菜单
	 * 
	 * @return
	 */
	public List listByTree() {
		String sql = "select CONCAT('0_',id) as `key`, '' as parent_key, name from department_info where status=1";
		return basalDao.queryList(sql, new Object[] {});
	}

	/**
	 * 培训部门信息
	 */
	public List listBytn(String departmentIds) {
		String sql = "select id,name from department_info where id in (" + departmentIds + ")";
		return basalDao.queryList(sql, new Object[] {});
	}

	public List listByDdw(int deparmentId1) {
		String sql = "select id,name from department_info where id not in(select department_id2 as id from department_department_word where department_id1=?)";
		return basalDao.queryList(sql, new Object[] { deparmentId1 });
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}
}
