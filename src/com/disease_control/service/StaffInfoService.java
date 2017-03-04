package com.disease_control.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.omg.CORBA.DATA_CONVERSION;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.disease_control.core.page.Page;
import com.disease_control.db.dao.BasalDao;
import com.disease_control.web.form.StaffInfo;
import com.yakov.utils.DateUtil;
import com.yakov.utils.JsonUtil;

/**
 * 处理员工业务
 * 
 * @author
 * 
 */
public class StaffInfoService {
	/**
	 * 根据部门ID，查询部门下的员工的列表
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @param departmentId
	 * @return
	 */
	public Page list(int pageIndex, int pageSize, int departmentId, String name, String sexy, int education, int positionId, int workStatus, String sidx, String sord, Date startTime, Date endTime,
			int zcId, int zcjbId, int zzmmId, int startAge, int endAge) {
		StringBuffer sql = new StringBuffer("select si.*,dzi.name as zcName,dzci.name as zcjbName,zzmm.name as zzmmName,ui.name as user_name,dws.name as work_status,");
		sql.append("substring(IFNULL(ui.name,'cdc1000000'),4)+0 as user_index,di.id as department_id, di.name as department_name,pi.id as position_id,pi.name as position_name,IF(index_num=0,10000,index_num) as index_num1");
		sql.append(" from staff_info as si left join user_info as ui on ui.staff_id=si.id");
		sql.append(" left join department_info as di on si.department_id=di.id and di.status=1");
		sql.append(" left join position_info as pi on si.position_id=pi.id and pi.status=1");
		sql.append(" left join data_work_status as dws on dws.id=si.work_status");
		sql.append(" left join data_zc_info as dzi on si.zc_id=dzi.id");
		sql.append(" left join data_zcjb_info as dzci on si.zcjb_id=dzci.id");
		sql.append(" left join data_zzmm_info as zzmm on si.zzmm_id=zzmm.id where si.status=1");
		ArrayList paramList = new ArrayList();
		if (startAge != 0) {
			sql.append(" and si.age>=?");
			paramList.add(startAge);
		}
		if (endAge != 0) {
			sql.append(" and si.age<=?");
			paramList.add(endAge);
		}
		if (departmentId != 0) {
			sql.append(" and si.department_id=?");
			paramList.add(departmentId);
		}
		if (positionId != 0) {
			sql.append(" and si.position_id=?");
			paramList.add(positionId);
		}
		if (education != 0) {
			sql.append(" and si.education=?");
			paramList.add(education);
		}
		if (workStatus != 0) {
			sql.append(" and si.work_status=?");
			paramList.add(workStatus);
		}
		if (sexy != null && !" ".equals(sexy)) {
			sql.append(" and si.sex=?");
			paramList.add(Integer.parseInt(sexy));
		}
		if (name != null && !"".equals(name)) {
			sql.append(" and si.name like ?");
			paramList.add("%" + name + "%");
		}
		if (startTime != null) {
			sql.append(" and si.enter_time>=?");
			paramList.add(startTime);
		}
		if (endTime != null) {
			sql.append(" and si.enter_time<=?");
			paramList.add(endTime);
		}
		if (zcId != 0) {
			sql.append(" and si.zc_id=?");
			paramList.add(zcId);
		}
		if (zcjbId != 0) {
			sql.append(" and si.zcjb_id=?");
			paramList.add(zcjbId);
		}
		if (zzmmId != 0) {
			sql.append(" and si.zzmm_id=?");
			paramList.add(zzmmId);
		}
		if (sidx != null && !"".equals(sidx) && sord != null && !"".equals(sord)) {
			sql.append(" order by " + sidx + " " + sord);
		} else {
			sql.append(" order by ui.name desc");
		}
		Object[] params = new Object[paramList.size()];
		for (int i = 0; i < paramList.size(); i++) {
			params[i] = paramList.get(i);
		}
		return basalDao.pagedQuery_mysql_sql(sql.toString(), pageIndex, pageSize, params);
	}

	/**
	 * 添加员工信息
	 * 
	 * @param staffInfo
	 * @param userName
	 * @param userId
	 * @return
	 */
	public int add(StaffInfo staffInfo) {
		String sql = "insert into staff_info (name,department_id,position_id,id_num,sex,birth_date,age,education,political_landscape,address,email,landline,zip_code,phone,enter_time,insert_time,status,work_status,index_num,mz_id,zc_id,zcjb_id,zzmm_id,whcd_id,zc_time) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),1,?,?,?,?,?,?,?,?)";
		// int resultInt = basalDao.runUSql(
		// sql,
		// new Object[] { staffInfo.getName(), staffInfo.getDepartmentId(),
		// staffInfo.getPositionId(), staffInfo.getIdNum(), staffInfo.getSex(),
		// staffInfo.getBirthDate(), staffInfo.getAge(),
		// staffInfo.getEducation(), staffInfo.getPoliticalLandscape(),
		// staffInfo.getAddress(), staffInfo.getEmail(),
		// staffInfo.getLandLine(), staffInfo.getZipCode(),
		// staffInfo.getPhone(), staffInfo.getEnterTime(),
		// staffInfo.getWorkStatus(), staffInfo.getIndexNum(),
		// staffInfo.getMzId(), staffInfo.getZcId(), staffInfo.getZcjbId(),
		// staffInfo.getZzmmId(), staffInfo.getWhcdId(), staffInfo.getZcTime()
		// });
		//
		Long id = this.basalDao.insertAndGetKey(sql, staffInfo.getName(), staffInfo.getDepartmentId(), staffInfo.getPositionId(), staffInfo.getIdNum(), staffInfo.getSex(), staffInfo.getBirthDate(),
				staffInfo.getAge(), staffInfo.getEducation(), staffInfo.getPoliticalLandscape(), staffInfo.getAddress(), staffInfo.getEmail(), staffInfo.getLandLine(), staffInfo.getZipCode(),
				staffInfo.getPhone(), staffInfo.getEnterTime(), staffInfo.getWorkStatus(), staffInfo.getIndexNum(), staffInfo.getMzId(), staffInfo.getZcId(), staffInfo.getZcjbId(),
				staffInfo.getZzmmId(), staffInfo.getWhcdId(), staffInfo.getZcTime());
		// initZtZaiGang(id.intValue(), staffInfo.getDepartmentId());//初始化在岗状态
		// 在岗内容的信息策略做了相关调整
		return id.intValue();
	}

	private static String zaigang_status = "1";// 在岗状态值
	private static boolean bypassWeekend = true;// 绕开双休

	/**
	 * 初始化，新添加人员的在岗状态
	 */
	protected void initZtZaiGang(int staffid, int departmentId) {
		List<Map<String, Object>> timesModelList = glgnService.findTimesModels();// 时间模型
		// 准备需要初始化保存的数据参数
		Date curDate = new Date(System.currentTimeMillis());
		String curYear = new SimpleDateFormat("yyyy").format(curDate);
		String curMoh = new SimpleDateFormat("MM").format(curDate);
		SimpleDateFormat formatYMD = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(curDate);
		int curDay = calendar.get(Calendar.DAY_OF_MONTH);
		int day = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
		List<Map<String, Object>> weekEnds = glgnService.getWeekEndsByYearMoh(curYear, curMoh);// 查询出双休日日期
		List<Object[]> objsList = new ArrayList<Object[]>();
		// 月初到月末迭代
		for (int i = curDay; i <= day; i++) {
			String attendance_time = curYear + "-" + curMoh + "-" + (i < 10 ? "0" : "") + i;
			// 迭代时间段模型,是否绕开双休日
			if (bypassWeekend) {// 绕开双休日
				calendar.set(Integer.valueOf(curYear), Integer.valueOf(curMoh) - 1, i);
				String ymd = formatYMD.format(calendar.getTime());
				boolean isWeek = false;
				for (Map<String, Object> week : weekEnds) {
					if (ymd.equals(week.get("day_time"))) {// 判断是否为周末
						isWeek = true;
						break;
					}
				}
				if (isWeek)
					continue;
			}
			for (Map<String, Object> timesmodel : timesModelList) {
				Map<String, Object> info = new HashMap<String, Object>();
				String start_time = (String) timesmodel.get("start_time");

				if (StringUtils.isNotEmpty(start_time)) {
					String[] start_times = start_time.split(":");
					info.put("start_seconds", Integer.valueOf(start_times[0]) * 60 + Integer.valueOf(start_times[1]));
				}
				String end_time = (String) timesmodel.get("end_time");
				if (StringUtils.isNotEmpty(end_time)) {
					String[] end_times = end_time.split(":");
					info.put("end_seconds", Integer.valueOf(end_times[0]) * 60 + Integer.valueOf(end_times[1]));
				}
				info.put("name", timesmodel.get("model_name"));
				info.put("model_id", timesmodel.get("id"));
				info.put("order_num", timesmodel.get("type"));

				// 保存时间段表，并返回保存值的ID
				String sql4 = "insert into oa_times_detail(start_seconds,end_seconds,name,model_id,order_num)values(?,?,?,?,?)";
				Long detailId = this.basalDao.insertAndGetKey(sql4, info.get("start_seconds"), info.get("end_seconds"), info.get("name"), info.get("model_id"), info.get("order_num"));
				Object[] objs = { staffid, departmentId, zaigang_status, "1", attendance_time, detailId, "" };
				objsList.add(objs);
			}
			String sql5 = "insert into oa_attendance_info(staff_info_id,department_id,attendance_status,balance_status,attendance_time,times_detail_id,remarks)values(?,?,?,?,?,?,?)";
			this.basalDao.runUSqls(sql5, objsList);
		}
	}

	/**
	 * 获取员工信息 连表查出员工的部门和职位
	 * 
	 * @param id
	 * @return
	 */
	public Map get(int id) {
		String sql = "select si.*,mz.name as mzName,zc.name as zcName,zcjb.name as zcjbName,zzmm.name as zzmmName,whcd.name as whcdName,di.id as department_id,di.name as department_name,pi.id as position_id,pi.name as position_name from staff_info as si left join department_info as di on si.department_id=di.id left join position_info as pi on si.position_id=pi.id left join data_mz_info as mz on si.mz_id=mz.id left join data_zc_info as zc on si.zc_id=zc.id left join data_zcjb_info as zcjb on si.zcjb_id=zcjb.id left join data_zzmm_info as zzmm on si.zzmm_id=zzmm.id left join data_whcd_info as whcd on si.whcd_id=whcd.id where si.id=?";
		return basalDao.queryMap(sql, new Object[] { id });
	}

	/**
	 * 更改用户信息
	 * 
	 * @param staffInfo
	 * @return
	 */
	public int update(StaffInfo staffInfo) {
		String sql = "update staff_info set name=?,id_num=?,department_id=?,position_id=?,sex=?,birth_date=?,age=?,education=?,political_landscape=?,address=?,email=?,landline=?,zip_code=?,phone=?,enter_time=?,work_status=?,index_num=?,mz_id=?,zc_id=?,zcjb_id=?,zzmm_id=?,whcd_id=?,zc_time=? where id=?";
		int resultInt = basalDao.runUSql(
				sql,
				new Object[] { staffInfo.getName(), staffInfo.getIdNum(), staffInfo.getDepartmentId(), staffInfo.getPositionId(), staffInfo.getSex(), staffInfo.getBirthDate(), staffInfo.getAge(),
						staffInfo.getEducation(), staffInfo.getPoliticalLandscape(), staffInfo.getAddress(), staffInfo.getEmail(), staffInfo.getLandLine(), staffInfo.getZipCode(),
						staffInfo.getPhone(), staffInfo.getEnterTime(), staffInfo.getWorkStatus(), staffInfo.getIndexNum(), staffInfo.getMzId(), staffInfo.getZcId(), staffInfo.getZcjbId(),
						staffInfo.getZzmmId(), staffInfo.getWhcdId(), staffInfo.getZcTime(), staffInfo.getId() });

		// 修改人员时，同时修改考勤管理表和值班管理表中对于的部门
		String sql1 = "update oa_attendance_info oa set oa.department_id=? where oa.staff_info_id=? ";
		String sql2 = "update oa_onduty_info oa set oa.department_id=? where oa.staff_info_id=? ";
		basalDao.runUSql(sql1, new Object[] { staffInfo.getDepartmentId(), staffInfo.getId() });
		basalDao.runUSql(sql2, new Object[] { staffInfo.getDepartmentId(), staffInfo.getId() });
		return resultInt;
	}

	/**
	 * 查询所有在职的员工
	 * 
	 * @return
	 */
	public List list() {
		String sql = "select si.id as id,si.name as name,di.name as department_name from staff_info as si left join department_info as di on si.department_id=di.id left join position_info as pi on si.position_id=pi.id where si.status=1 order by si.index_num";
		return basalDao.queryList(sql, new Object[] {});
	}

	public List listByDzgzd() {
		String sql = "select si.id as id,si.name as name,di.name as department_name from staff_info as si left join department_info as di on si.department_id=di.id left join position_info as pi on si.position_id=pi.id where si.status=1 and si.index_num<>0 order by si.index_num";
		return basalDao.queryList(sql, new Object[] {});
	}

	/**
	 * 查出部门下的所有在职员工
	 * 
	 * @param departmentId
	 */
	public List list(int departmentId) {
		String sql = "select id,name from staff_info where status=1 and department_id=?";
		return basalDao.queryList(sql, new Object[] { departmentId });
	}

	/**
	 * 查出部门下的所有员工
	 * 
	 * @param departmentId
	 */
	public List listByUser(int departmentId) {
		String sql = "select si.id,si.name from staff_info as si left join user_info as ui on si.id=ui.staff_id where si.status=1 and si.department_id=? and ui.id is null";
		return basalDao.queryList(sql, new Object[] { departmentId });
	}

	/**
	 * 查询尚未创建用户的员工
	 * 
	 * @return
	 */
	public List listByUser() {
		String sql = "select si.id as id,si.name as name,di.name as departmentName from staff_info as si left join department_info as di on si.department_id=di.id left join user_info as ui on ui.staff_id=si.id where si.status=1 and si.work_status not in (3,4,7) and ui.id is null";
		return basalDao.queryList(sql, new Object[] {});
	}

	public List list(String credentialsName, int credentialsYear) {
		if (credentialsName == null || credentialsName.equals("")) {
			return list();
		}
		String credentialsDate = DateUtil.getDateFromTime((DateUtil.getNowTime() - 60 * 60 * 24 * 365 * credentialsYear) * 1000L, DateUtil.yyyy_MM_DD);
		String sql = "select si.id,si.name from staff_info as si left join credentials_info as ci on ci.staff_id=si.id where ci.credentials_date <= ? and ci.name like ?";
		return basalDao.queryList(sql, new Object[] { credentialsDate, "%" + credentialsName + "%" });
	}

	public void del(int id) {
		String sql = "update staff_info set status=0 where id=?";
		basalDao.runUSql(sql, new Object[] { id });
	}

	public void importIndexNum_Tx(List<String[]> indexNumList) {
		basalDao.runUSql("update staff_info set index_num=0", null);
		int _index = 1;
		for (String[] indexNum : indexNumList) {
			if (indexNum.length == 1 || indexNum[1] == null || "".equals(indexNum[1])) {
				String sql = "update staff_info set index_num=? where `name`=?";
				basalDao.runUSql(sql, new Object[] { _index, indexNum[0] });
			} else {
				String sql = "update staff_info as si inner join user_info as ui on si.id=ui.staff_id set si.index_num=? where ui.`name`=?";
				basalDao.runUSql(sql, new Object[] { _index, indexNum[1] });
			}
			_index++;
		}
	}

	private BasalDao basalDao;
	private GlgnService glgnService;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

	public void setGlgnService(GlgnService glgnService) {
		this.glgnService = glgnService;
	}
}
