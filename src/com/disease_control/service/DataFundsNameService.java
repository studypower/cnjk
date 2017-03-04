package com.disease_control.service;

import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.DataFundsName;
import com.disease_control.web.form.DataSupplierCertificateType;

/**
 * 经费单名称
 * 
 * @author
 * 
 */
public class DataFundsNameService {

	public List list() {
		String sql = "select * from data_funds_name where status=1";
		return basalDao.queryList(sql, new Object[] {});
	}

	/**
	 * 列表
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public Page list(int pageIndex, int pageSize) {
		String sql = "select * from data_funds_name order by id desc";
		return basalDao.pagedQuery_mysql_sql(sql, pageIndex, pageSize, new Object[] {});
	}

	/**
	 * 添加
	 * 
	 * @param dataSupplierCertificateType
	 * @return
	 */
	public int add_Tx(DataFundsName dataFundsName) {
		String sql = "select count(1) from data_funds_name where name=?";
		if (basalDao.queryInt(sql, new Object[] { dataFundsName.getName() }) > 0) {
			return -1;
		}
		sql = "insert into data_funds_name(name) values(?)";
		return basalDao.runUSql(sql, new Object[] { dataFundsName.getName() });
	}

	/**
	 * 详情
	 * 
	 * @param id
	 * @return
	 */
	public Map get(int id) {
		String sql = "select * from data_funds_name where id=?";
		return basalDao.queryMap(sql, new Object[] { id });
	}

	/**
	 * 修改
	 * 
	 * @param dataSupplierCertificateType
	 * @return
	 */
	public int update_Tx(DataFundsName dataFundsName) {
		String sql = "select count(1) from data_funds_name where name=? and id<>?";
		if (basalDao.queryInt(sql, new Object[] { dataFundsName.getName(), dataFundsName.getId() }) > 0) {
			return -1;
		}
		sql = "update data_funds_name set name=? where id=?";
		return basalDao.runUSql(sql, new Object[] { dataFundsName.getName(), dataFundsName.getId() });
	}

	/**
	 * 更改状态
	 * 
	 * @param id
	 * @param status
	 * @return
	 */
	public int updateStatus(int id, int status) {
		String sql = "update data_funds_name set status=? where id=?";
		return basalDao.runUSql(sql, new Object[] { status, id });
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

}
