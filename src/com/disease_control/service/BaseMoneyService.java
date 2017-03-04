package com.disease_control.service;

import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;

/**
 * 基数管理
 * 
 * @author liuhuan
 * 
 */
public class BaseMoneyService {

	private static Logger logger = Logger.getLogger(CarUseApplyService.class.getName());

	public Page list(int pageIndex, int pageSize) {
		String sql = "SELECT base.ID,DATE_FORMAT(base.START_TIME,'%Y-%m-%d') START_TIME,DATE_FORMAT(base.END_TIME,'%Y-%m-%d') END_TIME,base.BASE_MONEY FROM oa_base_money base order by base.START_TIME desc,base.END_TIME desc";
		logger.info(sql);
		return basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, new Object[] {});
	}

	public Map<String, Object> get(String id) {
		String sql = "SELECT base.ID,DATE_FORMAT(base.START_TIME,'%Y-%m-%d') START_TIME,DATE_FORMAT(base.END_TIME,'%Y-%m-%d') END_TIME,base.BASE_MONEY FROM oa_base_money base where base.id=?";
		return basalDao.queryMap(sql, new Object[] { id });
	}

	/**
	 * 新增或修改
	 * 
	 * @param id
	 * @param startTime
	 * @param endTime
	 * @param baseMoney
	 */
	public void saveOrUpdate(String id, String startTime, String endTime, String baseMoney) {
		if (StringUtils.isNotEmpty(id)) {// update
			StringBuffer sql = new StringBuffer("UPDATE  oa_base_money base");
			sql.append(" set ");
			sql.append(" base.START_TIME=?, ");
			sql.append(" base.END_TIME=?, ");
			sql.append(" base.BASE_MONEY=? ");
			sql.append(" where base.id=?");
			basalDao.runUSql(sql.toString(), new Object[] { startTime, endTime, baseMoney, id });
		} else {// insert
			StringBuffer sql = new StringBuffer("insert into oa_base_money");
			sql.append(" (START_TIME,END_TIME,BASE_MONEY )");
			sql.append(" values ");
			sql.append("(?,?,?)");
			basalDao.runUSql(sql.toString(), new Object[] { startTime, endTime, baseMoney });
		}
	}

	/**
	 * 删除基数
	 * 
	 * @param id
	 */
	public void delete(String id) {
		if (StringUtils.isNotEmpty(id)) {
			StringBuffer sql = new StringBuffer("delete from oa_base_money where id=?");
			basalDao.runUSql(sql.toString(), new Object[] { id });
		}
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}
}
