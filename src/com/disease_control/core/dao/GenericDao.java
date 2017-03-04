package com.disease_control.core.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.util.Assert;

import com.disease_control.core.page.Page;
import com.yakov.utils.StringUtil;

public class GenericDao implements EntityDao {
	private static final Logger log = Logger.getLogger(GenericDao.class);

	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	/**
	 * MSQL 根据sql语句进行分页查询
	 * 
	 * @param sql
	 * @param pageIndex
	 * @param pageSize
	 * @param values
	 * @return
	 */
	public Page pagedQuery_mysql_sql(String sql, int pageIndex, int pageSize, Object[] values) {
		Assert.hasText(sql);
		String countSql = " select count(*) " + removeSelect(removeOrders(sql));
		StringBuffer str=new StringBuffer("SQL语句：：：查询数量：：：");
		str.append(countSql).append(":::").append(StringUtil.getObjectsValue(values));
		int totalCount = jdbcTemplate.queryForInt(countSql.toString(), values);
		str.append("结果：：：").append(totalCount);
		log.info(str.toString());
		if (totalCount < 1) {
			return new Page();
		}
		int startIndex = Page.getStartOfPage(pageIndex, pageSize);
		StringBuffer pageSql = new StringBuffer("");
		pageSql.append(sql);
		pageSql.append(" limit " + startIndex);
		pageSql.append(" , " + pageSize);
		StringBuffer str2=new StringBuffer("SQL语句：：：分页查询：：：").append(pageSql.toString());
		log.info(str2.toString());
		List list = jdbcTemplate.queryForList(pageSql.toString(), values);
		return new Page(pageIndex, pageSize, list, totalCount);
	}

	/**
	 * MSQL 根据sql语句进行分页查询
	 * 
	 * @param sql
	 * @param pageIndex
	 * @param pageSize
	 * @param values
	 * @return
	 */
	public Page pagedQuery_mysql_sql(String sql, String countColumn, int pageIndex, int pageSize, Object[] values) {
		Assert.hasText(sql);
		String countSql = " select count(" + countColumn + ") " + removeSelect(removeOrders(sql));
		StringBuffer str=new StringBuffer("SQL语句：：：查询数量：：：");
		str.append(countSql).append(":::").append(StringUtil.getObjectsValue(values));
		int totalCount = jdbcTemplate.queryForInt(countSql.toString(), values);
		str.append("结果：：：").append(totalCount);
		log.info(str.toString());
		if (totalCount < 1) {
			return new Page();
		}
		int startIndex = Page.getStartOfPage(pageIndex, pageSize);
		StringBuffer pageSql = new StringBuffer("");
		pageSql.append(sql);
		pageSql.append(" limit " + startIndex);
		pageSql.append(" , " + pageSize);
		StringBuffer str2=new StringBuffer("SQL语句：：：分页查询：：：").append(pageSql.toString());
		log.info(str2.toString());
		List list = jdbcTemplate.queryForList(pageSql.toString(), values);
		return new Page(pageIndex, pageSize, list, totalCount);
	}

	@Override
	public int runUSql(String sql, Object[] params) {
		StringBuffer str=new StringBuffer("SQL语句：：：分页查询：：：").append(sql.toString());
		str.append(StringUtil.getObjectsValue(params));
		log.info(str.toString());
		return getJdbcTemplate().update(sql, params);
	}

	public int[] runSqls(String[] sqls) {
		StringBuffer str=new StringBuffer("SQL语句：：：分页查询：：：").append(StringUtil.getObjectsValue(sqls));
		log.info(str.toString());
		return getJdbcTemplate().batchUpdate(sqls);
	}


	public void runUSqls(String sql, final List<Object[]> paramsList) {
		StringBuffer str=new StringBuffer("SQL语句：：：分页查询：：：").append(sql).append(paramsList.toString());
		log.info(str.toString());
		jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				Object[] params = paramsList.get(i);
				for (int l = 0; l < params.length; l++) {
					ps.setObject(l + 1, paramsList.get(i)[l]);
				}
			}

			public int getBatchSize() {
				return paramsList.size();
			}
		});
	}

	@Override
	public int queryInt(String sql, Object[] params) {
		StringBuffer str=new StringBuffer("SQL语句：：：分页查询：：：").append(sql.toString());
		str.append(StringUtil.getObjectsValue(params));
		log.info(str.toString());
		return getJdbcTemplate().queryForInt(sql, params);
	}

	@Override
	public List queryList(String sql, Object[] params) {
		StringBuffer str=new StringBuffer("SQL语句：：：分页查询：：：").append(sql.toString());
		str.append(StringUtil.getObjectsValue(params));
		log.info(str.toString());
		return getJdbcTemplate().queryForList(sql, params);
	}

	@Override
	public Map queryMap(String sql, Object[] params) {
		StringBuffer str=new StringBuffer("SQL语句：：：分页查询：：：").append(sql.toString());
		str.append(StringUtil.getObjectsValue(params));
		log.info(str.toString());
		
		String countSql = " select count(*) " + removeSelect(removeOrders(sql));
		if (getJdbcTemplate().queryForInt(countSql, params) == 0) {
			return null;
		}
		return getJdbcTemplate().queryForMap(sql, params);
	}

	/**
	 * 去除Sql语句中的Select From部分
	 */
	protected static String removeSelect(String hql) {
		Assert.hasText(hql);
		int beginPos = hql.toLowerCase().indexOf(" from");
		Assert.isTrue(beginPos != -1, " hql : " + hql + " must has a keyword 'from'");
		return hql.substring(beginPos);
	}

	/**
	 * 去除Sql语句中的order by部分
	 */
	protected static String removeOrders(String hql) {
		Assert.hasText(hql);
		Pattern p = Pattern.compile("order\\s*by[\\w|\\W|\\s|\\S]*", Pattern.CASE_INSENSITIVE);
		Matcher m = p.matcher(hql);
		StringBuffer sb = new StringBuffer();
		while (m.find()) {
			m.appendReplacement(sb, "");
		}
		m.appendTail(sb);
		return sb.toString();
	}

	@Override
	public Page pagedQuery_mysql_sql_zbftj(String sql, int pageIndex, int pageSize, Object[] values) {
		Assert.hasText(sql);
		String countSql = " select count(*) " + removeSelect(sql);
		StringBuffer str=new StringBuffer("SQL语句：：：查询数量：：：");
		str.append(countSql).append(":::").append(StringUtil.getObjectsValue(values));
		int totalCount = jdbcTemplate.queryForInt(countSql.toString(), values);
		str.append("结果：：：").append(totalCount);
		log.info(str.toString());
		if (totalCount < 1) {
			return new Page();
		}
		int startIndex = Page.getStartOfPage(pageIndex, pageSize);
		StringBuffer pageSql = new StringBuffer("");
		pageSql.append(sql);
		pageSql.append(" limit " + startIndex);
		pageSql.append(" , " + pageSize);
		StringBuffer str2=new StringBuffer("SQL语句：：：分页查询：：：").append(pageSql.toString());
		log.info(str2.toString());
		List list = jdbcTemplate.queryForList(pageSql.toString(), values);
		return new Page(pageIndex, pageSize, list, totalCount);
	}

}