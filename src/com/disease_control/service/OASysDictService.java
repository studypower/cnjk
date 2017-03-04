package com.disease_control.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.disease_control.db.dao.BasalDao;

public class OASysDictService {
	
	public static Logger logger=Logger.getLogger(OASysDictService.class);
	
	public List<Map<String, Object>> findDicts(String type) {
		String sql = "select * from oa_sys_dict oa where oa.is_delete='0' and oa.ext_type=? ";
		logger.info(sql.toString());
		return basalDao.queryList(sql, new Object[] { type });
	}
	public List<Map<String, Object>> findDictsAll(String type) {
		String sql = "select * from oa_sys_dict oa where oa.ext_type=? ";
		logger.info(sql.toString());
		return basalDao.queryList(sql, new Object[] { type });
	}
	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}
}
