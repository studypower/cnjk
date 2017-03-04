package com.disease_control.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.UserInfo;
import com.yakov.utils.DateUtil;
import com.yakov.utils.Md5Util;

/**
 * 处理用户业务
 * 
 * @author
 * 
 */
public class UserInfoService {
	/**
	 * 登陆
	 * 
	 * @param name
	 * @param pwd
	 * @return
	 */
	public Map login(String name, String pwd) {
		String sql = "select ui.id,ui.name,ui.grade,ui.role_id as roleId,si.id as staffId,si.name as staffName,si.department_id as departmentId,di.name as departmentName,di.role_id as departmentRoleId,pi.id as posttionId,pi.name as positionName,si.email from user_info as ui inner join staff_info as si on ui.staff_id=si.id left join department_info as di on di.id=si.department_id and di.status=1 left join position_info as pi on pi.id=si.position_id and pi.status=1 where ui.name=? and ui.pwd=? and ui.status=1";
		Map userInfoMap = basalDao.queryMap(sql, new Object[] { name, pwd });
		if (userInfoMap != null) {
			List<Map<String, String>> keyList = new ArrayList<Map<String, String>>();
			sql = "select menu_key as `key` from user_menu where user_id=?";
			keyList.addAll(basalDao.queryList(sql, new Object[] { userInfoMap.get("id") }));
			if (keyList.size() > 0) {
				String keys = "";
				for (Map keyMap : keyList) {
					if (!keys.equals("")) {
						keys += ",";
					}
					keys += "\"" + keyMap.get("key") + "\"";
				}
			}
			ArrayList<String> _keyList = new ArrayList<String>();
			for (Map<String, String> keyMap : keyList) {
				if (!_keyList.contains(keyMap.get("key"))) {
					_keyList.add(keyMap.get("key"));
				}
			}
			userInfoMap.put("keyList", _keyList);
		}
		return userInfoMap;
	}

	/**
	 * 登出记录
	 */
	public void logOut(Map userInfoMap) {
	}

	public List list(int grade) {
		String sql = "select id,name,grade from user_info where grade=? and status=1";
		return basalDao.queryList(sql, new Object[] { grade });
	}

	/**
	 * 根据条件获取用户列表
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @param userName
	 * @return
	 */
	public Page list(int pageIndex, int pageSize, String userName, String staffName, int departmentId, String roleName) {
		StringBuffer sql = new StringBuffer();
		ArrayList paramList = new ArrayList();
		sql.append("select ui.id as id,ui.name as name,ui.pwd as pwd,ui.grade as grade,ui.status as status,si.id as staffId,si.name as staffName,di.name as departmentName,ri.id as roleId,ri.name as roleName from user_info as ui left join staff_info as si on ui.staff_id=si.id left join role_info as ri on ri.id=ui.role_id left join department_info as di on di.id=si.department_id where 1=1");
		if (userName != null && !userName.equals("")) {
			sql.append(" and ui.name like ?");
			paramList.add("%" + userName + "%");
		}
		if (departmentId != -100) {
			sql.append(" and si.department_id=?");
			paramList.add(departmentId);
		}
		if (staffName != null && !staffName.equals("")) {
			sql.append(" and si.name like ?");
			paramList.add("%" + staffName + "%");
		}
		if (roleName != null && !roleName.equals("")) {
			sql.append(" and ri.name like ?");
			paramList.add("%" + roleName + "%");
		}
		sql.append(" order by ui.name asc");
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		return basalDao.pagedQuery_mysql_sql(sql.toString(), pageIndex, pageSize, params);
	}

	/**
	 * 添加用户信息
	 * 
	 * @param userInfo
	 * @return
	 */
	public int add(UserInfo userInfo) {
		String sql = "select count(1) from user_info where name = ?";
		if (basalDao.queryInt(sql, new Object[] { userInfo.getName() }) == 1) {
			return 0;
		}
		sql = "insert into user_info (name, pwd, grade, staff_id, role_id, status) values (?,?,?,?,?,1)";
		int resultInt = basalDao.runUSql(sql, new Object[] { userInfo.getName(), userInfo.getPwd(), userInfo.getGrade(), userInfo.getStaffId(), userInfo.getRoleId() });
		if (resultInt == 1 && userInfo.getMenuKeys() != null && !userInfo.getMenuKeys().equals("")) {
			sql = "select max(id) from user_info where name=? and status=1";
			int userId = basalDao.queryInt(sql, new Object[] { userInfo.getName() });
			String[] menuKeys = userInfo.getMenuKeys().split(",");
			List<Object[]> paramsList = new ArrayList<Object[]>();
			for (String menuKey : menuKeys) {
				paramsList.add(new Object[] { userId, menuKey });
			}
			basalDao.runUSqls("insert into user_menu(user_id, menu_key) values(?,?)", paramsList);
		}
		return resultInt;
	}

	/**
	 * 获取用户信息
	 * 
	 * @param id
	 * @return
	 */
	public Map get(int id) {
		String sql = "select ui.id as id,ui.name as name,ui.grade as grade,si.id as staffId,si.name as staffName,di.id as departmentId,di.name as departmentName,ri.id as roleId,ri.name as roleName from user_info as ui left join staff_info as si on ui.staff_id=si.id left join department_info as di on si.department_id=di.id left join role_info as ri on ri.id=ui.role_id where ui.status=1 and ui.id=?";
		return basalDao.queryMap(sql, new Object[] { id });
	}

	/**
	 * 更改用户信息
	 * 
	 * @param userInfo
	 * @return
	 */
	public int update(UserInfo userInfo) {
		String sql = "select count(1) from user_info where name=? and id<>?";
		if (basalDao.queryInt(sql, new Object[] { userInfo.getName(), userInfo.getId() }) == 1) {
			return 0;
		}
		if (userInfo.getPwd() == null || userInfo.getPwd().equals("")) {
			Map userInfoMap = basalDao.queryMap("select pwd from user_info where id=?", new Object[] { userInfo.getId() });
			userInfo.setPwd(userInfoMap.get("pwd").toString());
		} else {
			userInfo.setPwd(Md5Util.encrypt32(userInfo.getPwd()));
		}
		sql = "update user_info set name=?,pwd=?,staff_id=?,role_id=? where id=?";
		int resultInt = basalDao.runUSql(sql, new Object[] { userInfo.getName(), userInfo.getPwd(), userInfo.getStaffId(), userInfo.getRoleId(), userInfo.getId() });
		if (resultInt == 1 && userInfo.getMenuKeys() != null && !userInfo.getMenuKeys().equals("")) {
			sql = "delete from user_menu where user_id=?";
			basalDao.runUSql(sql, new Object[] { userInfo.getId() });
			String[] menuKeys = userInfo.getMenuKeys().split(",");
			List<Object[]> paramsList = new ArrayList<Object[]>();
			for (String menuKey : menuKeys) {
				paramsList.add(new Object[] { userInfo.getId(), menuKey });
			}
			basalDao.runUSqls("insert into user_menu(user_id, menu_key) values(?,?)", paramsList);
		}
		return resultInt;
	}

	/**
	 * 删除用户信息
	 * 
	 * @param id
	 * @return
	 */
	public int del_Tx(int id) {
		String sql = "delete from user_menu where user_id=?";
		basalDao.runUSql(sql, new Object[] { id });
		sql = "delete from user_info where id=?";
		return basalDao.runUSql(sql, new Object[] { id });
	}

	/**
	 * 
	 * @param id
	 * @return
	 */
	public Map my(int id) {
		String sql = "select ui.name as userName,si.name as name,si.id_num as idNum,si.sex as sex,si.email as email,si.landLine, si.phone as phone, si.enter_time as enterTime,si.departure_time as departureTime,di.name as departmentName,pi.name as positionName from user_info as ui left join staff_info as si on ui.staff_id=si.id left join staff_department as sd on si.id=sd.staff_id left join department_info as di on sd.department_id=si.id left join position_info as pi on sd.podition_id=pi.id where ui.status=1 and ui.id=?";
		return basalDao.queryMap(sql, new Object[] { id });
	}

	public int updatePwd(UserInfo userInfo, String newPwd) {
		String sql = "select id from user_info where name=? and pwd=?";
		Map userMap = basalDao.queryMap(sql, new Object[] { userInfo.getName(), userInfo.getPwd() });
		if (userMap == null) {
			return -1;
		}
		sql = "update user_info set pwd=? where id=?";
		return basalDao.runUSql(sql, new Object[] { newPwd, userMap.get("id") });
	}

	public void unbundling_Tx(int id) {
		String sql = "update user_info set staff_id=0 where id=?";
		basalDao.runUSql(sql, new Object[] { id });
		sql = "delete from user_menu where user_id=?";
		basalDao.runUSql(sql, new Object[] { id });
	}

	public void status_Tx(int id, int status) {
		String sql = "update user_info set status=? where id=?";
		basalDao.runUSql(sql, new Object[] { status, id });
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}
}
