package com.disease_control.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.quartz.InitStaffStatusJob;
import com.disease_control.web.form.CarUseApply;
import com.yakov.utils.DateUtil;

public class CarUseApplyService {
	private static Logger logger = Logger.getLogger(CarUseApplyService.class.getName());

	public Page list(int pageIndex, int pageSize, int applyType, int applyDepartmentId, int staffId, int carId, Date startTime, Date endTime, int status, int is_read) {
		StringBuffer sql = new StringBuffer(
				"select cua.*,ci.brand_name,ci.brand_model,ci.id_num,si.name as staff_name,di.name as department_name from car_use_apply as cua inner join car_info as ci on ci.id=cua.car_id inner join staff_info as si on si.id=cua.apply_staff_id inner join department_info as di on si.department_id=di.id where 1=1");
		ArrayList paramList = new ArrayList();
		if (applyType != -100) {
			sql.append(" and cua.apply_type=?");
			paramList.add(applyType);
		}
		if (applyDepartmentId != -100) {
			sql.append(" and (cua.apply_department_id in (select id from department_info where id=? or base_id=?) or cua.apply_department_id in (select base_id from department_info where id=?) )");
			paramList.add(applyDepartmentId);
			paramList.add(applyDepartmentId);
			paramList.add(applyDepartmentId);
		}
		if (staffId != -100) {
			sql.append(" and cua.apply_staff_id=?");
			paramList.add(staffId);
		}
		if (carId != -100) {
			sql.append(" and cua.car_id=?");
			paramList.add(carId);
		}
		if (startTime != null) {
			sql.append(" and cua.start_time>=");
			paramList.add(startTime);
		}
		if (endTime != null) {
			sql.append(" and cua.start_time<=");
			paramList.add(endTime);
		}
		if (status != -100) {
			sql.append(" and cua.`status`=?");
			paramList.add(status);
		}
		if (is_read != -100) {
			sql.append(" and cua.is_read=?");
			paramList.add(is_read);
		}
		sql.append(" order by id desc");
		logger.info(sql.toString());
		logger.info(Arrays.toString(paramList.toArray()));
		return basalDao.pagedQuery_mysql_sql(sql.toString(), pageIndex, pageSize, paramList.toArray());
	}

	public synchronized int add_Tx(CarUseApply carUseApply) {
		if (carUseApply.getApplyType() == 0) {
			String sql = "select count(*) from car_use_apply as cua inner join staff_info as si on si.id=apply_staff_id inner join department_info as di on di.id=si.department_id where cua.car_id=? and cua.status!=-1 and ((cua.start_time>? and cua.start_time<?) or (cua.end_time<? and cua.end_time>?) or (cua.start_time<=? and cua.end_time>=?)) order by cua.apply_type";
			int carUseApplyNum = basalDao.queryInt(sql,
					new Object[] { carUseApply.getCarId(), carUseApply.getStartTime(), carUseApply.getEndTime(), carUseApply.getEndTime(), carUseApply.getStartTime(), carUseApply.getStartTime(),
							carUseApply.getEndTime() });
			if (carUseApplyNum != 0) {
				return -1;
			}
		}
		String sql = "insert into car_use_apply(apply_department_id,apply_staff_id,title,car_id,seats_num,destination,freight,start_time,end_time,apply_type,remark,create_time,status) values(?,?,?,?,?,?,?,?,?,?,?,now(),?)";
		return basalDao.runUSql(
				sql,
				new Object[] { carUseApply.getApplyDepartmentId(), carUseApply.getApplyStaffId(), carUseApply.getTitle(), carUseApply.getCarId(), carUseApply.getSeatsNum(),
						carUseApply.getDestination(), carUseApply.getFreight(), carUseApply.getStartTime(), carUseApply.getEndTime(), carUseApply.getApplyType(), carUseApply.getRemark(),
						carUseApply.getStatus() });
	}

	public int update_Tx(CarUseApply carUseApply) {
		String sql = "update car_use_apply set apply_staff_id=?,title=?,car_id=?,seats_num=?,destination=?,freight=?,start_time=?,end_time=?,apply_type=?,remark=?,create_time=now(),status=? where id=?";
		return basalDao.runUSql(sql,
				new Object[] { carUseApply.getApplyStaffId(), carUseApply.getTitle(), carUseApply.getCarId(), carUseApply.getSeatsNum(), carUseApply.getDestination(), carUseApply.getFreight(),
						carUseApply.getStartTime(), carUseApply.getEndTime(), carUseApply.getApplyType(), carUseApply.getRemark(), carUseApply.getStatus(), carUseApply.getId() });
	}

	public int audit_Tx(CarUseApply carUseApply) {
		if (carUseApply.getStatus() == -1) {
			Map carUseApplyMap = basalDao.queryMap("select * from car_use_apply where id=?", new Object[] { carUseApply.getId() });
			String insertMsgSql = "insert into msg_info(msg_type,msg_title,msg_content,msg_status,msg_sender,msg_addressee,msg_time) value(?,?,?,?,?,?,now())";
			String msgContent = "您有一条用车申请被驳回。目的地：" + carUseApplyMap.get("destination") + "，出车时间：" + carUseApplyMap.get("start_time") + "，回车时间：" + carUseApplyMap.get("end_time") + "。";
			basalDao.runUSql(insertMsgSql, new Object[] { 0, "用车申请驳回", msgContent, 0, 0, carUseApplyMap.get("apply_staff_id") });
		} else {
			Map carUseApplyMap = basalDao.queryMap("select * from car_use_apply where id=?", new Object[] { carUseApply.getId() });
			String insertMsgSql = "insert into msg_info(msg_type,msg_title,msg_content,msg_status,msg_sender,msg_addressee,msg_time) value(?,?,?,?,?,?,now())";
			String msgContent = "您有一条用车申请被通过。目的地：" + carUseApplyMap.get("destination") + "，出车时间：" + carUseApplyMap.get("start_time") + "，回车时间：" + carUseApplyMap.get("end_time") + "。";
			basalDao.runUSql(insertMsgSql, new Object[] { 0, "用车申请通过", msgContent, 0, 0, carUseApplyMap.get("apply_staff_id") });
		}
		String sql = "update car_use_apply set status=?,audit_staff_id=?,is_read=?,audit_time=now() where id=?";
		return basalDao.runUSql(sql, new Object[] { carUseApply.getStatus(), carUseApply.getApplyStaffId(), "0", carUseApply.getId() });// 修改为未读
	}

	public Map get(int id, Map currentUser) {
		String sql = "select cua.*,ci.brand_name,ci.brand_model,ci.id_num,si.name as staff_name,di.name as department_name from car_use_apply as cua inner join car_info as ci on ci.id=cua.car_id inner join staff_info as si on si.id=cua.apply_staff_id inner join department_info as di on si.department_id=di.id where cua.id=?";
		Map car = basalDao.queryMap(sql, new Object[] { id });
		if (Integer.valueOf(0) == Integer.valueOf((Integer) car.get("is_read"))) {// 未读状态
			Integer staffId = (Integer) currentUser.get("staffId");// 当前用户
			if (-1 == (Integer) car.get("status") || 1 == (Integer) car.get("status")) {// 申请人读取
				if (staffId == (Integer) car.get("apply_staff_id")) {
					String sql2 = "update car_use_apply as cua set cua.is_read=1 where id=? ";// 设置未审批或驳回内容已读
					basalDao.runUSql(sql2, new Object[] { id });
				}
			}
		}
		return car;
	}

	public int getUseSeatsNum(int carId, Date startTime, Date endTime) {
		String sql = "select sum(cua.seats_num) from car_use_apply as cua where cua.car_id=? and cua.status!=-1 and ((cua.start_time>? and cua.start_time<?) or (cua.end_time<? and cua.end_time>?) or (cua.start_time<=? and cua.end_time>=?))";
		return basalDao.queryInt(sql, new Object[] { carId, startTime, endTime, endTime, startTime, startTime, endTime });
	}

	public List calendar(List<String> dateList, List<Map> dataCarUseTimeList, List<Map> carInfoList) {
		List resultList = new ArrayList();
		for (int i = 0; i < carInfoList.size(); i++) {
			Map carInfoMap = carInfoList.get(i);
			for (int j = 0; j < dataCarUseTimeList.size(); j++) {
				Map resultMap = new HashMap();
				Map dataCarUseTimeMap = dataCarUseTimeList.get(j);
				if (j == 0) {
					resultMap.put("car_name", carInfoMap.get("brand_name"));
				}
				resultMap.put("car_id", carInfoMap.get("id"));
				resultMap.put("seats_num", carInfoMap.get("seats_num"));
				resultMap.put("use_time", dataCarUseTimeMap.get("start_time") + "~" + dataCarUseTimeMap.get("end_time"));
				if (j < 2) {
					resultMap.put("use_time_title", dataCarUseTimeMap.get("start_time") + "~" + dataCarUseTimeMap.get("end_time") + "<br/>（上午）");
				} else {
					resultMap.put("use_time_title", dataCarUseTimeMap.get("start_time") + "~" + dataCarUseTimeMap.get("end_time") + "<br/>（下午）");
				}
				resultMap.put("use_start_time", dataCarUseTimeMap.get("start_time"));
				resultMap.put("use_end_time", dataCarUseTimeMap.get("end_time"));
				for (int k = 0; k < dateList.size(); k++) {
					String date = dateList.get(k);
					String startTime = date + " " + dataCarUseTimeMap.get("start_time") + ":00";
					String endTime = date + " " + dataCarUseTimeMap.get("end_time") + ":00";
					String sql = "select cua.*,si.name as staff_name,di.name as department_name from car_use_apply as cua inner join staff_info as si on si.id=apply_staff_id inner join department_info as di on di.id=si.department_id where cua.car_id=? and cua.status!=-1 and ((cua.start_time>? and cua.start_time<?) or (cua.end_time<? and cua.end_time>?) or (cua.start_time<=? and cua.end_time>=?)) order by cua.apply_type";
					List carUseApplyList = basalDao.queryList(sql, new Object[] { carInfoMap.get("id"), startTime, endTime, endTime, startTime, startTime, endTime });
					resultMap.put(date, carUseApplyList);
				}
				resultList.add(resultMap);
			}
			resultList.add(new HashMap());
		}
		return resultList;
	}

	public void del(int id) {
		String sql = "delete from car_use_apply where id=?";
		basalDao.runUSql(sql, new Object[] { id });
	}

	public void clearApply() {
		String sql = "update car_use_apply set `status`=-1 where start_time<=now() and `status`=0";
		basalDao.runUSql(sql, null);
	}

	public void cancel(int id) {
		String sql = "update car_use_apply set `status`=-1 where id=?";
		basalDao.runUSql(sql, new Object[] { id });
		sql = "select * from car_use_apply where id=?";
		Map carUseApplyMap = basalDao.queryMap(sql, new Object[] { id });
		sql = "update car_use_apply set `status`=-1 where ((start_time<=? and end_time=?) or (start_time<? and end_time>=?)) and car_id=?";
		basalDao.runUSql(sql,
				new Object[] { carUseApplyMap.get("start_time"), carUseApplyMap.get("start_time"), carUseApplyMap.get("end_time"), carUseApplyMap.get("end_time"), carUseApplyMap.get("car_id") });

		sql = "select * from car_use_apply where ((start_time<=? and end_time=?) or (start_time<? and end_time>=?)) and car_id=? and `status`=-1";
		List<Map> carUseApplyList = basalDao.queryList(sql,
				new Object[] { carUseApplyMap.get("start_time"), carUseApplyMap.get("start_time"), carUseApplyMap.get("end_time"), carUseApplyMap.get("end_time"), carUseApplyMap.get("car_id") });
		for (Map _carUseApplyMap : carUseApplyList) {
			String insertMsgSql = "insert into msg_info(msg_type,msg_title,msg_content,msg_status,msg_sender,msg_addressee,msg_time) value(?,?,?,?,?,?,now())";
			String msgContent = "您有一条用车申请被取消。目的地：" + _carUseApplyMap.get("destination") + "，出车时间：" + _carUseApplyMap.get("start_time") + "，回车时间：" + _carUseApplyMap.get("end_time") + "。";
			basalDao.runUSql(insertMsgSql, new Object[] { 0, "用车申请取消", msgContent, 0, 0, _carUseApplyMap.get("apply_staff_id") });
		}
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
