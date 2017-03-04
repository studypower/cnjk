package com.disease_control.db.dao;

import com.disease_control.core.dao.EntityDao;

public interface BasalDao extends EntityDao {
	public Long insertAndGetKey(String sql, Object... objects);
}
