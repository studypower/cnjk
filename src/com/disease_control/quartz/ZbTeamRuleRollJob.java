package com.disease_control.quartz;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.disease_control.db.dao.BasalDao;
import com.disease_control.service.GlgnService;

/**
 * 值班轮询操作类
 */
public class ZbTeamRuleRollJob extends QuartzJobBean {
	private static Logger logger = Logger.getLogger(ZbTeamRuleRollJob.class.getName());

	DateFormat formatYMD = new SimpleDateFormat("yyyyMMdd");
	DateFormat formatY_M_D = new SimpleDateFormat("yyyy-MM-dd");
	private static boolean execed = true;// 任务执行是否已经结束

	@Override
	protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException {
		if (!execed) {
			logger.info("值班任务正在执行中......，不能允许两个任务同时执行。");
			return;
		}
		try {
			execed = false;// =false表示任务正在执行
			zbSetting("1", "领导值班");
			zbSetting("2", "小分队听班");
			zbSetting("3", "总值班");
		} catch (Exception e) {
			logger.info("值班轮巡设置出现异常", e);
		} finally {
			execed = true;// 表示任务执行结束
		}
	}

	public void zbSetting(String onduty_type, String duty_type_name) {
		// 1:检查排班人员是否已经存在
		String sql1 = "select count(*) count from oa_onduty_info where is_delete='0'and date_format(on_duty_time,'%Y%m%d') = date_format(now(),'%Y%m%d') and on_duty_type=? ";
		int count1 = this.basalDao.queryInt(sql1, new Object[] { onduty_type });
		if (count1 == 0) {
			// 2:如果不存在，则进入查询上一次排班的规则
			String sql2 = "select last_team_orderno from oa_onduty_rule where is_delete='0' and is_enable='1' and date_format(end_time,'%Y-%m-%d')=? and rule_type=? ";
			Map<String, Object> last_team_ordernoMap = (Map<String, Object>) this.basalDao.queryMap(sql2, new Object[] { lastDayY_M_D(), onduty_type });// 昨天日期
			// 3:人为排班或自动排班，取出上一次的顺序号
			Integer last_team_orderno = -1;
			if (last_team_ordernoMap != null && !last_team_ordernoMap.isEmpty()) {
				last_team_orderno = (Integer) last_team_ordernoMap.get("last_team_orderno");
			} else {
				String sql3 = "select team_orderno from oa_onduty_histroy where date_format(exec_time,'%Y-%m-%d') =? and onduty_type = ? ";
				last_team_ordernoMap = (Map<String, Object>) this.basalDao.queryMap(sql3, new Object[] { lastDayY_M_D(), onduty_type });// 昨天日期
				if (last_team_ordernoMap != null && !last_team_ordernoMap.isEmpty()) {
					last_team_orderno = (Integer) last_team_ordernoMap.get("team_orderno");
				}
			}
			Map<String, Object> curZbTeamMap = null;
			List<Map<String, Object>> zbTeamBizList = glgnService.zbTeamBizList(onduty_type);
			if (zbTeamBizList != null && !zbTeamBizList.isEmpty()) {// 获得今日排班的人员数据
				if (last_team_orderno == -1) {
					curZbTeamMap = zbTeamBizList.get(0);
				} else {
					int j = last_team_orderno;
					int q = (Integer) zbTeamBizList.get(zbTeamBizList.size() - 1).get("onduty_order");
					A: while (j <= q) {
						int i = 0;
						int n = zbTeamBizList.size();
						while (i < n) {
							if ((Integer) zbTeamBizList.get(i).get("onduty_order") == j) {
								curZbTeamMap = zbTeamBizList.get(i++ >= (n - 1) ? 0 : i);
								break A;
							}
							i++;
						}
						j++;
						if (j == last_team_orderno)
							break;
						if (j > q) {
							j = 0;
						}
					}
				}

				if (curZbTeamMap != null) {
					// 保存值班人员
					saveZb("" + curZbTeamMap.get("onduty_staff1"), "" + curZbTeamMap.get("dept1"), formatY_M_D.format(new Date()), "" + curZbTeamMap.get("onduty_staff_type"), "3");// 默认值班费
					if (!"1".equals(("" + curZbTeamMap.get("onduty_staff_type")))) {
						saveZb("" + curZbTeamMap.get("onduty_staff2"), "" + curZbTeamMap.get("dept2"), formatY_M_D.format(new Date()), "" + curZbTeamMap.get("onduty_staff_type"), "3");// 默认值班费
					}
					// 写入值班日志中
					String sql6 = "insert into oa_onduty_histroy(team_orderno,onduty_type,exec_time)values(?,?,now())";
					this.basalDao.runUSql(sql6, new Object[] { curZbTeamMap.get("onduty_order"), curZbTeamMap.get("onduty_staff_type") });
					logger.info(duty_type_name + "，值班轮巡设置成功！");
				} else {
					logger.info(duty_type_name + "，没有找到下一组数据。。。。。。。。。。。。");
				}
			} else {
				logger.info(duty_type_name + "，没有值班名单数据，无法轮巡。");
			}
		} else {
			logger.info(duty_type_name + "，已经存在值班数据。");
		}
	}

	public void saveZb(String staff_id, String department_id, String riqi, String dutyType, String jiesuanOptions) {
		glgnService.saveZb_(Integer.valueOf(staff_id), Integer.valueOf(department_id), riqi, "", dutyType, jiesuanOptions, new HashMap<String, Object>());
	}

	public String lastDayY_M_D() {
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.DAY_OF_MONTH, -1);
		return formatY_M_D.format(cal.getTime());
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
