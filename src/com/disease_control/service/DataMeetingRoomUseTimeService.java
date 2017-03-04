package com.disease_control.service;

import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.DataCarUseTime;
import com.disease_control.web.form.DataMeetingRoomUseTime;

public class DataMeetingRoomUseTimeService {

	public List list() {
		String sql = "select * from data_meeting_room_use_time";
		return basalDao.queryList(sql, null);
	}

	public Page list(int pageIndex, int pageSize) {
		String sql = "select * from data_meeting_room_use_time";
		return basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, null);
	}

	public Map info(int id) {
		String sql = "select * from data_meeting_room_use_time where id=?";
		return basalDao.queryMap(sql, new Object[] { id });
	}

	public int add(DataMeetingRoomUseTime dataMeetingRoomUseTime) {
		String sql = "insert into data_meeting_room_use_time(start_time,end_time) values(?,?)";
		return basalDao.runUSql(sql, new Object[] { dataMeetingRoomUseTime.getStartTime(), dataMeetingRoomUseTime.getEndTime() });
	}

	public int update(DataMeetingRoomUseTime dataMeetingRoomUseTime) {
		String sql = "update data_meeting_room_use_time set start_time=?,end_time=? where id=?";
		return basalDao.runUSql(sql, new Object[] { dataMeetingRoomUseTime.getStartTime(), dataMeetingRoomUseTime.getEndTime(), dataMeetingRoomUseTime.getId() });
	}

	public int del(int id) {
		String sql = "delete from data_meeting_room_use_time where id=?";
		return basalDao.runUSql(sql, new Object[] { id });
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
