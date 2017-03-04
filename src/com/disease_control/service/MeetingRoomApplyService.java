package com.disease_control.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.MeetingRoomApply;

/**
 * 会议室申请
 * 
 * @author
 * 
 */
public class MeetingRoomApplyService {
	/**
	 * 会议室申请列表
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public Page list(int pageIndex, int pageSize, int meetingRoomId, int applyStaffId, Date meetingStartTime, Date meetingEndTime, int status, int departmentId, int is_read) {
		String sql = "select mra.id,mra.apply_time,mra.meeting_theme as meetingTheme,mra.meeting_start_time,mra.meeting_end_time,mra.status,di.name as departmentName,si.id as applyStaffId,si.name as applyStaffName,mri.name as meetingRoomName from meeting_room_apply as mra inner join meeting_room_info mri on mra.meeting_room_id=mri.id inner join department_info as di on mra.department_id=di.id inner join staff_info as si on mra.apply_staff_id=si.id where 1=1";
		ArrayList paramList = new ArrayList();
		if (meetingRoomId != -100) {
			sql += " and mra.meeting_room_id=?";
			paramList.add(meetingRoomId);
		}
		if (departmentId != -100) {
			sql += " and (mra.department_id in (select id from department_info where id=? or base_id=?) or mra.department_id in (select base_id from department_info where id=?) )";
			paramList.add(departmentId);
			paramList.add(departmentId);
			paramList.add(departmentId);
		}
		if (applyStaffId != 0) {
			sql += " and mra.apply_staff_id=?";
			paramList.add(applyStaffId);
		}
		if (meetingStartTime != null) {
			sql += " and mra.meeting_start_time>=?";
			paramList.add(meetingStartTime);
		}
		if (meetingEndTime != null) {
			sql += " and mra.meeting_end_time<=?";
			paramList.add(meetingEndTime);
		}
		if (status != -100) {
			sql += " and mra.status=?";
			paramList.add(status);
		}
		if (is_read != -100) {
			sql += " and mra.is_read=?";
			paramList.add(is_read);
		}
		sql += " order by mra.id desc";
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		return basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, params);
	}

	/**
	 * 查出可用于申请的会议室
	 * 
	 * @param MeetStartTime
	 * @param MeetEndTime
	 * @return
	 */
	public List idleMeetRoom(Date MeetStartTime, Date MeetEndTime) {
		String sql = "select * from meeting_room_info where id not in (select meeting_room_id from meeting_room_apply where ((start_time<=? and end_time>=?) or (start_time<=? and end_time>=?)) and `status`<>-1) and active <>-1 group by id";
		return basalDao.queryList(sql, new Object[] { MeetStartTime, MeetStartTime, MeetEndTime, MeetEndTime });
	}

	/**
	 * 详情
	 * 
	 * @param id
	 * @return
	 */
	public Map get(int id, Map currentUser) {
		String sql = "select mra.*,di.name as departmentName,si.name as applyStaffName,mri.name as meetingRoomName from meeting_room_apply as mra inner join meeting_room_info mri on mra.meeting_room_id=mri.id inner join department_info as di on mra.department_id=di.id inner join staff_info as si on mra.apply_staff_id=si.id where mra.id=?";
		Map map = basalDao.queryMap(sql, new Object[] { id });
		List list = new ArrayList();
		if (map != null) {
			if (map.get("meeting_device_ids") != "null" && !"".equals(map.get("meeting_device_ids"))) {
				String[] deviceIds = map.get("meeting_device_ids").toString().split(",");
				for (int i = 0; i < deviceIds.length; i++) {
					Map deviceMap = new HashMap();
					deviceMap.put("id", Integer.parseInt(deviceIds[i]));
					list.add(deviceMap);
				}
			}
			if (Integer.valueOf(0) == Integer.valueOf((Integer) map.get("is_read"))) {// 未读状态
				Integer staffId = (Integer) currentUser.get("staffId");// 当前用户
				if (-1 == (Integer) map.get("status") || 1 == (Integer) map.get("status")) {// 申请人读取
					if (staffId == (Integer) map.get("apply_staff_id")) {
						String sql2 = "update meeting_room_apply as cua set cua.is_read=1 where id=? ";// 设置未审批或驳回内容已读
						basalDao.runUSql(sql2, new Object[] { id });
					}
				}
			}
		}
		map.put("deviceIds", list);
		return map;
	}

	/**
	 * 申请
	 * 
	 * @param meetingRoomApply
	 * @return
	 */
	public int add_Tx(MeetingRoomApply meetingRoomApply) {
		String sql = "select count(*) from meeting_room_apply as mra inner join staff_info as si on si.id=mra.apply_staff_id inner join department_info as di on di.id=si.department_id where mra.meeting_room_id=? and mra.status not in (-1,-2) and ((mra.meeting_start_time>? and mra.meeting_start_time<?) or (mra.meeting_end_time<? and mra.meeting_end_time>?) or (mra.meeting_start_time<=? and mra.meeting_end_time>=?))";
		int carUseApplyNum = basalDao.queryInt(sql,
				new Object[] { meetingRoomApply.getMeetingRoomId(), meetingRoomApply.getMeetingStartTime(), meetingRoomApply.getMeetingEndTime(), meetingRoomApply.getMeetingEndTime(),
						meetingRoomApply.getMeetingStartTime(), meetingRoomApply.getMeetingStartTime(), meetingRoomApply.getMeetingEndTime() });
		if (carUseApplyNum != 0) {
			return -1;
		}

		sql = "insert into meeting_room_apply(meeting_room_id,department_id,apply_staff_id,apply_time,meeting_start_time,meeting_end_time,meeting_theme,meeting_content,meeting_staff_count,meeting_staff_names,meeting_device_ids,remark,status) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		return basalDao.runUSql(
				sql,
				new Object[] { meetingRoomApply.getMeetingRoomId(), meetingRoomApply.getDepartmentId(), meetingRoomApply.getApplyStaffId(), new Date(), meetingRoomApply.getMeetingStartTime(),
						meetingRoomApply.getMeetingEndTime(), meetingRoomApply.getMeetingTheme(), meetingRoomApply.getMeetingContent(), meetingRoomApply.getMeetingStaffCount(),
						meetingRoomApply.getMeetingStaffNames(), meetingRoomApply.getMeetingDeviceIds(), meetingRoomApply.getRemark(), meetingRoomApply.getStatus() });
	}

	public int del(int id) {
		String sql = "delete from meeting_room_apply where id=?";
		return basalDao.runUSql(sql, new Object[] { id });
	}
	/**
	 * 会议室取消
	 * @param id
	 */
	public void cancel(int id) {
		String sql = "update meeting_room_apply set `status`=-2 where id=?";
		basalDao.runUSql(sql, new Object[] { id });
		sql = "select * from meeting_room_apply where id=?";
		Map meetingUseApplyMap = basalDao.queryMap(sql, new Object[] { id });
		sql = "update meeting_room_apply set `status`=-2 where ((meeting_start_time<=? and meeting_end_time=?) or (meeting_start_time<? and meeting_end_time>=?)) and meeting_room_id=?";
		basalDao.runUSql(sql,
				new Object[] { meetingUseApplyMap.get("meeting_start_time"), meetingUseApplyMap.get("meeting_start_time"), meetingUseApplyMap.get("meeting_start_time"), meetingUseApplyMap.get("meeting_start_time"), meetingUseApplyMap.get("meeting_room_id") });

		sql = "select * from meeting_room_apply where ((meeting_start_time<=? and meeting_end_time=?) or (meeting_start_time<? and meeting_end_time>=?)) and meeting_room_id=? and `status`=-2";
		List<Map> meetingUseApplyList = basalDao.queryList(sql,
				new Object[] { meetingUseApplyMap.get("meeting_start_time"), meetingUseApplyMap.get("meeting_start_time"), meetingUseApplyMap.get("meeting_end_time"), meetingUseApplyMap.get("meeting_end_time"), meetingUseApplyMap.get("meeting_room_id") });
		for (Map meetingUseApply : meetingUseApplyList) {
			String insertMsgSql = "insert into msg_info(msg_type,msg_title,msg_content,msg_status,msg_sender,msg_addressee,msg_time) value(?,?,?,?,?,?,now())";
			String msgContent = "您有一条会议室申请被取消。会议主题：" + meetingUseApply.get("meeting_theme") + "，会议内容：" + meetingUseApply.get("meeting_content") + "，会议开始时间：" + meetingUseApply.get("meeting_start_time") + "，会议结束时间：" + meetingUseApply.get("meeting_start_time") + "。";
			basalDao.runUSql(insertMsgSql, new Object[] { 0, "会议室申请取消", msgContent, 0, 0, meetingUseApply.get("apply_staff_id") });
		}
	}

	/**
	 * 审核
	 * 
	 * @param meetingRoomApply
	 * @return
	 */
	public int audit_Tx(MeetingRoomApply meetingRoomApply) {
		if (meetingRoomApply.getStatus() == -1) {
			Map meetingRoomApplyMap = basalDao.queryMap("select * from meeting_room_apply where id=?", new Object[] { meetingRoomApply.getId() });
			String insertMsgSql = "insert into msg_info(msg_type,msg_title,msg_content,msg_status,msg_sender,msg_addressee,msg_time) value(?,?,?,?,?,?,now())";
			String msgContent = "您有一条会议室申请被驳回。会议主题：" + meetingRoomApplyMap.get("meeting_theme") + "，会议起始时间：" + meetingRoomApplyMap.get("meeting_start_time") + "，会议结束时间："
					+ meetingRoomApplyMap.get("meeting_end_time") + "。";
			basalDao.runUSql(insertMsgSql, new Object[] { 0, "会议室申请驳回", msgContent, 0, 0, meetingRoomApplyMap.get("apply_staff_id") });
		} else {
			Map meetingRoomApplyMap = basalDao.queryMap("select * from meeting_room_apply where id=?", new Object[] { meetingRoomApply.getId() });
			String insertMsgSql = "insert into msg_info(msg_type,msg_title,msg_content,msg_status,msg_sender,msg_addressee,msg_time) value(?,?,?,?,?,?,now())";
			String msgContent = "您有一条会议室申请被通过。会议主题：" + meetingRoomApplyMap.get("meeting_theme") + "，会议起始时间：" + meetingRoomApplyMap.get("meeting_start_time") + "，会议结束时间："
					+ meetingRoomApplyMap.get("meeting_end_time") + "。";
			basalDao.runUSql(insertMsgSql, new Object[] { 0, "会议室申请通过", msgContent, 0, 0, meetingRoomApplyMap.get("apply_staff_id") });
		}
		String sql = "update meeting_room_apply set status=?,audit_staff_id=?,audit_time=now() where id=?";
		return basalDao.runUSql(sql, new Object[] { meetingRoomApply.getStatus(), meetingRoomApply.getApplyStaffId(), meetingRoomApply.getId() });
	}

	public List calendar(List<String> dateList, List<Map> dataMeetingRoomUseTimeList, List<Map> meetingRoomInfoList) {
		List resultList = new ArrayList();
		for (int i = 0; i < meetingRoomInfoList.size(); i++) {
			Map meetingRoomInfoMap = meetingRoomInfoList.get(i);
			for (int j = 0; j < dataMeetingRoomUseTimeList.size(); j++) {
				Map resultMap = new HashMap();
				Map dataMeetingRoomUseTimeMap = dataMeetingRoomUseTimeList.get(j);
				if (j == 0) {
					resultMap.put("meeting_room_name", meetingRoomInfoMap.get("name"));
					resultMap.put("max_count_use", meetingRoomInfoMap.get("max_count_use"));
				}
				resultMap.put("meeting_room_id", meetingRoomInfoMap.get("id"));
				resultMap.put("use_time", dataMeetingRoomUseTimeMap.get("start_time") + "~" + dataMeetingRoomUseTimeMap.get("end_time"));
				if (j < 1) {
					resultMap.put("use_time_title", dataMeetingRoomUseTimeMap.get("start_time") + "~" + dataMeetingRoomUseTimeMap.get("end_time") + "<br/>（上午）");
				} else {
					resultMap.put("use_time_title", dataMeetingRoomUseTimeMap.get("start_time") + "~" + dataMeetingRoomUseTimeMap.get("end_time") + "<br/>（下午）");
				}
				resultMap.put("use_start_time", dataMeetingRoomUseTimeMap.get("start_time"));
				resultMap.put("use_end_time", dataMeetingRoomUseTimeMap.get("end_time"));
				for (int k = 0; k < dateList.size(); k++) {
					String date = dateList.get(k);
					String startTime = date + " " + dataMeetingRoomUseTimeMap.get("start_time") + ":00";
					String endTime = date + " " + dataMeetingRoomUseTimeMap.get("end_time") + ":00";
					String sql = "select mra.*,si.name as staff_name,di.name as department_name from meeting_room_apply as mra inner join staff_info as si on si.id=mra.apply_staff_id inner join department_info as di on di.id=si.department_id where mra.meeting_room_id=? and mra.status not in (-1,-2) and ((mra.meeting_start_time>? and mra.meeting_start_time<?) or (mra.meeting_end_time<? and mra.meeting_end_time>?) or (mra.meeting_start_time<=? and mra.meeting_end_time>=?))";
					List meetingRoomApplyList = basalDao.queryList(sql, new Object[] { meetingRoomInfoMap.get("id"), startTime, endTime, endTime, startTime, startTime, endTime, });
					resultMap.put(date, meetingRoomApplyList);
				}
				resultList.add(resultMap);
			}
			resultList.add(new HashMap());
		}
		return resultList;
	}

	public void clearApply() {
		String sql = "update meeting_room_apply set `status`=-1 where meeting_start_time<=now() and `status`=0";
		basalDao.runUSql(sql, null);
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
