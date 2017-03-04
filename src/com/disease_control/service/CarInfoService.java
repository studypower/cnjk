package com.disease_control.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.CarInfo;

public class CarInfoService {

	public Page list(int pageIndex, int pageSize, String brandName, String idNum, int status, Date startTime, Date endTime) {
		StringBuffer sql = new StringBuffer();
		ArrayList paramList = new ArrayList();
		sql.append("select * from car_info where del_status=0");
		if (brandName != null && !brandName.equals("")) {
			sql.append(" and brand_name like ?");
			paramList.add("%" + brandName + "%");
		}
		if (idNum != null && !idNum.equals("")) {
			sql.append(" and id_num like ?");
			paramList.add("%" + idNum + "%");
		}
		if (status != -100) {
			sql.append(" and status = ?");
			paramList.add(status);
		}
		if (startTime != null) {
			sql.append(" and buy_time >= ?");
			paramList.add(startTime);
		}
		if (endTime != null) {
			sql.append(" and buy_time <= ?");
			paramList.add(endTime);
		}
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		return basalDao.pagedQuery_mysql_sql(sql.toString(), pageIndex, pageSize, params);
	}

	public int add_Tx(CarInfo carInfo) {
		String sql = "insert into car_info(brand_name,brand_model,id_num,seats_num,buy_time,remark,status) values(?,?,?,?,?,?,?)";
		return basalDao.runUSql(sql,
				new Object[] { carInfo.getBrandName(), carInfo.getBrandModel(), carInfo.getIdNum(), carInfo.getSeatsNum(), carInfo.getBuyTime(), carInfo.getRemark(), carInfo.getStatus() });
	}

	public int update_Tx(CarInfo carInfo) {
		String sql = "update car_info set brand_name=?,brand_model=?,id_num=?,seats_num=?,buy_time=?,remark=?,status=? where id=?";
		return basalDao.runUSql(
				sql,
				new Object[] { carInfo.getBrandName(), carInfo.getBrandModel(), carInfo.getIdNum(), carInfo.getSeatsNum(), carInfo.getBuyTime(), carInfo.getRemark(), carInfo.getStatus(),
						carInfo.getId() });
	}

	public List list() {
		String sql = "select * from car_info where `status`=1 and del_status=0";
		return basalDao.queryList(sql, null);
	}

	public Map get(int id) {
		return basalDao.queryMap("select * from car_info where id=?", new Object[] { id });
	}

	public void delete(int id) {
		basalDao.runUSql("update car_info set del_status=1 where id=?", new Object[] { id });
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
