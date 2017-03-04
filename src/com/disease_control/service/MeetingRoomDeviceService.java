package com.disease_control.service;

import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.MeetingRoomDevice;
/**
 * 会议室设备
 * @author 
 *
 */
public class MeetingRoomDeviceService {

	/*public List list(int type){
		String sql="select id,device_name from meeting_room_device where type=?";
		return basalDao.queryList(sql,new Object[]{type});
	}*/
	/**
	 * 查出会议室设备
	 * @param type
	 * @return
	 */
	public List list(){
		String sql="select id,device_name from meeting_room_device";
		return basalDao.queryList(sql,new Object[]{});
	}
	
	public Page list(int pageIndex,int pageSize){
		String sql="select id,device_name from meeting_room_device";
		return basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, new Object[]{});
	}
	
	public int add(MeetingRoomDevice meetingRoomDevice){
		String sql="select count(*) from meeting_room_device where device_name=?";
		if(basalDao.queryInt(sql,new Object[]{meetingRoomDevice.getDeviceName()})>0){
			return -1;
		}
		sql="insert into meeting_room_device(device_name) values(?)";
		return basalDao.runUSql(sql,new Object[]{meetingRoomDevice.getDeviceName()});
	}
	
	public Map get(int id){
		String sql="select id, device_name as deviceName from meeting_room_device where id=?";
		return basalDao.queryMap(sql,new Object[]{id});
	}
	
	public int update(MeetingRoomDevice meetingRoomDevice){
		String sql="select count(*) from meeting_room_device where device_name=? and id<>?";
		if(basalDao.queryInt(sql,new Object[]{meetingRoomDevice.getDeviceName(),meetingRoomDevice.getId()})>0){
			return -1;
		}
		sql="update meeting_room_device set device_name=? where id=?";
		return basalDao.runUSql(sql,new Object[]{meetingRoomDevice.getDeviceName(),meetingRoomDevice.getId()});
	} 
	
	public int del(int id){
		String sql="delete from meeting_room_device where id=?";
		return basalDao.runUSql(sql, new Object[]{id});
	}
	
	
	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
