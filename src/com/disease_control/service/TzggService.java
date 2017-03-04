package com.disease_control.service;

import java.io.ByteArrayInputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;

public class TzggService {
	public static Logger logger = Logger.getLogger(TzggService.class);

	public Page search(int pageIndex, int pageSize, String notice_keyword, String startTime, String endTime, String status, String topSort, Map currentUser) {
		String curUserName = (String) currentUser.get("name");
		StringBuffer sql = new StringBuffer();
		sql.append(" select ");
		sql.append(" n.id, ");
		sql.append(" n.notice, ");
		sql.append(" n.publisher, ");
		sql.append(" s.name publisher_name, ");
		sql.append(" n.keyword, ");
		sql.append(" n.department_id, ");
		sql.append(" d.name department_name, ");
		sql.append(" n.publish_date, ");
		sql.append(" n.top, ");
		sql.append(" n.status, ");
		sql.append(" n.read_count ");
		sql.append(" from oa_notice_info n ");
		sql.append(" left join department_info d on d.id = n.department_id ");
		sql.append(" left join user_info u ON u.name = n.publisher ");
		sql.append(" left join staff_info s ON s.id = u.staff_id ");
		sql.append(" where 1 = 1 and n.status in (1,2) ");
		if (StringUtils.isNotEmpty(notice_keyword)) {
			sql.append(" and (n.notice like '%" + notice_keyword + "%' or n.keyword like '%" + notice_keyword + "%') ");
		}
		if (StringUtils.isNotEmpty(startTime)) {
			sql.append(" and n.publish_date > '" + startTime + "' ");
		}
		if (StringUtils.isNotEmpty(endTime)) {
			sql.append(" and n.publish_date <= '" + endTime + "' ");
		}
		if (StringUtils.isNotEmpty(status)) {
			if (new Integer(status) > 0) {// 我的草稿
				sql.append(" and n.status = '" + status + "' and n.publisher = '" + curUserName + "'");
			} else if (new Integer(status) == -2) {// 我发布的
				sql.append(" and n.status = '1' and n.publisher = '" + curUserName + "'");
			}
		}
		// 置顶数据排列在最前面,草稿其次，id倒排最后
		sql.append(" order by n.top desc,n.orderby asc,n.id desc");
		logger.info(sql.toString());
		return this.basalDao.pagedQuery_mysql_sql(sql.toString(), pageIndex, pageSize, new Object[] {});
	}

	public Integer add(String notice, String notice_content, String publisher, String keyword, String department_id, String top, String status, String isSendAll) {// 创建新的数据
		List<Object> list = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append("insert into oa_notice_info ");
		sql.append("(notice,notice_content,publisher,keyword,read_count,department_id,publish_date,top,status,isSendAll)");
		sql.append("values(?,?,?,?,?,?,?,?,?,?)");
		logger.info(sql.toString());
		list.add(notice);
		list.add(new ByteArrayInputStream(notice_content.getBytes()));
		list.add(publisher);
		list.add(keyword);
		list.add(0);
		list.add(department_id);
		list.add(new Date());
		list.add(top);
		list.add(status);
		list.add(isSendAll);
		this.basalDao.runUSql(sql.toString(), list.toArray());// 保存数据
		StringBuffer sql2 = new StringBuffer("select max(id) id from oa_notice_info");
		logger.info(sql2.toString());
		return this.basalDao.queryInt(sql2.toString(), new Object[] {});// 返回id
	}

	public Integer update(int id, String notice, String notice_content, String publisher, String keyword, String top, String status, String readCount, String orderby, String isSendAll) {
		StringBuffer sql = new StringBuffer("update oa_notice_info n set n.id = " + id);
		List<Object> list = new ArrayList<Object>();
		if (StringUtils.isNotEmpty(notice)) {
			sql.append(" ,n.notice = ? ");
			list.add(notice);
		}
		if (StringUtils.isNotEmpty(notice_content)) {
			sql.append(" ,n.notice_content = ? ");
			list.add(new ByteArrayInputStream(notice_content.getBytes()));
		}
		if (StringUtils.isNotEmpty(publisher)) {
			sql.append(" ,n.publisher = ? ");
			list.add(publisher);
		}
		if (StringUtils.isNotEmpty(keyword)) {
			sql.append(" ,n.keyword = ? ");
			list.add(keyword);
		}
		if (StringUtils.isNotEmpty(top)) {
			sql.append(" ,n.top = ? ");
			list.add(top);
		}
		if (StringUtils.isNotEmpty(readCount)) {
			sql.append(" ,n.read_count = ? ");
			list.add(readCount);
		}
		if (StringUtils.isNotEmpty(status)) {
			sql.append(" ,n.status = ? ");
			list.add(status);
		}
		if (StringUtils.isNotEmpty(orderby)) {
			sql.append(" ,n.orderby = ? ");
			list.add(orderby);
		}
		if (StringUtils.isNotEmpty(isSendAll)) {
			sql.append(" ,n.isSendAll = ? ");
			list.add(isSendAll);
		}
		sql.append(" where n.id = " + id);
		logger.info(sql.toString());
		return this.basalDao.runUSql(sql.toString(), list.toArray());
	}

	/**
	 * 根据部门id查询出用户名称和用户账号
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> usersByDeptId(String deptId) {
		String sql = " select IFNULL(u.id,concat('-',s.id)) id,IFNULL(u.name,'') name,s.name username,s.id staff_id from staff_info s ";
		sql += " left outer join user_info u on u.staff_id = s.id ";
		sql += " where s.department_id='" + deptId + "' ";
		sql += " and s.work_status not in('3','4')";
		sql += " and s.status='1' ";
		logger.info(sql.toString());
		return this.basalDao.queryList(sql, new Object[] {});
	}

	public Map<String, Object> get(String id) {
		StringBuffer sql = new StringBuffer("select o.*,s.name username from oa_notice_info o,user_info u ,staff_info s where  u.name=o.publisher and u.staff_id=s.id and o.id=?");
		Map<String, Object> map = this.basalDao.queryMap(sql.toString(), new Object[] { id });
		byte[] bytes = (byte[]) map.get("notice_content");
		String content = new String(bytes);
		map.put("notice_content", content);
		logger.info(sql.toString());
		return map;
	}

	public void addAccept(Integer noticeId, String[] userCheckBox) {
		// 1.删除原有的关系
		String sql1 = " delete from oa_notice_accept where notice_id = ? ";
		logger.info(sql1.toString());
		this.basalDao.runUSql(sql1, new Object[] { noticeId });
		// 2.添加新的关系
		String sql2 = "insert into oa_notice_accept(notice_id,accept_id,accept_obj)values(?,?,?)";
		List<Object[]> paramsList = new ArrayList<Object[]>();
		for (String userCheckObj : userCheckBox) {
			String[] userChecks = userCheckObj.split(":");
			Object[] params = new String[3];
			params[0] = noticeId.toString();
			params[1] = userChecks[0];
			params[2] = userChecks[2];
			paramsList.add(params);
		}
		logger.info(sql2.toString());
		this.basalDao.runUSqls(sql2, paramsList);
	}

	public void saveFile(Integer noticeId, String[] fileNames) {
		String sql1 = "delete from oa_notice_attachment where notice_id=?";
		logger.info(sql1.toString());
		this.basalDao.runUSql(sql1, new Object[] { noticeId });
		if (fileNames != null) {
			String sql2 = "insert into oa_notice_attachment(notice_id,atachment_name,atachment_path)values(?,?,?)";
			List<Object[]> paramsList = new ArrayList<Object[]>();
			for (String fileName : fileNames) {
				String[] files = fileName.split(":");
				Object[] params = new String[3];
				params[0] = noticeId.toString();
				params[1] = files[0];
				params[2] = files[1];
				paramsList.add(params);
			}
			logger.info(sql2.toString());
			this.basalDao.runUSqls(sql2, paramsList);
		}
	}

	public List<Map<String, Object>> findAccepts(String noticeId) {
		String sql = "select * from oa_notice_accept o where o.notice_id=?";
		logger.info(sql.toString());
		return this.basalDao.queryList(sql, new Object[] { noticeId });
	}

	public List<Map<String, Object>> findFiles(String noticeId) {
		String sql = "select * from oa_notice_attachment o where o.notice_id=?";
		logger.info(sql.toString());
		return this.basalDao.queryList(sql, new Object[] { noticeId });
	}

	public List<Map<String, Object>> findTops(Map<String, Object> curMap) {
		String sql = "select o.id,o.notice,o.orderby from oa_notice_info o where o.top = 1 and o.status in (1,2) and o.publisher=? order by o.orderby asc";
		logger.info(sql.toString());
		return this.basalDao.queryList(sql, new Object[] { curMap.get("name") });
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}
}
