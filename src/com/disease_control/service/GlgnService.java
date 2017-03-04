package com.disease_control.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;
import org.apache.log4j.Logger;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;

/**
 * 工作日设置Service
 * @author hqjiang
 *
 */
public class GlgnService {
	public static Logger logger=Logger.getLogger(GlgnService.class);
	
	/**
	 * 工作日设置
	 */
	public int daySettings(String[] days, String status, Map<String, Object> curUser) {
		// 查询该日是否在数据库中已经存在
		// 如果不存在，则该日的数据作为新增处理
		// 如果存在，则该日的数据设置作为修改处理
		for (String day : days) {
			String sql1 = "select count(*) count from oa_day_settings oa where oa.is_delete='0' and date_format(oa.day_time,'%Y-%m-%d')=?";
			logger.info(sql1.toString());
			if (basalDao.queryInt(sql1, new Object[] { day }) > 0) {// 表示数据存在，进行修改处理
				String sql2 = "update oa_day_settings oa set oa.day_time=str_to_date(?,'%Y-%m-%d'),oa.update_time=now(),oa.update_user=?,oa.status=? where oa.is_delete='0' and date_format(oa.day_time,'%Y-%m-%d')=?";
				logger.info(sql2.toString());
				basalDao.runUSql(sql2, new Object[] { day, curUser.get("name"), status, day });
			} else {// 表示数据不存在，进行新增处理
				String sql3 = "insert into oa_day_settings(day_time,status,create_time,create_user,update_time,update_user,is_delete)values(?,?,now(),?,now(),?,'0')";
				logger.info(sql3.toString());
				basalDao.runUSql(sql3, new Object[] { day, status, curUser.get("name"), curUser.get("name") });
			}
		}
		return 1;
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> findByYear(String year) {
		String sql = "select date_format(oa.day_time,'%Y-%m-%d') day_time,oa.status from oa_day_settings oa where oa.is_delete='0' and date_format(oa.day_time,'%Y')=?";
		logger.info(sql.toString());
		return this.basalDao.queryList(sql, new Object[] { year });
	}

	/**
	 * 保存状态信息
	 */
	public Integer saveZt(String attendance_status, String attendance_time, String timeModelId, String timeModelName, String remarks, String staffid, String deptid, String balance_status,
			String onduty_type, Map<String, Object> curUser) {

		String[] ses = timeModelName.replaceAll("[ ]", "").split("[—:]");
		Integer start_seconds = Integer.valueOf(ses[0]) * 60 + Integer.valueOf(ses[1]);
		Integer end_seconds = Integer.valueOf(ses[2]) * 60 + Integer.valueOf(ses[3]);
		String[] modelsids = timeModelId.split("-");

		// 保存状态数据的同时需要对该段时间内的数据进行以前状态数据的清除处理工作
		String sql = " update oa_attendance_info i,oa_times_detail d set i.is_delete='1' where i.times_detail_id = d.id and d.order_num = ? ";
		sql += " and i.is_delete = '0' and date_format(i.attendance_time,'%Y-%m-%d') =? and i.staff_info_id = ? ";
		sql += " and i.attendance_status != '5' ";
		logger.info(sql.toString());
		this.basalDao.runUSql(sql, new Object[] { modelsids[1], attendance_time, staffid });

		String sql1 = "insert into oa_times_detail(start_seconds,end_seconds,name,model_id,create_time,create_user,update_time,update_user,is_delete,order_num)";
		sql1 += "values(?,?,?,?,now(),?,now(),?,'0',?)";
		logger.info(sql1.toString());
		Long oa_times_detailId = this.basalDao.insertAndGetKey(sql1, start_seconds, end_seconds, timeModelName, modelsids[0], curUser.get("name"), curUser.get("name"), modelsids[1]);
		
		String sql2 = "insert into oa_attendance_info(staff_info_id,department_id,attendance_status,balance_status,attendance_time,times_detail_id,remarks,create_time,create_user,update_time,update_user,is_delete,onduty_type)";
		sql2 += "values(?,?,?,?,str_to_date(?,'%Y-%m-%d')," + oa_times_detailId + ",?,now(),?,now(),?,'0',?)";
		logger.info(sql2.toString());
		Long infoId = basalDao.insertAndGetKey(sql2, staffid, deptid, attendance_status, balance_status, attendance_time, remarks, curUser.get("name"), curUser.get("name"), onduty_type);

		return infoId.intValue();// 获取该条数据的ID
	}

	public Integer updZt(String id, String attendance_status, String attendance_time, String timeModelId, String timeModelName, String remarks, String staffid, String deptid, String jiesuan,
			Map<String, Object> curUser) {
		if (StringUtils.isEmpty(jiesuan)) {
			StringBuffer sql = new StringBuffer("update oa_attendance_info oa set oa.update_time=now(),oa.update_user='" + curUser.get("name") + "' ");
			List<Object> list = new ArrayList<Object>();
			if (StringUtils.isNotEmpty(attendance_status)) {
				sql.append(",oa.attendance_status=?");
				list.add(attendance_status);
			}
			if (StringUtils.isNotEmpty(remarks)) {
				sql.append(",oa.remarks=?");
				list.add(remarks);
			} else {
				sql.append(",oa.remarks=''");
			}
			sql.append(" where oa.id=?");
			list.add(id);
			logger.info(sql.toString());
			return basalDao.runUSql(sql.toString(), list.toArray());
		} else {
			// 值日状态的修改
			StringBuffer sql = new StringBuffer("update oa_attendance_info oa set oa.update_time=now(),oa.update_user='" + curUser.get("name") + "' ");
			
			List<Object> list = new ArrayList<Object>();
			if (StringUtils.isNotEmpty(attendance_status)) {
				sql.append(",oa.attendance_status=?");
				list.add(attendance_status);
			}
			sql.append(",oa.balance_status=?");
			list.add(jiesuan);
			if (StringUtils.isNotEmpty(remarks)) {
				sql.append(",oa.remarks=?");
				list.add(remarks);
			} else {
				sql.append(",oa.remarks=''");
			}
			sql.append(" where oa.is_delete='0' and oa.staff_info_id=? ");
			list.add(staffid);
			sql.append(" and date_format(oa.attendance_time,'%Y-%m-%d')=? ");
			list.add(attendance_time);
			logger.info(sql.toString());
			basalDao.runUSql(sql.toString(), list.toArray());
			List<Object> list2 = new ArrayList<Object>();
			StringBuffer sql2 = new StringBuffer("update oa_onduty_info set update_time=now() ");
			if (StringUtils.isNotEmpty(jiesuan)) {
				sql2.append(",dalance_status=? ");
				list2.add(jiesuan);
			}
			sql2.append(",remarks=? ");
			list2.add(remarks);
			sql2.append(",update_user=?");
			list2.add(curUser.get("name"));
			sql2.append(" where is_delete='0' and date_format(on_duty_time,'%Y-%m-%d')=? and on_duty_type=? and staff_info_id=?");
			list2.add(attendance_time);
			list2.add("3");// 只能针对总值班人员进行修改
			list2.add(staffid);
			return basalDao.runUSql(sql2.toString(), list2.toArray());
		}
	}

	/**
	 * 验证指定时间段内的状态是否已经存在值班信息
	 */
	public Integer valDataSaveZt(String staffid, String attendance_time, String model_id) {
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) count from oa_attendance_info oa,oa_times_detail od ");
		sql.append(" where	oa.is_delete = '0' and oa.times_detail_id = od.id and oa.attendance_status = '5' ");// 值班状态为5
		sql.append(" and oa.staff_info_id =? and date_format(oa.attendance_time,'%Y-%m-%d') = ? and od.model_id=? ");
		return basalDao.queryInt(sql.toString(), new Object[] { staffid, attendance_time, model_id });
	}

	/**
	 * 删除时间段内状态
	 * 
	 * @param riqi1
	 *            开始时间
	 * @param riqi2
	 *            结束时间
	 */
	public void deleteZt(String staffid, String riqi1, String riqi2) {
		String sql = "update oa_attendance_info oa set oa.is_delete='1' where oa.attendance_status != '5' and oa.staff_info_id = ? and oa.attendance_time>=str_to_date(?,'%Y-%m-%d') and oa.attendance_time<=str_to_date(?,'%Y-%m-%d') ";
		this.basalDao.runUSql(sql, new Object[] { staffid, riqi1, riqi2 });
	}

	/**
	 * 查询考勤状态信息
	 */
	public List<Map<String, Object>> findZt(String staffid, String deptid, String year, String moh) {
		StringBuffer sql = new StringBuffer(
				"select oa.id,oa.staff_info_id,oa.department_id,oa.attendance_status,os.name attendance_statusName,oa.balance_status, date_format(oa.attendance_time,'%Y-%m-%d') attendance_time,oa.remarks,oa.create_time,oa.create_user,oa.update_time,oa.update_user,oa.is_delete,od.model_id,od.order_num from oa_attendance_info oa,oa_times_detail od,oa_sys_dict os where os.code=oa.attendance_status and os.ext_type='1' and oa.is_delete = '0' and od.id=oa.times_detail_id ");
		List<Object> list = new ArrayList<Object>();
		if (StringUtils.isNotEmpty(staffid)) {
			sql.append(" and oa.staff_info_id = ? ");
			list.add(staffid);
		}
		if (StringUtils.isNotEmpty(deptid)) {
			sql.append(" and oa.department_id = ? ");
			list.add(deptid);
		}
		if (StringUtils.isNotEmpty(year)) {
			sql.append(" and date_format(oa.attendance_time,'%Y-%m') = ? ");
			list.add(year + "-" + (new Integer(moh) < 10 ? "0" : "") + moh);
		}

		sql.append(" order by od.order_num asc ");

		if (StringUtils.isEmpty(staffid) || StringUtils.isEmpty(deptid) || StringUtils.isEmpty(year) || StringUtils.isEmpty(moh)) {
			return new ArrayList();
		}
		return this.basalDao.queryList(sql.toString(), list.toArray());
	}

	public List<Map<String, Object>> findTimesModels() {
		String sql = "select * from oa_times_model oa where oa.is_delete='0' and oa.is_use='1' order by oa.type asc";
		return this.basalDao.queryList(sql.toString(), new Object[] {});
	}

	public Map<String, Object> getZt(String id) {
		String sql = " select oa.id,oa.staff_info_id,oa.department_id, " + " oa.attendance_status,oa.balance_status,date_format(oa.attendance_time,'%Y-%m-%d') attendance_time, "
				+ " oa.times_detail_id,oa.remarks,od.model_id,od.name model_name,od.order_num " + ",oa.onduty_type from oa_attendance_info oa, oa_times_detail od "
				+ "  where od.id = oa.times_detail_id and oa.id =? ";
		return this.basalDao.queryMap(sql, new Object[] { id });
	}

	@SuppressWarnings("unchecked")
	public boolean saveZb(String name01, String userName01, String name02, String userName02, String riqi, String dutyType, String remarks, Map<String, Object> curUser) {
		// 获取对应名称的staff_id，和真实的用户名
		if (StringUtils.isNotEmpty(riqi)) {
			if ("1".equals(dutyType)) {
				String sql1 = "select s.id staff_id,s.name staff_name,s.department_id from staff_info s,user_info u where u.name=? and u.staff_id=s.id ";
				Map<String, Object> map01 = this.basalDao.queryMap(sql1, new Object[] { name01 });
				if (map01 != null) {
					Object staff_id = map01.get("staff_id");
					if (staff_id != null) {
						Object department_id = map01.get("department_id");
						// 校验日期和对应名称是否已经存在，一个日期内只能有一个领导值班
						String sql2 = "select oa.id,oa.department_id,oa.staff_info_id from oa_onduty_info oa where oa.is_delete='0' and oa.on_duty_type=? and date_format(oa.on_duty_time,'%Y-%m-%d') =?";
						// 查询出原有的值班人员
						List<Map<String, Object>> list = this.basalDao.queryList(sql2, new Object[] { dutyType, riqi });
						if (list == null || list.isEmpty()) {// 新增
							int count = this.getCountByRiqiStaffid(riqi, "" + staff_id);
							if (count == 0) {// 如果数据已经存在将不能保存，需要多值班管理维护界面手动修改
								saveZb_((Integer) staff_id, (Integer) department_id, riqi, remarks, dutyType, "3", curUser);
							} else {
								System.out.println("值班人员已经存在，staff_id = " + staff_id);
							}
						} else {// 修改
							// 判断设置的领导是否为同一个人，如果是同一个人，将不做修改操作，如果不是同一个人，需要将上一个人的删除掉，新增新的领导值班人员
							boolean tong = false;// 默认无法找到相同内容
							for (Map<String, Object> map : list) {
								Integer staff_info_id = (Integer) map.get("staff_info_id");
								if (new Integer(staff_info_id).intValue() != new Integer((Integer) staff_id).intValue()) {
									deleteZb_(staff_info_id, riqi, dutyType, curUser);
								} else {// 找到相同的领导
									tong = true;
								}
							}
							if (!tong) {// 没有找到相同内容，则需要将该领导设置到值班数据中
								int count = this.getCountByRiqiStaffid(riqi, "" + staff_id);
								if (count == 0) {// 如果数据已经存在将不能保存，需要多值班管理维护界面手动修改
									saveZb_((Integer) staff_id, (Integer) department_id, riqi, remarks, dutyType, "3", curUser);
								} else {
									System.out.println("值班人员已经存在，staff_id = " + staff_id);
								}
							}
						}
					}
				} else {
					System.out.println("设置值班领导人员不存在， " + name01 + " : " + userName01);
				}
			} else {
				String sql1 = "select s.id staff_id,s.name staff_name,s.department_id from staff_info s,user_info u where u.name=? and u.staff_id=s.id ";
				Map<String, Object> map01 = this.basalDao.queryMap(sql1, new Object[] { name01 });
				Map<String, Object> map02 = this.basalDao.queryMap(sql1, new Object[] { name02 });
				Object staff_id01 = null;
				Object staff_id02 = null;
				Object department_id01 = null;
				Object department_id02 = null;
				if (map01 != null) {
					staff_id01 = map01.get("staff_id");
					department_id01 = map01.get("department_id");
				}
				if (map02 != null) {
					staff_id02 = map02.get("staff_id");
					department_id02 = map02.get("department_id");
				}
				String sql2 = "select oa.id,oa.department_id,oa.staff_info_id from oa_onduty_info oa where oa.is_delete='0' and oa.on_duty_type=? and date_format(oa.on_duty_time,'%Y-%m-%d') =?";
				List<Map<String, Object>> list = this.basalDao.queryList(sql2, new Object[] { dutyType, riqi });
				if (list == null || list.isEmpty()) {
					if (staff_id01 != null) {
						int count = this.getCountByRiqiStaffid(riqi, "" + staff_id01);
						if (count == 0) {// 如果数据已经存在将不能保存，需要多值班管理维护界面手动修改
							saveZb_((Integer) staff_id01, (Integer) department_id01, riqi, remarks, dutyType, "3", curUser);
						} else {
							System.out.println("值班人员已经存在，staff_id = " + staff_id01);
						}
					}
					if (staff_id02 != null) {
						int count = this.getCountByRiqiStaffid(riqi, "" + staff_id02);
						if (count == 0) {// 如果数据已经存在将不能保存，需要多值班管理维护界面手动修改
							saveZb_((Integer) staff_id02, (Integer) department_id02, riqi, remarks, dutyType, "3", curUser);
						} else {
							System.out.println("值班人员已经存在，staff_id = " + staff_id02);
						}
					}
				} else {// 对比存在内容
					boolean tong1 = false;
					boolean tong2 = false;
					for (Map<String, Object> map : list) {
						Integer staff_info_id = (Integer) map.get("staff_info_id");
						boolean tong1_ = false;
						boolean tong2_ = false;
						if (staff_id01 != null && new Integer(staff_info_id).intValue() == new Integer((Integer) staff_id01).intValue()) {
							tong1 = true;
							tong1_ = true;
						}
						if (staff_id02 != null && new Integer(staff_info_id).intValue() == new Integer((Integer) staff_id02).intValue()) {
							tong2 = true;
							tong2_ = true;
						}
						if (!tong1_ && !tong2_) {
							deleteZb_(staff_info_id, riqi, dutyType, curUser);
						}
					}
					if (!tong1 && staff_id01 != null) {
						int count = this.getCountByRiqiStaffid(riqi, "" + staff_id01);
						if (count == 0) {// 如果数据已经存在将不能保存，需要多值班管理维护界面手动修改
							saveZb_((Integer) staff_id01, (Integer) department_id01, riqi, remarks, dutyType, "3", curUser);
						} else {
							System.out.println("值班人员已经存在，staff_id = " + staff_id01);
						}
					}
					if (!tong2 && staff_id02 != null) {
						int count = this.getCountByRiqiStaffid(riqi, "" + staff_id02);
						if (count == 0) {// 如果数据已经存在将不能保存，需要多值班管理维护界面手动修改
							saveZb_((Integer) staff_id02, (Integer) department_id02, riqi, remarks, dutyType, "3", curUser);
						} else {
							System.out.println("值班人员已经存在，staff_id = " + staff_id02);
						}
					}
				}
			}
		}
		return true;
	}

	/**
	 * 删除值班信息
	 */
	public void deleteZb_(Integer staff_id, String riqi, String dutyType, Map<String, Object> curUser) {
		String sql = "update oa_onduty_info oa set oa.is_delete='1',oa.update_time=now(),oa.update_user='" + curUser.get("name")
				+ "' where oa.staff_info_id=? and date_format(oa.on_duty_time,'%Y-%m-%d') =? and oa.on_duty_type=?";
		this.basalDao.runUSql(sql, new Object[] { staff_id, riqi, dutyType });
		// 删除状态表中相关亮的值班信息
		String sql2 = "update oa_attendance_info oa set oa.is_delete='1',oa.update_time=now(),oa.update_user=? where oa.staff_info_id=? and date_format(oa.attendance_time,'%Y-%m-%d') =? and oa.attendance_status='5'";
		this.basalDao.runUSql(sql2, new Object[] { curUser.get("name"), staff_id, riqi });
	}

	public void updZb_(String id, String deptid, String staffId, String riqi, String dalance_status, String remarks, Map<String, Object> curUser) {
		String sql = "update oa_onduty_info oa set oa.dalance_status=?,oa.update_time=now(),oa.update_user=?,oa.remarks=? where oa.id=?";
		this.basalDao.runUSql(sql, new Object[] { dalance_status, curUser.get("name"), remarks, id });
		String sql2 = "update oa_attendance_info oa set oa.balance_status=?,oa.remarks=?,oa.update_time=now(),oa.update_user=? where oa.staff_info_id=? and date_format(oa.attendance_time,'%Y-%m-%d') =? and oa.attendance_status='5'";
		this.basalDao.runUSql(sql2, new Object[] { dalance_status, remarks, curUser.get("name"), staffId, riqi });
	}

	public void saveZb_(Integer staff_id, Integer department_id, String riqi, String remarks, String dutyType, String dalance_status, Map<String, Object> curUser) {
		String sql3 = "insert into oa_onduty_info(staff_info_id,department_id,on_duty_time,dalance_status,remarks,on_duty_type,create_time,create_user,update_time,update_user,is_delete)";
		sql3 += " values(?,?,str_to_date(?,'%Y-%m-%d'),?,?,?,now(),?,now(),?,'0')";
		this.basalDao.runUSql(sql3, new Object[] { staff_id, department_id, riqi, dalance_status, remarks, dutyType, curUser.get("name"), curUser.get("name") });

		// 保存值班状态时,只有对总值班人员操作时才对考勤表做出相应的操作
		if ("3".equals(dutyType)) {
			String sql2 = "update oa_attendance_info oa set oa.is_delete='1',oa.update_time=now(),oa.update_user=? where oa.staff_info_id=? and date_format(oa.attendance_time,'%Y-%m-%d') =?";
			this.basalDao.runUSql(sql2, new Object[] { curUser.get("name"), staff_id, riqi });

			List<Map<String, Object>> timesModelList = findTimesModels();// 时间模型
			for (Map<String, Object> map : timesModelList) {// 5:表示值班内容
				saveZt("5", riqi, map.get("id") + "-" + map.get("type"), (String) map.get("model_name"), remarks, "" + staff_id, "" + department_id, dalance_status, dutyType, curUser);
			}
		}
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> findZbrl(String year, String moh) {
		String sql = "select oa.id,oa.staff_info_id,s.name staff_name,oa.department_id,d.name department_name,date_format(oa.on_duty_time,'%Y-%m-%d') on_duty_time,oa.on_duty_type from oa_onduty_info oa,staff_info s,department_info d where d.id=oa.department_id and s.id=oa.staff_info_id and oa.is_delete='0' and date_format(oa.on_duty_time,'%Y-%m')=?";
		return this.basalDao.queryList(sql, new Object[] { year + "-" + (new Integer(moh) < 10 ? "0" : "") + moh });
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> getZbrl(String id) {
		String sql = "select oa.id,oa.staff_info_id,oa.department_id,oa.dalance_status,date_format(oa.on_duty_time,'%Y-%m-%d') on_duty_time,oa.remarks,oa.on_duty_type from oa_onduty_info oa where oa.id=?";
		return this.basalDao.queryMap(sql, new Object[] { id });
	}

	/**
	 * 根据日期和人员id，查询是否已经存在
	 */
	public int getCountByRiqiStaffid(String riqi, String staffid) {
		String sql = "select count(*) count from oa_onduty_info oa where oa.is_delete='0' and oa.staff_info_id=? and date_format(oa.on_duty_time,'%Y-%m-%d')=?";
		return this.basalDao.queryInt(sql, new Object[] { staffid, riqi });
	}

	/**
	 * 查询双休日日期集合
	 * 
	 * 调整：双休日和三薪日都查询
	 * 
	 * @param year
	 *            年
	 * @param moh
	 *            月
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getWeekEndsByYearMoh(String year, String moh) {
		String sql = "select date_format(oa.day_time,'%Y-%m-%d') day_time from oa_day_settings oa where date_format(oa.day_time,'%Y')=? and date_format(oa.day_time,'%m')=? and oa.is_delete='0' and oa.status in('1','3')";
		return this.basalDao.queryList(sql, new Object[] { year, moh });
	}

	/**
	 * 查询时间范围内的双休日和三薪日
	 * 
	 * @param startTime
	 *            yyyy-MM-dd
	 * @param endTime
	 *            yyyy-MM-dd
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getWeekEnds(String startTime, String endTime) {
		String sql = "select date_format(oa.day_time,'%Y-%m-%d') day_time from oa_day_settings oa where oa.day_time >= str_to_date(?,'%Y-%m-%d') and oa.day_time <= str_to_date(?,'%Y-%m-%d') and oa.is_delete='0' and oa.status in ('1','3')";
		return this.basalDao.queryList(sql, new Object[] { startTime, endTime });
	}

	/**
	 * 根据时间查询是否为周末 修改： 双休和三薪日同时作为节假，凡是节假不予设置在岗
	 */
	public Boolean isWeekEndByTime(String dayTime) {
		String sql = "select count(*) count from oa_day_settings o where o.day_time=str_to_date(?,'%Y-%m-%d') and o.is_delete='0' and o.status in ('1','3') ";
		return this.basalDao.queryInt(sql, new Object[] { dayTime }) > 0;
	}

	/**
	 * 值班小组列表 type=1：领导值班 type=2：小分队听班 type=3：总值班
	 */
	public List<Map<String, Object>> zbTeamBizList(String type) {
		StringBuffer sql = new StringBuffer();
		sql.append(" select oa.id,oa.onduty_staff1,s1.name staff_name1,s1.department_id dept1,oa.onduty_staff2,  ");
		sql.append(" s2.name staff_name2,s2.department_id dept2,oa.onduty_staff_type,oa.is_delete,oa.onduty_order  ");
		sql.append(" from	oa_onduty_team oa ");
		sql.append(" left join staff_info s1 on s1.id=oa.onduty_staff1  ");
		sql.append(" left join staff_info s2 on s2.id=oa.onduty_staff2  ");
		sql.append(" where oa.is_delete = '0' and oa.onduty_staff_type = ? order by onduty_order asc,id asc  ");
		return this.basalDao.queryList(sql.toString(), new Object[] { type });
	}

	/**
	 * 新增或修改值班小组内容
	 */
	public void saveZbTeamUpdOrAdd(String id, String onduty_staff1, String onduty_staff2, String onduty_staff_type, String onduty_order, Map<String, Object> curUser) {
		if (StringUtils.isEmpty(id)) {// 新增
			String sql = "insert into oa_onduty_team(onduty_staff1,onduty_staff2,onduty_staff_type,onduty_order,is_delete,create_user,update_user)values(?,?,?,?,?,?,?)";
			this.basalDao.insertAndGetKey(sql, onduty_staff1, onduty_staff2, onduty_staff_type, onduty_order, 0, curUser.get("name"), curUser.get("name"));
		} else {// 修改
			String sql = "update oa_onduty_team set onduty_staff1=?,onduty_staff2=?,onduty_staff_type=?,onduty_order=?,update_user=?,update_time=now() where id=?";
			this.basalDao.runUSql(sql, new Object[] { onduty_staff1, onduty_staff2, onduty_staff_type, onduty_order, curUser.get("name"), id });
		}
	}

	public void zbTeamDelete(String id, String is_Delete, Map<String, Object> curUser) {
		if (StringUtils.isNotEmpty(id)) {
			if (StringUtils.isNotEmpty(is_Delete)) {// 删除值的修改
				String sql = "update oa_onduty_team set is_delete=?,update_user=?,update_time=? where id=?";
				this.basalDao.runUSql(sql, new Object[] { is_Delete, curUser.get("name"), new Date(), id });
			}
		}
	}

	/**
	 * 批量修改顺序编号
	 * 
	 * @param paramList
	 */
	public void batchUpdZbonDutyOrder(List<Object[]> paramList) {
		String sql = "update oa_onduty_team set onduty_order=?,update_time=now(),update_user=? where id=?";
		this.basalDao.runUSqls(sql, paramList);
	}

	public void zbTeamRuleEnableAndDelete(String id, String is_Enable, String is_Delete, String rule_type, Map<String, Object> curUser) {
		if (StringUtils.isNotEmpty(id)) {
			if (StringUtils.isNotEmpty(is_Enable)) {// 禁用与启用
				if ("1".equals(is_Enable)) {
					String sql1 = "update oa_onduty_rule set is_Enable=?,update_user=?,update_time=?  where is_Enable='1' and rule_type=? ";// 禁用原有的规则
					this.basalDao.runUSql(sql1, new Object[] { "0", curUser.get("name"), new Date(), rule_type });
				}
				String sql2 = "update oa_onduty_rule set is_Enable=?,update_user=?,update_time=? where id=?";
				this.basalDao.runUSql(sql2, new Object[] { is_Enable, curUser.get("name"), new Date(), id });
			}
			if (StringUtils.isNotEmpty(is_Delete)) {// 删除值的修改
				String sql = "update oa_onduty_rule set is_Delete=?,update_user=?,update_time=? where id=?";
				this.basalDao.runUSql(sql, new Object[] { is_Delete, curUser.get("name"), new Date(), id });
			}
		}
	}

	public Page zbTeamBizRuleList(int pageindex, int pagesize, String is_Enable, String rule_type) {
		List<Object> paramList = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append(" select ");
		sql.append(" oa.id, ");
		sql.append(" date_format(oa.start_time,'%Y-%m-%d') start_time, ");
		sql.append(" date_format(oa.end_time,'%Y-%m-%d') end_time, ");
		sql.append(" oa.rule_type,");
		sql.append(" oa.start_teamid, ");
		sql.append(" s1.name staff_name1,");
		sql.append(" s2.name staff_name2,");
		sql.append(" oa.is_enable, ");
		sql.append(" oa.is_delete, ");
		sql.append(" oa.create_user, ");
		sql.append(" date_format(oa.create_time,'%Y-%m-%d %H:%i') create_time, ");
		sql.append(" oa.update_user, ");
		sql.append(" oa.update_time ");
		sql.append(" from ");
		sql.append(" oa_onduty_rule oa ");
		sql.append(" left outer join oa_onduty_team t1 on t1.id = oa.start_teamid ");
		sql.append(" left outer join staff_info s1 on s1.id=t1.onduty_staff1 ");
		sql.append(" left outer join staff_info s2 on s2.id=t1.onduty_staff2 ");
		sql.append(" where ");
		sql.append(" oa.is_delete = '0' ");// 非删除状态
		if (StringUtils.isNotEmpty(is_Enable) && !is_Enable.equals("-1")) {
			sql.append(" and oa.is_enable =?");
			paramList.add(is_Enable);
		}
		if (StringUtils.isNotEmpty(rule_type) && !rule_type.equals("-1")) {
			sql.append(" and oa.rule_type =?");
			paramList.add(rule_type);
		}
		sql.append(" order by  oa.is_enable desc,oa.rule_type asc,oa.start_time desc,oa.end_time desc");
		return this.basalDao.pagedQuery_mysql_sql(sql.toString(), pageindex, pagesize, paramList.toArray());
	}

	/**
	 * 新增或修改值班小组内容
	 */
	@SuppressWarnings("unchecked")
	public void saveZbTeamRuleAdd(String start_time, String end_time, String is_Enable, String rule_type, String orderno_teamid, Map<String, Object> curUser) throws Exception {
		if ("1".equals(is_Enable)) {
			// 禁用原有的规则
			String sql1 = "update oa_onduty_rule set is_Enable=?,update_user=?,update_time=?  where is_Enable='1' and rule_type=?";
			this.basalDao.runUSql(sql1, new Object[] { "0", curUser.get("name"), new Date(), rule_type });
		}
		// 持久化值班人员数据
		Date start_timeDate = DateUtils.parseDate(start_time, new String[] { "yyyy-MM-dd" });
		Date end_timeDate = DateUtils.parseDate(end_time, new String[] { "yyyy-MM-dd" });
		Calendar cal = Calendar.getInstance();
		cal.setTime(start_timeDate);
		StringBuffer sql2 = new StringBuffer();
		sql2.append(" select oa.id,oa.onduty_staff1,s1.department_id dept1,oa.onduty_staff2,s2.department_id dept2,oa.onduty_staff_type,oa.onduty_order ");
		sql2.append(" from oa_onduty_team oa ");
		sql2.append(" left outer join staff_info s1 on s1.id = oa.onduty_staff1 ");
		sql2.append(" left outer join staff_info s2 on s2.id = oa.onduty_staff2 ");
		sql2.append(" where oa.onduty_staff_type = ? and oa.is_delete = '0' order by	oa.onduty_order asc,oa.id asc ");
		List<Map<String, Object>> teamList = this.basalDao.queryList(sql2.toString(), new Object[] { rule_type });
		String[] ordernoTeamids = orderno_teamid.split("-");
		String orderno_ = ordernoTeamids[0];
		String teamid_ = ordernoTeamids[1];
		int last_team_orderno = 0;
		if (teamList != null && !teamList.isEmpty()) {
			int i = 0;
			int n = teamList.size();
			for (Map<String, Object> map : teamList) {
				if (new Integer(orderno_).byteValue() == new Integer((Integer) map.get("onduty_order")).byteValue()) {
					break;
				}
				i++;
			}
			if (i > (n - 1)) {
				i = 0;
			}
			// 删除该日期下的值班状态数据
			String sql4 = "update oa_attendance_info oa set oa.is_delete='1',oa.update_time=now() where oa.attendance_status='5' and date_format(oa.attendance_time,'%Y-%m-%d') >=? and  date_format(oa.attendance_time,'%Y-%m-%d') <=? and onduty_type=? and oa.is_delete='0' ";
			this.basalDao.runUSql(sql4, new Object[] { start_time, end_time, rule_type });
			String sql5 = "update oa_onduty_info oa set oa.is_delete='1',oa.update_time=NOW() where date_format(oa.on_duty_time,'%Y-%m-%d') >=? and  date_format(oa.on_duty_time,'%Y-%m-%d') <=? and oa.on_duty_type=? and oa.is_delete='0' ";
			this.basalDao.runUSql(sql5, new Object[] { start_time, end_time, rule_type });
			while (cal.getTime().before(end_timeDate) || cal.getTime().equals(end_timeDate)) {
				Map<String, Object> teamMap = teamList.get(i);
				last_team_orderno = (Integer) teamMap.get("onduty_order");
				saveZb("" + teamMap.get("onduty_staff1"), "" + teamMap.get("dept1"), new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime()), "" + teamMap.get("onduty_staff_type"), "3");
				if (!"1".equals(("" + teamMap.get("onduty_staff_type")))) {
					saveZb("" + teamMap.get("onduty_staff2"), "" + teamMap.get("dept2"), new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime()), "" + teamMap.get("onduty_staff_type"), "3");
				}

				if ((i++) >= (n - 1))
					i = 0;
				cal.add(Calendar.DAY_OF_MONTH, 1);
			}
		}
		// 保存新规则
		String sql3 = "insert into oa_onduty_rule(start_time,end_time,is_Enable,rule_type,create_user,update_user,last_team_orderno,start_team_orderno,start_teamid)values(str_to_date(?,'%Y-%m-%d'),str_to_date(?,'%Y-%m-%d'),?,?,?,?,?,?,?)";
		Long rule_id = this.basalDao.insertAndGetKey(sql3, start_time, end_time, is_Enable, rule_type, curUser.get("name"), curUser.get("name"), last_team_orderno, orderno_, teamid_);
	}

	/**
	 * @param staff_id
	 *            值班人员
	 * @param department_id
	 *            部门
	 * @param riqi
	 *            日期
	 * @param dutyType
	 *            领导值班 小分队听班 总值班
	 * @param jiesuanOptions
	 *            结算方式
	 */
	public void saveZb(String staff_id, String department_id, String riqi, String dutyType, String jiesuanOptions) {
		Map<String, Object> curUser = new HashMap<String, Object>();
		// 需要验证一下是否更改的值班人员，如果更改了值班人员，需要将之前的值班人员的日志状态切换掉
		// if (getCountByRiqiStaffid(riqi, staff_id) > 0) {
		// System.out.println("设置的人员已经存在。");
		// return;
		// }
		// 验证在该日期和类型下是否已经值班人员已经饱和

		saveZb_(Integer.valueOf(staff_id), Integer.valueOf(department_id), riqi, "", dutyType, jiesuanOptions, curUser);
	}

	@SuppressWarnings("unchecked")
	@Deprecated
	public List<Map<String, Object>> zbTeamPreview(String year, String moh) {
		StringBuffer sql = new StringBuffer();
		String yearMoh = year + "-" + (new Integer(moh) < 10 ? "0" : "") + moh;
		sql.append(" select t.id,t.ondutystaffId1,s1.name staff_name1,t.ondutystaffId2,s2.name staff_name2,t.onduty_type,t.on_duty_time ");
		sql.append(" from (select ");
		sql.append(" p.id, ");
		sql.append(" p.ondutystaffId1, ");
		sql.append(" p.ondutystaffId2, ");
		sql.append(" p.onduty_type, ");
		sql.append(" date_format(p.on_duty_time, '%Y-%m-%d') on_duty_time ");
		sql.append(" from ");
		sql.append(" oa_onduty_rulepersistence p ");
		sql.append(" where ");
		sql.append(" p.is_handle = '1' ");
		sql.append(" and date_format(on_duty_time, '%Y-%m') = ? ");
		sql.append(" union all ");
		sql.append(" select ");
		sql.append(" p.id, ");
		sql.append(" p.ondutystaffId1, ");
		sql.append(" p.ondutystaffId2, ");
		sql.append(" p.onduty_type, ");
		sql.append(" date_format(p.on_duty_time, '%Y-%m-%d') on_duty_time ");
		sql.append(" from ");
		sql.append(" oa_onduty_rulepersistence p, ");
		sql.append(" oa_onduty_rule oa ");
		sql.append(" where ");
		sql.append(" p.onduty_rule_id = oa.id ");
		sql.append(" and p.is_handle = '0' ");
		sql.append(" and oa.is_delete = '0' ");
		sql.append(" and oa.is_enable = '1' ");
		sql.append(" and date_format(on_duty_time, '%Y-%m') = ? ");
		sql.append(" ) t ");
		sql.append(" left outer join staff_info s1 on s1.id=t.ondutystaffId1 ");
		sql.append(" left outer join staff_info s2 on s2.id=t.ondutystaffId2 ");
		sql.append(" order by on_duty_time asc,onduty_type asc ");
		return this.basalDao.queryList(sql.toString(), new Object[] { yearMoh, yearMoh });
	}

	public void zbRiliPreviewUpd(String id, String field, String onduty_type, String staffId, Map<String, Object> curUser) {
		StringBuffer sql = new StringBuffer();
		sql.append("update oa_onduty_rulepersistence p set ");
		sql.append(" p.ondutystaffId" + field + "=? ");
		sql.append(" ,p.update_time=now() ");
		sql.append(" ,p.update_user=? ");
		sql.append(" where p.id=? ");
		this.basalDao.runUSql(sql.toString(), new Object[] { staffId, curUser.get("name"), id });
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}
}
