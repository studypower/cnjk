package com.disease_control.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;

/**
 * 考勤首页Service
 * 
 * @author hqjiang
 * 
 */
public class KqsyService {

	public static Logger logger = Logger.getLogger(KqsyService.class);

	public Page ztZhList(int index, int size, String staffid, String attendance_status, String timeModelId, String riqi) {
		StringBuffer sql = new StringBuffer();
		sql.append(" select ");
		sql.append(" oa.id,oa.attendance_status,os.name attendance_name,date_format(oa.attendance_time,'%Y-%m-%d') attendance_time,oa.balance_status, ");
		sql.append(" oa.department_id,de.name department_name,oa.remarks,oa.staff_info_id,st.name staff_name, ");
		sql.append(" oa.times_detail_id,od.name time_detail_name,u.name user_name ");
		sql.append(" from ");
		sql.append(" oa_attendance_info oa, ");
		sql.append(" oa_times_detail od, ");
		sql.append(" department_info de, ");
		sql.append(" staff_info st, ");
		sql.append(" oa_sys_dict os,user_info u ");
		sql.append(" where u.staff_id = oa.staff_info_id ");
		sql.append(" and oa.times_detail_id = od.id ");
		sql.append(" and de.id = oa.department_id ");
		sql.append(" and st.id = oa.staff_info_id ");
		sql.append(" and os.code = oa.attendance_status ");
		sql.append(" and os.ext_type = '1' ");
		sql.append(" and oa.is_delete='0' ");
		List<String> list = new ArrayList<String>();
		if (StringUtils.isNotEmpty(staffid) && !staffid.equals("-1")) {
			sql.append(" and oa.staff_info_id=? ");
			list.add(staffid);
		}
		if (StringUtils.isNotEmpty(attendance_status) && !attendance_status.equals("-1")) {
			sql.append(" and oa.attendance_status=? ");
			list.add(attendance_status);
		}
		if (StringUtils.isNotEmpty(riqi)) {
			sql.append(" and oa.attendance_time = str_to_date(?,'%Y-%m-%d') ");
			list.add(riqi);
		}
		if (StringUtils.isNotEmpty(timeModelId)) {
			sql.append(" and od.model_id = ? ");
			list.add(timeModelId);
		}
		sql.append(" order by ");
		sql.append(" oa.id desc,od.order_num asc ");
		logger.info(sql.toString());
		return this.basalDao.pagedQuery_mysql_sql(sql.toString(), index, size, list.toArray());
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> kqsyZtcx(String staffid, String attendance_status, String timeModelId, String riqi) {
		StringBuffer sql = new StringBuffer();
		sql.append(" select ");
		sql.append(" oa.department_id, ");
		sql.append(" oa.attendance_status, ");
		sql.append(" count(1) attendance_count ");
		sql.append(" from ");
		sql.append(" oa_attendance_info oa, ");
		sql.append(" oa_times_detail ot ");
		sql.append(" where 1 = 1 ");
		sql.append(" and ot.id = oa.times_detail_id ");
		sql.append(" and oa.is_delete='0' ");
		List<String> list = new ArrayList<String>();
		if (StringUtils.isNotEmpty(staffid) && !staffid.equals("-1")) {
			sql.append(" and oa.staff_info_id=? ");
			list.add(staffid);
		}
		if (StringUtils.isNotEmpty(attendance_status) && !attendance_status.equals("-1")) {
			sql.append(" and oa.attendance_status=? ");
			list.add(attendance_status);
		}
		if (StringUtils.isNotEmpty(riqi)) {
			sql.append(" and oa.attendance_time = str_to_date(?,'%Y-%m-%d') ");
			list.add(riqi);
		}
		if (StringUtils.isNotEmpty(timeModelId)) {
			sql.append(" and ot.model_id = ? ");
			list.add(timeModelId);
		}
		sql.append(" group by oa.department_id,oa.attendance_status ");
		logger.info(sql.toString());
		return this.basalDao.queryList(sql.toString(), list.toArray());
	}

	public List<Map<String, Object>> kqsysy(String riqi, String modeid, String deptid) {
		StringBuffer sql = new StringBuffer();
		sql.append(" select oa.attendance_status,oa.staff_info_id,st.name staff_name ");
		sql.append(" from oa_attendance_info oa,oa_times_detail od,staff_info st ");
		sql.append(" where oa.is_delete = '0' ");
		sql.append(" and st.id = oa.staff_info_id ");
		sql.append(" and od.id = oa.times_detail_id ");
		sql.append(" and date_format(oa.attendance_time,'%Y-%m-%d') = '" + riqi + "' ");
		sql.append(" and oa.department_id = '" + deptid + "' ");
		sql.append(" and od.model_id = '" + modeid + "' ");
		sql.append(" order by oa.attendance_status asc ");
		logger.info(sql.toString());
		return this.basalDao.queryList(sql.toString(), new Object[] {});
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> kqsyInfo(String riqi, String modeid, String deptid, String staffid) {
		StringBuffer sql = new StringBuffer();
		sql.append(" select oa.attendance_status,oa.staff_info_id,st.name staff_name,oa.remarks, s.name status ");
		sql.append(" from oa_attendance_info oa,oa_times_detail od,staff_info st,oa_sys_dict s ");
		sql.append(" where oa.is_delete = '0' ");
		sql.append(" and st.id = oa.staff_info_id ");
		sql.append(" and od.id = oa.times_detail_id ");
		sql.append(" and s.code = oa.attendance_status and s.ext_type='1' ");
		sql.append(" and oa.staff_info_id='" + staffid + "' ");
		sql.append(" and date_format(oa.attendance_time,'%Y-%m-%d') = '" + riqi + "' ");
		sql.append(" and oa.department_id = '" + deptid + "' ");
		sql.append(" and od.model_id = '" + modeid + "' ");
		logger.info(sql.toString());
		return this.basalDao.queryMap(sql.toString(), new Object[] {});
	}

	/**
	 * 根据日期查询值班信息
	 */
	public List<Map<String, Object>> zhibanByDay(String riqi) {
		String sql = "select oa.staff_info_id,st.name staff_name,oa.on_duty_type from oa_onduty_info oa,staff_info st where st.id=oa.staff_info_id and oa.is_delete='0' and date_format(oa.on_duty_time,'%Y-%m-%d') = ? ";
		logger.info(sql.toString());
		return this.basalDao.queryList(sql.toString(), new Object[] { riqi });
	}

	public List<Object> kqsyContent(String riqi, String deptid) {
		StringBuffer sqlsb = new StringBuffer();
		sqlsb.append("  ");
		sqlsb.append(" SELECT ");
		sqlsb.append(" staff_info_id, ");
		sqlsb.append(" s.name staff_info_name, ");
		sqlsb.append(" GROUP_CONCAT(Concat(attendance_status,';',order_num,';',timeName)) status_info ");
		sqlsb.append(" FROM ");
		sqlsb.append(" ( ");
		sqlsb.append(" SELECT ");
		sqlsb.append(" I.staff_info_id, ");
		sqlsb.append(" I.attendance_status, ");
		sqlsb.append(" D. NAME timeName, ");
		sqlsb.append(" D.order_num ");
		sqlsb.append(" FROM ");
		sqlsb.append(" OA_ATTENDANCE_INFO I, ");
		sqlsb.append(" oa_times_detail D ");
		sqlsb.append(" WHERE ");
		sqlsb.append(" I.is_delete = '0' ");
		sqlsb.append(" AND D.id = I.times_detail_id ");
		sqlsb.append(" AND I.department_id = '" + deptid + "' ");
		sqlsb.append(" AND I.attendance_time = STR_TO_DATE('" + riqi + "', '%Y-%m-%D') ");
		sqlsb.append(" ) t ");
		sqlsb.append(" INNER JOIN staff_info s where s.id=staff_info_id ");
		sqlsb.append(" GROUP BY staff_info_id ");
		logger.info(sqlsb.toString());
		return this.basalDao.queryList(sqlsb.toString(), new Object[] {});
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}
}
