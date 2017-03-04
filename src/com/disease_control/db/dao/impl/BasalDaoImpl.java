package com.disease_control.db.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import com.disease_control.core.dao.GenericDao;
import com.disease_control.db.dao.BasalDao;

public class BasalDaoImpl extends GenericDao implements BasalDao {
	/**
	 * 新增数据并返回数据的主键ID
	 * 
	 * @param sql
	 * @param objs
	 */
	public Long insertAndGetKey(final String sql, final Object... objs) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		getJdbcTemplate().update(new PreparedStatementCreator() {
			public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
				PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				if (objs != null) {
					int parameterIndex = 1;
					for (Object object : objs) {
						ps.setObject(parameterIndex++, object);
					}
				}
				return ps;
			}
		}, keyHolder);
		Long generatedId = keyHolder.getKey().longValue();
		return generatedId;
	}
}
