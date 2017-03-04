package com.disease_control.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.log4j.Logger;
import org.hibernate.envers.tools.ArraysTools;

import com.disease_control.core.config.SystemConfig;
import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;

/**
 * 综合查询
 */
public class ZhcxService {
	public static Logger logger = Logger.getLogger(ZhcxService.class);

	/**
	 * 状态综合查询
	 */
	public Page ztZhList(int index, int size, String deptid, String userid, String staffid, String status, String selectDay, String selectMoh, String riqi_s, String riqi_e) {
		StringBuffer sql = new StringBuffer();
		sql.append(" select ");
		sql.append(" oa.id,oa.attendance_status,os.name attendance_name,date_format(oa.attendance_time,'%Y-%m-%d') attendance_time,oa.balance_status, ");
		sql.append(" oa.department_id,de.name department_name,oa.remarks,oa.staff_info_id,st.name staff_name, ");
		sql.append(" oa.times_detail_id,od.name time_detail_name ");
		sql.append(" from ");
		sql.append(" oa_attendance_info oa, ");
		sql.append(" oa_times_detail od, ");
		sql.append(" department_info de, ");
		sql.append(" staff_info st, ");
		sql.append(" oa_sys_dict os ");
		sql.append(" where ");
		sql.append(" oa.times_detail_id = od.id ");
		sql.append(" and de.id = oa.department_id ");
		sql.append(" and st.id = oa.staff_info_id ");
		sql.append(" and os.code = oa.attendance_status ");
		sql.append(" and os.ext_type = '1' ");
		sql.append(" and os.code != '5' ");
		List<String> list = new ArrayList<String>();
		if (StringUtils.isNotEmpty(deptid) && !deptid.equals("-1")) {
			sql.append(" and oa.department_id=? ");
			list.add(deptid);
		}
		if (StringUtils.isNotEmpty(staffid) && !staffid.equals("-1")) {
			sql.append(" and oa.staff_info_id=? ");
			list.add(staffid);
		}
		if (StringUtils.isNotEmpty(status) && !status.equals("-1")) {
			sql.append(" and oa.attendance_status=? ");
			list.add(status);
		}
		if (StringUtils.isNotEmpty(riqi_s)) {
			sql.append(" and oa.attendance_time >= str_to_date(?,'%Y-%m-%d') ");
			list.add(riqi_s);
		}
		if (StringUtils.isNotEmpty(riqi_e)) {
			sql.append(" and oa.attendance_time <= str_to_date(?,'%Y-%m-%d') ");
			list.add(riqi_e);
		}
		sql.append(" order by ");
		sql.append(" oa.id desc,od.order_num asc ");
		logger.info(sql.toString());
		return this.basalDao.pagedQuery_mysql_sql(sql.toString(), index, size, list.toArray());
	}

	public Page zbList(int index, int size, String deptid, String userid, String staffid, String status, String riqi_s, String riqi_e) {
		StringBuffer sql = new StringBuffer();
		sql.append(" select ");
		sql.append(" oa.id,oa.staff_info_id, ");
		sql.append(" st.name staff_name,oa.department_id, ");
		sql.append(" de.name department_name, ");
		sql.append(" date_format(oa.on_duty_time, '%Y-%m-%d') on_duty_time, ");
		sql.append(" oa.on_duty_type,oa.dalance_status,oa.remarks, ");
		sql.append(" o.name baseShu, ");
		sql.append(" ifnull(GET_BASEMONEY_BY_DATE(oa.on_duty_time),0) baseMoney, ");
		sql.append(" dayset.status dayStatus ");
		sql.append(" from ");
		sql.append(" oa_onduty_info oa ");
		sql.append(" left outer join oa_sys_dict o on o.code='1' and o.ext_type='3' and o.is_delete='0' ");
		sql.append(" left outer join oa_day_settings dayset on dayset.is_delete='0' and date_format(dayset.day_time,'%Y%m%d') = date_format(oa.on_duty_time,'%Y%m%d') ");
		sql.append(" ,staff_info st,department_info de ");
		sql.append(" where st.id = oa.staff_info_id and de.id = oa.department_id and oa.is_delete='0' ");
		sql.append(" and oa.on_duty_type='3' ");
		List<String> list = new ArrayList<String>();
		if (StringUtils.isNotEmpty(deptid) && !deptid.equals("-1")) {
			sql.append(" and oa.department_id=? ");
			list.add(deptid);
		}
		if (StringUtils.isNotEmpty(staffid) && !staffid.equals("-1")) {
			sql.append(" and oa.staff_info_id=? ");
			list.add(staffid);
		}
		if (StringUtils.isNotEmpty(status) && !status.equals("-1")) {
			sql.append(" and oa.dalance_status=? ");
			list.add(status);
		}
		if (StringUtils.isNotEmpty(riqi_s)) {
			sql.append(" and oa.on_duty_time >= str_to_date(?,'%Y-%m-%d') ");
			list.add(riqi_s);
		}
		if (StringUtils.isNotEmpty(riqi_e)) {
			sql.append(" and oa.on_duty_time <= str_to_date(?,'%Y-%m-%d') ");
			list.add(riqi_e);
		}
		sql.append(" order by oa.on_duty_time desc");
		logger.info(sql.toString());
		Page page = this.basalDao.pagedQuery_mysql_sql(sql.toString(), index, size, list.toArray());
		List<Map<String, Object>> results = (List<Map<String, Object>>) page.getResult();
		if (results != null && !results.isEmpty()) {
			List<Map<String, Object>> dicts = oaSysDictService.findDicts("4");
			int st1 = 10;
			int st2 = 20;
			int st3 = 20;
			for (Map<String, Object> map : dicts) {
				Integer code = new Integer((String) map.get("code"));
				Integer name = new Integer((String) map.get("name"));
				if (1 == code)
					st1 = name;
				else if (2 == code)
					st2 = name;
				else if (3 == code)
					st3 = name;
			}
			for (Map<String, Object> map : results) {
				String dayStatus = (String) map.get("dayStatus");
				String dalance_status = (String) map.get("dalance_status");
				Float baseShu = new Float("" + map.get("baseMoney"));
				float tiaoxiutianshu = 0;
				float zhibanfei = 0;
				if ("2".equals(dalance_status)) {// 调休
					if ("1".equals(dayStatus)) {// 双休
						tiaoxiutianshu = SystemConfig.TX_XISU_SHUANGXIU;
					} else if ("2".equals(dayStatus)) {
						tiaoxiutianshu = SystemConfig.TX_XISU_GZRI;
					} else if ("3".equals(dayStatus)) {// 三薪日
						tiaoxiutianshu = SystemConfig.TX_XISU_SANXINRI;
					}
				} else if ("3".equals(dalance_status)) {// 值班费
					if ("1".equals(dayStatus)) {// 双休
						zhibanfei = SystemConfig.ZBF_XISU_SHUANGXIU * baseShu + st2;
					} else if ("2".equals(dayStatus)) {// 工作日
						zhibanfei = SystemConfig.ZBF_XISU_GZRI * baseShu + st1;
					} else if ("3".equals(dayStatus)) {// 三薪日
						zhibanfei = SystemConfig.ZBF_XISU_SANXINRI * baseShu + st3;
					}
				}
				map.put("jiesuantianshu", tiaoxiutianshu);
				map.put("feiyong", zhibanfei);
			}
		}
		return page;

	}

	/**
	 * 值班费统计列表
	 * 
	 * @param riqi_s
	 *            结束日期 2014-10-09
	 * @param riqi_e
	 *            结束日期 2014-10-10
	 * @param yearMoh
	 *            年月 2014-10
	 * @return
	 */
	public Page zbftjList(int index, int size, String riqi_s, String riqi_e, String yearMoh, String staffid, String status) {
		StringBuffer sql = new StringBuffer();
		sql.append(" select * from (select ");
		sql.append(" user_code, ");
		sql.append(" user_name, ");
		sql.append(" group_concat(status) status_, ");
		sql.append(" group_concat(count) count_ ,");
		sql.append(" group_concat(base_Money) base_Money_, ");
		sql.append("0 status1,");
		sql.append("0 status2,");
		sql.append("0 status3");
		sql.append(" from ");
		sql.append(" ( ");
		sql.append(" select ");
		sql.append(" u.name user_code, ");
		sql.append(" st.name user_name, ");
		sql.append(" da.status status, ");
		sql.append(" CAST(count(da.status) as char) count, ");
		sql.append(" group_concat(ifnull(GET_BASEMONEY_BY_DATE(oa.on_duty_time),0)) base_Money ");
		sql.append(" from ");
		sql.append(" oa_onduty_info oa ");
		sql.append(" left outer join oa_day_settings da on da.is_delete = '0' ");
		sql.append(" and date_format(da.day_time, '%Y%m%d') = date_format(oa.on_duty_time, '%Y%m%d'), ");
		sql.append(" user_info u, ");
		sql.append(" staff_info st ");
		sql.append(" where ");
		sql.append(" u.staff_id = oa.staff_info_id ");
		sql.append(" and st.id = oa.staff_info_id ");
		sql.append(" and oa.on_duty_type ='3' ");// 只统计总值班人员的值班费
		sql.append(" and oa.is_delete = '0' ");
		sql.append(" and oa.dalance_status= " + status);
		List<String> list = new ArrayList<String>();
		if (StringUtils.isNotEmpty(riqi_s)) {
			sql.append(" and oa.on_duty_time >= str_to_date(?,'%Y-%m-%d') ");
			list.add(riqi_s);
		}
		if (StringUtils.isNotEmpty(riqi_e)) {
			sql.append(" and oa.on_duty_time <= str_to_date(?,'%Y-%m-%d') ");
			list.add(riqi_e);
		}
		if (StringUtils.isNotEmpty(yearMoh)) {// 年月限制
			sql.append(" and date_format(oa.on_duty_time,'%Y-%m') = ? ");
			list.add(yearMoh);
		}
		if (StringUtils.isNotEmpty(staffid)) {
			sql.append(" and oa.staff_info_id = ? ");
			list.add(staffid);
		}
		sql.append(" group by ");
		sql.append(" u.name, ");
		sql.append(" da.status ");
		sql.append(" order by ");
		sql.append(" da.status asc ");
		sql.append(" ) T ");
		sql.append(" group by ");
		sql.append(" user_code, ");
		sql.append(" user_name ) myTable ");
		logger.info(sql.toString());
		Page page = this.basalDao.pagedQuery_mysql_sql_zbftj(sql.toString(), index, size, list.toArray());
		if (page != null) {
			List<Map<String, Object>> result = (List<Map<String, Object>>) page.getResult();
			if (result != null) {
				List<Map<String, Object>> dicts = oaSysDictService.findDicts("4");
				int st1 = 10;
				int st2 = 20;
				int st3 = 20;
				for (Map<String, Object> map : dicts) {
					Integer code = new Integer((String) map.get("code"));
					Integer name = new Integer((String) map.get("name"));
					if (1 == code)
						st1 = name;
					else if (2 == code)
						st2 = name;
					else if (3 == code)
						st3 = name;
				}
				for (Map<String, Object> map : result) {
					calculationZBF(map, st1, st2, st3);
				}
			}
		}
		return page;
	}

	/**
	 * @函数名 calculationZBF
	 * @函数描述 计算值班费
	 * @创建时间 2015年3月2日 下午9:36:34
	 */
	public void calculationZBF(Map<String, Object> zbMap, int st1, int st2, int st3) {
		// st1工作日，st2双休日，st3三薪日
		double sumXiShu = 0;// 合计系数
		double sumFanTie = 0;// 合计饭贴
		double sum = 0;// 小计 薪资

		String status_ = (String) zbMap.get("status_");
		String count_ = (String) zbMap.get("count_");
		String baseMoney_ = (String) zbMap.get("base_Money_");

		String[] s = status_.split(",");
		String[] c = count_.split(",");
		String[] m = baseMoney_.split(",");
		int co = 0;
		Set<Integer> base_Money_2 = new HashSet<Integer>();
		for (int i = 0; i < s.length; i++) {
			Integer si = new Integer(s[i]);
			Integer ci = new Integer(c[i]);
			String[] dest = new String[ci];
			System.arraycopy(m, co, dest, 0, ci);
			for (int j = 0; j < ci; j++) {
				// 单个系数计算
				double xiShu = 0;
				Integer dj = Integer.valueOf(dest[j]);// 基数
				if (si == 1) {
					xiShu = SystemConfig.ZBF_XISU_SHUANGXIU;
				} else if (si == 2) {
					xiShu = SystemConfig.ZBF_XISU_GZRI;
				} else if (si == 3) {
					xiShu = SystemConfig.ZBF_XISU_SANXINRI;
				}

				sum += xiShu * dj;
				base_Money_2.add(dj);
			}
			co += ci;
			zbMap.put("status" + si, ci);
		}
		zbMap.put("baseShu", base_Money_2.toString().replaceAll("[\\[\\]]", ""));
		// // 合计系数
		sumXiShu = (Integer) zbMap.get("status2") * SystemConfig.ZBF_XISU_GZRI + (Integer) zbMap.get("status1") * SystemConfig.ZBF_XISU_SHUANGXIU + (Integer) zbMap.get("status3") * SystemConfig.ZBF_XISU_SANXINRI;
		zbMap.put("sumXiShu", sumXiShu);
		// // 合计饭贴
		sumFanTie = (Integer) zbMap.get("status2") * st1 + (Integer) zbMap.get("status1") * st2 + (Integer) zbMap.get("status3") * st3;
		zbMap.put("sumFanTie", sumFanTie);
		zbMap.put("sum", sum + sumFanTie);
	}

	/**
	 * 值班信息统计，领导值班和小分队听班不做值班费以及调休统计
	 * 
	 * @param staffid
	 * @param yearMoh
	 * @return
	 */
	public Map<String, Object> myStatusZbfInfo(String staffid, String yearMoh) {
		if (yearMoh != null) {
			String[] yearMohs = yearMoh.split("-");
			yearMoh = yearMohs[0] + "-" + (Integer.valueOf(yearMohs[1]) < 10 ? "0" : "") + yearMohs[1];
		}
		Map<String, Object> map = new HashMap<String, Object>();
		// 一共值班天数
		String sql1 = "select count(*) count from oa_onduty_info oa where oa.on_duty_time<=now()  and  oa.is_delete='0' and oa.on_duty_type='3' and oa.staff_info_id='" + staffid + "' and date_format(oa.on_duty_time, '%Y-%m') = '" + yearMoh + "'";
		logger.info(sql1.toString());
		int sumCount = this.basalDao.queryInt(sql1, new Object[] {});
		map.put("sumCount", sumCount);

		// 值班费用 工作日
		String s1 = "select count(*) count from oa_onduty_info oa,oa_day_settings days where oa.is_delete='0' and days.is_delete='0' and oa.on_duty_type='3' and oa.on_duty_time=days.day_time and oa.on_duty_time<=now() and oa.dalance_status='3' and date_format(oa.on_duty_time, '%Y-%m') =? and days.status='2' and oa.staff_info_id=? ";
		logger.info(s1.toString());
		int s1Count = this.basalDao.queryInt(s1, new Object[] { yearMoh, staffid });
		// 值班费用 双休日
		String s2 = "select count(*) count from oa_onduty_info oa,oa_day_settings days where oa.is_delete='0' and days.is_delete='0' and oa.on_duty_type='3' and oa.on_duty_time=days.day_time and oa.on_duty_time<=now() and oa.dalance_status='3' and date_format(oa.on_duty_time, '%Y-%m') =? and days.status='1' and oa.staff_info_id=? ";
		logger.info(s2.toString());
		int s2Count = this.basalDao.queryInt(s2, new Object[] { yearMoh, staffid });
		// 值班费用 三薪日
		String s3 = "select count(*) count from oa_onduty_info oa,oa_day_settings days where oa.is_delete='0' and days.is_delete='0' and oa.on_duty_type='3' and oa.on_duty_time=days.day_time and oa.on_duty_time<=now() and oa.dalance_status='3' and date_format(oa.on_duty_time, '%Y-%m') =? and days.status='3' and oa.staff_info_id=? ";
		logger.info(s3.toString());
		int s3Count = this.basalDao.queryInt(s3, new Object[] { yearMoh, staffid });
		map.put("butieCount", s1Count + s2Count + s3Count);// 补贴天数

		// double sumXiShu = s1Count * SystemConfig.ZBF_XISU_GZRI + s2Count *
		// SystemConfig.ZBF_XISU_SHUANGXIU + s3Count *
		// SystemConfig.ZBF_XISU_SANXINRI;

		// List<Map<String, Object>> dicts = oaSysDictService.findDicts("4");
		// int st1 = 10;
		// int st2 = 20;
		// int st3 = 20;
		// for (Map<String, Object> map1 : dicts) {
		// Integer code = new Integer((String) map1.get("code"));
		// Integer name = new Integer((String) map1.get("name"));
		// if (1 == code)
		// st1 = name;
		// else if (2 == code)
		// st2 = name;
		// else if (3 == code)
		// st3 = name;
		// }
		// int baseSu = 84;
		// List<Map<String, Object>> dicts3 = oaSysDictService.findDicts("3");
		// if (dicts3 != null && !dicts3.isEmpty()) {
		// baseSu = new Integer((String) dicts3.get(0).get("name"));
		// }

		// double sumFanTie = s1Count * st1 + s2Count * st2 + s3Count * st3;

		// map.put("feiyong", sumXiShu * baseSu + sumFanTie);// 补贴费用
		Object resultObj = zbftjList(1, Integer.MAX_VALUE, "", "", yearMoh, staffid, "3").getResult();
		double feiyong = 0;
		if (resultObj != null) {
			List<Map<String, Object>> list = ((List<Map<String, Object>>) resultObj);
			if (!list.isEmpty()) {
				feiyong = (double) list.get(0).get("sum");
			}
		}
		map.put("feiyong", feiyong);// 补贴费用
		// 调休天数
		StringBuffer sql3 = new StringBuffer();
		sql3.append(" select da.status status,count(*) count ");
		sql3.append(" from oa_day_settings da where ");
		sql3.append(" date_format(da.day_time, '%Y-%m-%d') in ( ");
		sql3.append(" select date_format(oa.on_duty_time, '%Y-%m-%d') on_duty_time ");
		sql3.append(" from oa_onduty_info oa ");
		sql3.append(" where oa.on_duty_time<=now() and oa.is_delete = '0' and oa.on_duty_type='3' ");
		sql3.append(" and oa.staff_info_id = '" + staffid + "' ");
		sql3.append(" and date_format(oa.on_duty_time, '%Y-%m') = '" + yearMoh + "' ");
		sql3.append(" and oa.dalance_status='2' ");
		sql3.append(" ) ");
		sql3.append(" and da.is_delete = '0' ");
		sql3.append(" group by da.status ");

		logger.info(sql3.toString());
		List list = this.basalDao.queryList(sql3.toString(), new Object[] {});
		map.put("tiaoxiu", list);
		return map;
	}

	public List<Map<String, Object>> onDayByDays(String[] days) {
		StringBuffer ps = new StringBuffer();
		for (int i = 0; i < days.length; i++) {
			String string = days[i];
			if (i == 0) {
				ps.append("'" + string + "'");
			} else {
				ps.append(",'" + string + "'");
			}
		}

		StringBuffer sql = new StringBuffer();
		sql.append(" select ");
		sql.append(" date_format(oa.day_time, '%Y-%m-%d') day_time, ");
		sql.append(" oa.status ");
		sql.append(" from ");
		sql.append(" oa_day_settings oa ");
		sql.append(" where ");
		sql.append(" 	oa.is_delete = '0' ");
		sql.append(" and date_format(oa.day_time, '%Y-%m-%d') in (" + ps + ") ");

		logger.info(sql.toString());
		return basalDao.queryList(sql.toString(), new Object[] {});
	}

	private BasalDao basalDao;
	private OASysDictService oaSysDictService;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

	public void setOaSysDictService(OASysDictService oaSysDictService) {
		this.oaSysDictService = oaSysDictService;
	}

}
