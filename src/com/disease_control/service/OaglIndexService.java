package com.disease_control.service;

import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;

@SuppressWarnings("unchecked")
public class OaglIndexService {

	/**
	 * 车辆申请个数 isApply：是否具有审批权限，如果isApply=true则查询待审批车辆数据
	 */
	public Integer carUseCount(Integer staffId, boolean isApply) {
		// 我申请的车辆，通过或驳回后没有读取个数
		String sql = "select count(1) count from car_use_apply cua where cua.audit_staff_id =0 and cua.status in (1,-1) and cua.is_read = '0' and cua.apply_staff_id =? ";
		int count = basalDao.queryInt(sql, new Object[] { staffId });
		if (isApply) {
			String sql2 = "select count(1) count from car_use_apply cua where cua.audit_staff_id is null and cua.status ='0' ";
			count += basalDao.queryInt(sql2, new Object[] {});
		}
		return count;
	}

	/**
	 * 供应商管理
	 */
	public Integer gysxxCount() {
		String sql = "select count(*) count from supplier_info as si left join data_supplier_type as st on st.id = si. type where si.complex_level = '3'";
		return basalDao.queryInt(sql, new Object[] {});
	}

	/**
	 * 会议室申请个数
	 */
	public Integer roomCount(Integer staffId, boolean isApply) {
		// 我申请的会议室，通过或驳回后没有读取个数
		String sql = "select count(1) count from meeting_room_apply cua where cua.audit_staff_id =0 and cua.status in (1,-1) and cua.is_read = '0' and cua.apply_staff_id =? ";
		int count = basalDao.queryInt(sql, new Object[] { staffId });
		if (isApply) {
			String sql2 = "select count(1) count from meeting_room_apply cua where cua.audit_staff_id is null and cua.status ='0' ";
			count += basalDao.queryInt(sql2, new Object[] {});
		}
		return count;
	}

	/**
	 * 固定资产待处理个数
	 */
	public Integer gdzcCount(Integer deptid) {
		StringBuffer sql = new StringBuffer();
		sql.append(" select ");
		sql.append(" count(*) count ");
		sql.append(" from ");
		sql.append(" purchase_order as po ");
		sql.append(" inner join funds_apply_info as fai on fai.id = po.funds_apply_id ");
		sql.append(" inner join department_info as di on fai.apply_department_id = di.id ");
		sql.append(" and di. status = 1 ");
		sql.append(" left join ( ");
		sql.append(" select ");
		sql.append(" group_concat(fase. name) as entrynames, ");
		sql.append(" poe.order_id ");
		sql.append(" from ");
		sql.append(" purchase_order_entry as poe ");
		sql.append(" inner join funds_apply_stock_entry as fase on fase.id = poe.funds_apply_entry_id ");
		sql.append(" group by ");
		sql.append(" poe.order_id ");
		sql.append(" ) as poe on poe.order_id = po.id ");
		sql.append(" inner join staff_info as si on fai.apply_staff_id = si.id ");
		sql.append(" where ");
		sql.append(" 1 = 1 ");
		sql.append(" and po.step >= ? ");
		sql.append(" and po.status = '0' ");
		return basalDao.queryInt(sql.toString(), new Object[] { deptid });
	}

	/**
	 * 待处理的经费
	 */
	public Integer jfclCount(Integer staffid) {
		String sql = "select count(*) count from funds_apply_info as fai where fai.status = 0 and fai.step = 0 and fai.apply_staff_id = ? ";
		return basalDao.queryInt(sql.toString(), new Object[] { staffid });
	}

	/**
	 * 当前用户的工作单信息
	 */
	public Integer dzgzdCount(Integer staffid) {
		String sql = "select count(*) count from payroll_entry as pe where pe.staff_id = ? and pe.release_status = 1 and pe.read_status=0 ";
		return basalDao.queryInt(sql, new Object[] { staffid });
	}

	/**
	 * 物品采购待处理数量
	 */
	public Integer wpcgCount() {
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) count from purchase_order as po");
		sql.append(" inner join funds_apply_info as fai on fai.id = po.funds_apply_id");
		sql.append(" inner join department_info as di on fai.apply_department_id = di.id and di.status = 1");
		sql.append(" left join (select group_concat(fase.name) as entrynames, poe.order_id ");
		sql.append(" from purchase_order_entry as poe ");
		sql.append(" inner join funds_apply_stock_entry as fase on fase.id = poe.funds_apply_entry_id");
		sql.append(" group by poe.order_id) as poe on poe.order_id = po.id");
		sql.append(" inner join staff_info as si on fai.apply_staff_id = si.id");
		return basalDao.queryInt(sql.toString(), new Object[] {});
	}

	/**
	 * 人员管理
	 */
	public Integer ryglCount() {
		String sql = "select count(*) from staff_info as si where si.status = 1 ";
		return basalDao.queryInt(sql.toString(), new Object[] {});
	}

	/**
	 * 通知公告信息,根据当前登录人的id来查询通知公告信息
	 */
	public Page tzggShow(Integer userid, Integer pageIndex, Integer pageSize) {
		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT ");
		sql.append(" oa.id, ");
		sql.append(" oa.notice, ");
		sql.append(" oa.top, ");
		sql.append(" s. NAME publisher, ");
		sql.append(" date_format(oa.publish_date, '%Y-%m-%d') publish_date, ");
		sql.append(" ot.accept_id, ");
		sql.append(" oa.isSendAll ");
		sql.append(" FROM ");
		sql.append(" oa_notice_info oa ");
		sql.append(" left outer join oa_notice_accept ot on  ot.notice_id = oa.id AND ot.accept_id =?, ");
		sql.append(" user_info u, ");
		sql.append(" staff_info s ");
		sql.append(" WHERE ");
		sql.append(" 1 = 1 ");
		sql.append(" AND u. NAME = oa.publisher ");
		sql.append(" AND s.id = u.staff_id ");
		sql.append(" AND oa. STATUS = '1' ");
		sql.append(" AND ((oa.isSendAll='0' and ot.accept_id is not null) or (oa.isSendAll='1' and ot.accept_id is null)) ");
		sql.append(" ORDER BY ");
		sql.append(" oa.top DESC, ");
		sql.append(" oa.orderby ASC, ");
		sql.append(" oa.id DESC ");
		Page page = basalDao.pagedQuery_mysql_sql(sql.toString(), pageIndex, pageSize, new Object[] { userid });
		return page;
	}

	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}
}
