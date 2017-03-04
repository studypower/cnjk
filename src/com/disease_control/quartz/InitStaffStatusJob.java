package com.disease_control.quartz;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.disease_control.db.dao.BasalDao;
import com.disease_control.service.GlgnService;

/**
 * 每天定时检查人员工作状态是否初始化，如果没有初始化，将初始化相关任务
 */
@SuppressWarnings("unchecked")
public class InitStaffStatusJob extends QuartzJobBean {

	private static Logger logger = Logger.getLogger(InitStaffStatusJob.class.getName());

	private static String task_type = "1";// 在岗初始化任务类型标识

	private static String zaigang_status = "1";// 在岗状态值

	private static boolean bypassWeekend = true;// 绕开双休

	private static boolean execed = true;// 任务执行是否已经结束

	/**
	 * 修改
	 */
	@Override
	protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException {

		if (!execed) {
			logger.info("在岗状态任务正在执行中......，不能允许两个任务同时执行。");
			return;
		}
		try {
			execed = false;// =false表示任务正在执行
			// 1:查询最近的执行日期
			String sql1 = "select max(execute_time) execute_time from oa_job_history where task_type=?  ";
			Map<String, Object> execute_timeMap = this.basalDao.queryMap(sql1, new Object[] { task_type });
			Date execute_time = null;
			if (null != execute_timeMap && !execute_timeMap.isEmpty())
				execute_time = (Date) execute_timeMap.get("execute_time");
			DateFormat format = new SimpleDateFormat("yyyyMMdd");
			// 2:判断是否本日执行过
			if (null == execute_time || Integer.valueOf(format.format(execute_time)) < Integer.valueOf(format.format(new Date()))) {
				// 3:如果 没有执行则必须执行初始化状态
				logger.info("进入今日人员在岗状态初始化代码块");
				String sql2 = "select id,department_id,name staffName from staff_info where status=1";
				List<Map<String, Object>> staffInfoList = this.basalDao.queryList(sql2, new Object[] {});
				List<Map<String, Object>> timesModelList = glgnService.findTimesModels();// 时间模型
				// 准备需要初始化保存的数据参数
				Date curDate = new Date(System.currentTimeMillis());
				SimpleDateFormat formatYMD = new SimpleDateFormat("yyyy-MM-dd");
				String attendance_time = formatYMD.format(new Date(System.currentTimeMillis())); // 今天时间
																									// //
																									// -
																									// 24
																									// *
																									// 60
																									// *
																									// 60
																									// *
																									// 1000
				Boolean isWeekEnds = glgnService.isWeekEndByTime(attendance_time);// 是否为双休日
				Boolean GoTo = true;
				if (bypassWeekend) {
					if (isWeekEnds) {// 周末
						GoTo = false;
						logger.info("进入周末，不初始化");
					}
				}
				if (GoTo) {// 可以继续
					for (Map<String, Object> staff : staffInfoList) {
						List<Object[]> objsList = new ArrayList<Object[]>();
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
							// 判断该人员是否在今天此时具有状态内容，如果有内容将不进行动态设置
							String sql_ = " select count(*) count from oa_attendance_info i,oa_times_detail d  where i.times_detail_id = d.id and d.order_num = ? ";
							sql_ += " and i.is_delete = '0' and date_format(i.attendance_time,'%Y-%m-%d') =? and i.staff_info_id = ? ";
							if (this.basalDao.queryInt(sql_, new Object[] { timesmodel.get("type"), attendance_time, staff.get("id") }) == 0) {
								logger.info("设置'" + staff.get("staffName") + "' 的“在岗”状态");
								// 保存时间段表，并返回保存值的ID
								String sql4 = "insert into oa_times_detail(start_seconds,end_seconds,name,model_id,order_num)values(?,?,?,?,?)";
								Long detailId = this.basalDao.insertAndGetKey(sql4, info.get("start_seconds"), info.get("end_seconds"), info.get("name"), info.get("model_id"), info.get("order_num"));
								Object[] objs = { staff.get("id"), staff.get("department_id"), zaigang_status, "1", attendance_time, detailId, "" };
								objsList.add(objs);
							} else {
								logger.info(timesmodel.get("type") + " | " + staff.get("staffName") + "'已存在状态值，无须设置默认“在岗”值");
							}
						}
						String sql5 = "insert into oa_attendance_info(staff_info_id,department_id,attendance_status,balance_status,attendance_time,times_detail_id,remarks)values(?,?,?,?,?,?,?)";
						this.basalDao.runUSqls(sql5, objsList);
					}
				}
				// 4:执行完成后，插入最新的执行日期
				String sql6 = "insert into oa_job_history(task_type,execute_time,remark)values(?,?,?)";
				this.basalDao.runUSql(sql6, new Object[] { task_type, curDate, "人员在岗状态初始化" });
				logger.info("今日人员在岗状态初始化完成");
			} else {
				logger.info("今日人员在岗状态初始化已经处理过，无需初始化。");
			}
			System.out.println("out:" + System.currentTimeMillis()); 
		} catch (Exception e) {
			logger.info("初始化在岗状态异常", e);
		} finally {
			execed = true;// 表示任务执行结束
		}
	}

	private GlgnService glgnService;
	private BasalDao basalDao;

	public void setBasalDao(BasalDao basalDao) {
		this.basalDao = basalDao;
	}

	public void setGlgnService(GlgnService glgnService) {
		this.glgnService = glgnService;
	}

}
