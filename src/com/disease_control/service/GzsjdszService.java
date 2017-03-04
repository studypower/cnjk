package com.disease_control.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;

/**
 * 工作时间段维护
 */
@SuppressWarnings("unchecked")
public class GzsjdszService {
	/**
	 * 时间段类型
	 */
	public List<Map<String, Object>> getModelList() {
		String sql = "select oa.model_type,oa.model_type_name from oa_times_model oa where oa.is_delete='0' group by oa.model_type";
		return this.basalDao.queryList(sql, new Object[] {});
	}

	/**
	 * 分页查询时间段设置内容
	 */
	public Page list(int pageIndex, int pageSize, String model_type, String is_use) {
		StringBuffer sql1 = new StringBuffer(" select * from (select oa.model_type from oa_times_model oa where 1 = 1 and oa.is_delete='0' ");
		List params = new ArrayList();
		if (StringUtils.isNotEmpty(model_type) && !model_type.equals("-1")) {
			sql1.append(" and oa.model_type=? ");
			params.add(model_type);
		}
		if (StringUtils.isNotEmpty(is_use) && !is_use.equals("-1")) {
			sql1.append(" and oa.is_use=? ");
			params.add(is_use);
		}
		sql1.append(" group by oa.model_type ) t");
		Page page = this.basalDao.pagedQuery_mysql_sql(sql1.toString(), pageIndex, pageSize, params.toArray());
		if (page != null) {
			List<Map<String, Object>> result = (List<Map<String, Object>>) page.getResult();
			if (result != null && !result.isEmpty()) {
				List<Integer> list = new ArrayList<Integer>();
				for (Map<String, Object> map : result) {
					Integer type = (Integer) map.get("model_type");
					list.add(type);
				}
				String in = list.toString().replaceAll("\\[", "(").replaceAll("\\]", ")");
				StringBuffer sql2 = new StringBuffer("select oa.* from oa_times_model oa where oa.model_type in " + in);
				result.clear();
				result.addAll(this.basalDao.queryList(sql2.toString(), new Object[] {}));
			}
		}
		return page;
	}

	// 设置启用，并将原有的启用状态设置为禁用
	public void setIsUse(String id) {
		Map<String, Object> params = this.basalDao.queryMap("select y.model_type from oa_times_model y where y.id=?", new Object[] { id });
		this.basalDao.runUSql("update oa_times_model oa set oa.is_use='0' where oa.is_use='1'", new Object[] {});
		this.basalDao.runUSql("update oa_times_model oa set oa.is_use='1' where oa.model_type =?", new Object[] { params.get("model_type") });
	}

	/**
	 * 根据其中一条数据的id,查询出与之同模型的数据
	 */
	public List<Map<String, Object>> initEdit(String id) {
		String sql = "select y.* from oa_times_model y,oa_times_model oa where oa.id=? and y.model_type=oa.model_type";
		return this.basalDao.queryList(sql, new Object[] { id });
	}

	/**
	 * 修改时间段内容
	 */
	public void edits(List<Map<String, Object>> list) {
		String sql = "update oa_times_model set model_type=?,model_type_name=?,model_name=?,start_time=?,end_time=?,update_time=now(),update_user=?,type=? where id=?";
		List<Object[]> paramsList = new ArrayList<Object[]>();
		for (Map<String, Object> m : list) {
			Object[] obj = new Object[8];
			obj[0] = m.get("model_type");
			obj[1] = m.get("model_type_name");
			obj[2] = m.get("model_name");
			obj[3] = m.get("start_time");
			obj[4] = m.get("end_time");
			obj[5] = m.get("update_user");
			obj[6] = m.get("type");
			obj[7] = m.get("id");
			paramsList.add(obj);
		}
		this.basalDao.runUSqls(sql, paramsList);
	}

	/**
	 * 验证时间段类型
	 */
	public List<Map<String, Object>> valModelName(String model_type_, String model_type_name_) {
		StringBuffer sql = new StringBuffer("select oa.model_type_name from oa_times_model oa where 1 = 1 ");
		List<Object> list = new ArrayList<Object>();
		if (StringUtils.isNotEmpty(model_type_)) {
			sql.append(" and oa.model_type=?");
			list.add(model_type_);
		}
		if (StringUtils.isNotEmpty(model_type_name_)) {
			sql.append(" and oa.model_type_name=?");
			list.add(model_type_name_);
		}
		return this.basalDao.queryList(sql.toString(), list.toArray());
	}

	/**
	 * 删除为启动的时间段
	 */
	public void setDelete(String model_type) {
		if (StringUtils.isNotEmpty(model_type)) {
			this.basalDao.runUSql("update oa_times_model oa set oa.is_delete='1' where oa.model_type =?", new Object[] { model_type });
		}
	}

	public void addNews(List<Map<String, Object>> list) {
		int model_type = this.basalDao.queryInt("select max(model_type)+1 from oa_times_model", new Object[] {});
		StringBuffer sql = new StringBuffer("insert into oa_times_model ");
		sql.append("( model_type,model_type_name,model_name,start_time, ");
		sql.append(" end_time,create_time,create_user,update_time, ");
		sql.append(" update_user,is_use,is_delete,type  )");
		sql.append(" values(?,?,?,?,?,now(),?,now(),?,?,0,? )");
		List<Object[]> paramsList = new ArrayList<Object[]>();
		String is_use = "0";
		for (Map<String, Object> m : list) {
			Object[] obj = new Object[9];
			obj[0] = model_type;
			obj[1] = m.get("model_type_name");
			obj[2] = m.get("model_name");
			obj[3] = m.get("start_time");
			obj[4] = m.get("end_time");
			obj[5] = m.get("create_user");
			obj[6] = m.get("update_user");
			obj[7] = m.get("is_use");
			obj[8] = m.get("type");
			paramsList.add(obj);
			is_use = (String) obj[7];
		}
		if ("1".equals(is_use)) {
			this.basalDao.runUSql("update oa_times_model oa set oa.is_use='0' where oa.is_use='1'", new Object[] {});
		}
		this.basalDao.runUSqls(sql.toString(), paramsList);
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}
}
