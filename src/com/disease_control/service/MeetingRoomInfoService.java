package com.disease_control.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.MeetingRoomInfo;

public class MeetingRoomInfoService {
	/**
	 * 列表
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @param id
	 * @return
	 */
	public Page list(int pageIndex, int pageSize, int id, int active) {
		List paramList = new ArrayList();
		StringBuffer sql = new StringBuffer("select id,name,address,max_count_use,device_names,active from meeting_room_info where status=1");
		if (id > 0) {
			sql.append(" and id=?");
			paramList.add(id);
		}
		if (active != 0) {
			sql.append(" and active=?");
			paramList.add(active);
		}
		sql.append(" order by id desc");
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		return basalDao.pagedQuery_mysql_sql(sql.toString(), pageIndex, pageSize, params);

	}

	/**
	 * 添加
	 * 
	 * @param meetingRoomInfo
	 * @return
	 */
	public int add(MeetingRoomInfo meetingRoomInfo) {
		String[] ids = meetingRoomInfo.getDeviceIds().split(",");
		String deviceIds = "0";
		for (int i = 0; i < ids.length; i++) {
			if (!deviceIds.equals("0")) {
				deviceIds += ",";
			}
			deviceIds += ids[i];
		}
		String sql = "select device_name as name from meeting_room_device where id in(" + deviceIds + ")";
		List<Map> list = basalDao.queryList(sql, new Object[] {});
		String deviceNames = "";
		for (Map map : list) {
			if (deviceNames != "") {
				deviceNames += ",";
			}
			deviceNames += map.get("name");
		}
		sql = "insert into meeting_room_info(name,address,max_count_use,remark,device_ids,device_names,active,start_time,end_time,status) values(?,?,?,?,?,?,?,?,?,1)";
		return basalDao.runUSql(sql,
				new Object[] { meetingRoomInfo.getName(), meetingRoomInfo.getAddress(), meetingRoomInfo.getMaxCountUse(), meetingRoomInfo.getRemark(), meetingRoomInfo.getDeviceIds(), deviceNames,
						meetingRoomInfo.getActive(), meetingRoomInfo.getStartTime(), meetingRoomInfo.getEndTime() });
	}

	/**
	 * 查出详情
	 * 
	 * @param id
	 * @return
	 */
	public Map get(int id) {
		String sql = "select id,name,address,max_count_use,remark,device_ids,device_names,active,start_time,end_time from meeting_room_info where id=?";
		Map map = basalDao.queryMap(sql, new Object[] { id });
		if (map.get("device_ids") != "null" && !"".equals(map.get("device_ids"))) {
		    sql="select * from meeting_room_device where id in ("+map.get("device_ids")+")";
		    List deviceList=basalDao.queryList(sql,new Object[]{});
		    map.put("meetingDeviceList",deviceList);
		}
	/*	List list = new ArrayList();
		if (map != null) {
			if (map.get("device_ids") != "null" && !"".equals(map.get("device_ids"))) {
				String[] deviceIds = map.get("device_ids").toString().split(",");
				for (int i = 0; i < deviceIds.length; i++) {
					Map deviceMap = new HashMap();
					deviceMap.put("id", Integer.parseInt(deviceIds[i]));
					list.add(deviceMap);
				}
			}
		}
		map.put("deviceIds", list);*/
		return map;
	}

	/**
	 * 修改
	 * 
	 * @param meetingRoomInfo
	 * @return
	 */
	public int update(MeetingRoomInfo meetingRoomInfo) {
		String[] ids = meetingRoomInfo.getDeviceIds().split(",");
		String deviceIds = "0";
		for (int i = 0; i < ids.length; i++) {
			if (!deviceIds.equals("0")) {
				deviceIds += ",";
			}
			deviceIds += ids[i];
		}
		String sql = "select device_name as name from meeting_room_device where id in(" + deviceIds + ")";
		List<Map> list = basalDao.queryList(sql, new Object[] {});
		String deviceNames = "";
		for (Map map : list) {
			if (deviceNames != "") {
				deviceNames += ",";
			}
			deviceNames += map.get("name");
		}
		sql = "update meeting_room_info set name=?,address=?,max_count_use=?,remark=?,device_ids=?,device_names=?,active=?,start_time=?,end_time=? where id=?";
		return basalDao.runUSql(sql,
				new Object[] { meetingRoomInfo.getName(), meetingRoomInfo.getAddress(), meetingRoomInfo.getMaxCountUse(), meetingRoomInfo.getRemark(), meetingRoomInfo.getDeviceIds(), deviceNames,
						meetingRoomInfo.getActive(), meetingRoomInfo.getStartTime(), meetingRoomInfo.getEndTime(), meetingRoomInfo.getId() });
	}
	
	
	public int del(int id){
		String sql="update meeting_room_info set status=0 where id=?";
		return basalDao.runUSql(sql,new Object[]{id});
	}

	/**
	 * 查出所有的会议室
	 * 
	 * @return
	 */
	public List list() {
		String sql = "select * from meeting_room_info";
		return basalDao.queryList(sql, new Object[] {});
	}

	/**
	 * 查询符合状态的会议室
	 * 
	 * @return
	 */
	public List list(int active) {
		String sql = "select * from meeting_room_info where active=? and status=1";
		return basalDao.queryList(sql, new Object[] { active });
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
