package com.disease_control.core.dao;

import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;

/**
 * 
 * @author yakov
 */
public interface EntityDao {

	/**
	 * 只要执行Update，Insert，Delete语句。返回值为Int
	 * 
	 * @param sql
	 * @return
	 */

	int runUSql(String sql, Object[] params);

	int[] runSqls(String[] sqls);

	void runUSqls(String sql, final List<Object[]> paramsList);

	/**
	 * 主要执行Select Count语句。返回值为Int
	 * 
	 * @param sql
	 * @return
	 */
	int queryInt(String sql, Object[] params);

	/**
	 * 主要执行Select语句，返回结果集
	 * 
	 * @param sql
	 * @return
	 */
	List queryList(String sql, Object[] params);

	/**
	 * 
	 * @param sql
	 * @return
	 */

	Map queryMap(String sql, Object[] params);

	Page pagedQuery_mysql_sql(String sql, int pageIndex, int pageSize, Object[] params);

	Page pagedQuery_mysql_sql(String sql, String countColumn, int pageIndex, int pageSize, Object[] params);

	Page pagedQuery_mysql_sql_zbftj(String sql, int pageIndex, int pageSize, Object[] params);
}
