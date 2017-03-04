package com.disease_control.web.action.oagl;

import java.io.File;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jxl.Sheet;
import jxl.Workbook;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;
import org.apache.struts2.dispatcher.multipart.MultiPartRequestWrapper;

import com.disease_control.core.config.SystemConfig;
import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.core.status.BaseForm;
import com.disease_control.service.DepartmentInfoService;
import com.disease_control.service.GlgnService;
import com.disease_control.service.OASysDictService;
import com.disease_control.service.TzggService;
import com.disease_control.web.form.TzggForm;
import com.yakov.utils.JsonUtil;
import com.yakov.utils.RoleTools;

/**
 * OA管理- 管理功能
 */
@SuppressWarnings({ "rawtypes", "unchecked" })
public class GlgnAction extends BaseAction<TzggForm> {
	// 工作日管理
	public String gzrgl() {
		return SUCCESS;
	}

	/**
	 * 工作日设置
	 */
	public void daySettings() {
		initRequest();
		String status = this.request.getParameter("status");
		String day = this.request.getParameter("day");
		if (StringUtils.isNotEmpty(day)) {
			Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
			String[] days = day.split("\\|");
			glgnService.daySettings(days, status, currentUser);
			getPrintWriter().println("true");// 成功
		}
	}

	/**
	 * 根据年查询工作日信息
	 */
	public void findByYear() {
		initRequest();
		String year = this.request.getParameter("year");
		List<Map<String, Object>> list = glgnService.findByYear(year);
		getPrintWriter().println(JsonUtil.listToJsonStr(list));
	}

	/** 状态维护 *************************************/
	public String ztwh() {
		initRequest();
		String myStatus = this.request.getParameter("my");
		if (myStatus == null) {
			myStatus = "false";
		}
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		List<Map> deptList = null;
		if (!"search".equals(myStatus)&&RoleTools.isRole(currentUser, "10_2_3") && !"true".equals(myStatus)) {// 是否为科室管理员,如从考勤首页到日历阅览则加载所有人员信息myStatus=true表示使用日历阅览
			deptList = departmentInfoService.listById((Integer) currentUser.get("departmentId"));
		} else {
			deptList = departmentInfoService.list();
		}
		for (Map map : deptList) {
			List<Map<String, Object>> userList = tzggService.usersByDeptId("" + map.get("id"));
			map.put("userList", userList);
		}

		List<Map<String, Object>> dictList = oaSysDictService.findDicts("1");// 状态维护
		List<Map<String, Object>> timesModelList = glgnService.findTimesModels();// 时间模型

		if (this.request.getParameter("year") != null) {
			this.request.setAttribute("year", this.request.getParameter("year"));
			this.request.setAttribute("moh", this.request.getParameter("moh"));
			this.request.setAttribute("staffid_", this.request.getParameter("staffid"));
		}
		String forEdit = this.request.getParameter("forEdit");// true表示允许修改
		this.request.setAttribute("gotoType",  this.request.getParameter("gotoType"));
		this.request.setAttribute("forEdit", forEdit);// true表示允许修改
		this.request.setAttribute("myStatus", myStatus);// 我的状态
		this.request.setAttribute("deptList", deptList);
		this.request.setAttribute("dictList", dictList);
		this.request.setAttribute("timesModelList", timesModelList);
		return SUCCESS;
	}

	public void getEAndLastDay() {
		initRequest();
		String year = this.request.getParameter("year");
		String moh = this.request.getParameter("moh");
		Calendar cal = Calendar.getInstance();
		Integer mmoh = Integer.valueOf(moh) - 1;
		cal.set(Integer.valueOf(year), mmoh, 1);
		DateFormat format = new SimpleDateFormat("EEEE");// 获取第一天星期几
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("E", format.format(cal.getTime()));
		map.put("lastDay", cal.getActualMaximum(Calendar.DATE));// 这个月的最大一天
		List<Map<String, Object>> weekEnds = glgnService.getWeekEndsByYearMoh(year, (mmoh < 9 ? "0" : "") + (mmoh + 1));// 查询出双休日日期
		map.put("weekEnds", weekEnds);// 双休日日期
		getPrintWriter().println(JsonUtil.ObjToJsonStr(map));
	}

	/**
	 * 保存状态
	 * 
	 * @throws Exception
	 */
	DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");

	public void saveZt() throws Exception {
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		String id = this.request.getParameter("id");
		String staffid = this.request.getParameter("staffid");
		String deptid = this.request.getParameter("deptid");
		String status = this.request.getParameter("status");
		String riqi = this.request.getParameter("riqi");
		String timeModelId = this.request.getParameter("timeModelId");
		String remarks = this.request.getParameter("remarks");
		String timeModelName = this.request.getParameter("timeModelName");
		if (StringUtils.isEmpty(id)) {// 新增
			String riqi1 = this.request.getParameter("riqi1");
			String riqi2 = this.request.getParameter("riqi2");
			String timeModelId1 = this.request.getParameter("timeModelId1");
			String timeModelId2 = this.request.getParameter("timeModelId2");
			String timeModelName2 = this.request.getParameter("timeModelName2");
			List<Map<String, Object>> timesModelList = glgnService.findTimesModels();// 时间模型
			// 验证时间区间内的信息是否在数据库中存在重复
			Calendar cal = Calendar.getInstance();
			cal.setTime(DateUtils.parseDate(riqi1, new String[] { "yyyy-MM-dd" }));
			Date d2 = DateUtils.parseDate(riqi2, new String[] { "yyyy-MM-dd" });
			List<String> paramsList = new ArrayList<String>();
			boolean flag = false;
			while (cal.getTime().before(d2)) {
				String s = format1.format(cal.getTime());
				for (Map<String, Object> map : timesModelList) {
					String model_id = "" + map.get("id");
					String model_type = "" + map.get("type");
					String model_name = "" + map.get("model_name");
					if (!flag) {
						String modelids = model_id + "-" + model_type;
						flag = modelids.equals(timeModelId1);// 时间段判断
					}
					if (flag) {
						paramsList.add(s + ";" + model_id + "-" + model_type + ";" + model_name);
					}
				}
				cal.add(Calendar.DAY_OF_MONTH, 1);
			}

			if (!cal.getTime().before(d2) && cal.getTime().equals(d2)) {// 时间为同一天设置
				String s = format1.format(cal.getTime());
				for (Map<String, Object> map : timesModelList) {
					String model_id = "" + map.get("id");
					String model_type = "" + map.get("type");
					String model_name = "" + map.get("model_name");
					String modelids = model_id + "-" + model_type;
					if (!flag) {
						flag = modelids.equals(timeModelId1);// 其实段判断
					}
					if (flag) {
						paramsList.add(s + ";" + model_id + "-" + model_type + ";" + model_name);
					}
				}
			}
			// 去除尾部多余的计算
			for (;;) {// 结束段判断
				String p = paramsList.get(paramsList.size() - 1);
				if (p.equals(riqi2 + ";" + timeModelId2 + ";" + timeModelName2)) {
					break;
				}
				paramsList.remove(paramsList.size() - 1);
			}
			Boolean fz = true;
			// 清除时间段内的非值班状态的数据

			// glgnService.deleteZt(staffid, riqi1,
			// riqi2);//清除数据内容被转移到下面循环使用精确清除的方式来处理

			// 消除条件中双休日的数据，避免保存双休日内容
			List<Map<String, Object>> weekEnds = glgnService.getWeekEnds(riqi1, riqi2);// 查询出双休日日期

			for (String string : paramsList) {
				String[] s = string.split(";");
				boolean isWeek = false;
				for (Map<String, Object> map : weekEnds) {// 验证是否绕开周末
					if (s[0].equals(map.get("day_time"))) {
						isWeek = true;
						break;
					}
				}
				if (!isWeek) {
					int count = glgnService.valDataSaveZt(staffid, s[0], s[1]);// 该时间段内是否有值班数据
					if (count > 0) {
						fz = false;
					} else {
						glgnService.saveZt(status, s[0], s[1], s[2], remarks, staffid, deptid, "1", null, currentUser);
					}
				}
			}
			getPrintWriter().print(fz.toString());
		} else {// 修改
			String jiesuan = this.request.getParameter("jiesuan");
			glgnService.updZt(id, status, riqi, timeModelId, timeModelName, remarks, staffid, deptid, jiesuan, currentUser);
			getPrintWriter().println("true");
		}
	}

	/**
	 * 状态内容查询
	 */
	public void findZt() {
		initRequest();
		String staffid = this.request.getParameter("staffid");
		String deptid = this.request.getParameter("deptid");
		String year = this.request.getParameter("year");
		String moh = this.request.getParameter("moh");
		List<Map<String, Object>> list = glgnService.findZt(staffid, deptid, year, moh);
		getPrintWriter().println(JsonUtil.listToJsonStr(list));
	}

	public void getZt() {
		initRequest();
		String id = this.request.getParameter("id");
		Map<String, Object> map = glgnService.getZt(id);
		getPrintWriter().println(JsonUtil.ObjToJsonStr(map));
	}

	/**
	 * 值班名单维护
	 */
	public String zbmdwh() {
		initRequest();
		return SUCCESS;
	}

	/**
	 * 值班名单维护
	 */
	public String zhmdUpload() {
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		try {
			MultiPartRequestWrapper multiPartRequestWrapper = (MultiPartRequestWrapper) request;
			String fileType = multiPartRequestWrapper.getParameter("fileType");// 1:值班领导名单，2：听班小分队名单，3：总值班名单
			File[] files = multiPartRequestWrapper.getFiles("file");
			for (File file : files) {
				Workbook workbook = Workbook.getWorkbook(file);
				if (workbook != null) {
					Sheet sheet = workbook.getSheet(0);
					int rowCount = sheet.getRows();
					for (int j = 1; j < rowCount; j++) {
						if ("1".equals(fileType)) {
							String name = sheet.getCell(0, j).getContents();
							String username = sheet.getCell(1, j).getContents();
							String riqi = sheet.getCell(2, j).getContents();
							glgnService.saveZb(name, username, null, null, riqi, fileType, "", currentUser);// 领导值班
						} else if ("2".equals(fileType) || "3".equals(fileType)) {
							String name01 = sheet.getCell(0, j).getContents();
							String username01 = sheet.getCell(1, j).getContents();
							String name02 = sheet.getCell(2, j).getContents();
							String username02 = sheet.getCell(3, j).getContents();
							String riqi = sheet.getCell(4, j).getContents();
							glgnService.saveZb(name01, username01, name02, username02, riqi, fileType, "", currentUser);
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public void jisuanRiqi() throws ParseException {
		initRequest();
		String value = this.request.getParameter("value");// 计算时间值
		String day = this.request.getParameter("day");// 基础时间
		Calendar cal = Calendar.getInstance();
		if (StringUtils.isEmpty(day)) {
			cal.setTime(new Date());
		} else {
			cal.setTime(DateUtils.parseDate(day, new String[] { "yyyy-MM-dd" }));
		}
		cal.add(Calendar.DAY_OF_MONTH, new Integer(value));
		getPrintWriter().println(format1.format(cal.getTime()));
	}

	/**
	 * 值班日历维护
	 */
	public String zbrlwh() {
		initRequest();
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.MONTH, -1);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		String prevMoh = format1.format(cal.getTime());
		String toDay = format1.format(new Date());
		List<Map> deptList = departmentInfoService.list();
		for (Map map : deptList) {
			List<Map<String, Object>> userList = tzggService.usersByDeptId("" + map.get("id"));
			map.put("userList", userList);
		}

		this.request.setAttribute("method", this.request.getParameter("method"));
		this.request.setAttribute("preview", this.request.getParameter("preview"));
		this.request.setAttribute("toDay", toDay);
		this.request.setAttribute("prevMoh", prevMoh);
		this.request.setAttribute("deptList", deptList);
		return SUCCESS;
	}

	/**
	 * 查询值班列表内容
	 */
	public void findZbrl() {
		initRequest();
		String year = this.request.getParameter("year");
		String moh = this.request.getParameter("moh");
		List<Map<String, Object>> list = glgnService.findZbrl(year, moh);
		getPrintWriter().println(JsonUtil.listToJsonStr(list));
	}

	public void getZbrl() {
		initRequest();
		String id = this.request.getParameter("id");
		Map<String, Object> map = glgnService.getZbrl(id);
		getPrintWriter().println(JsonUtil.ObjToJsonStr(map));
	}

	/**
	 * 值班日历信息保存或修改
	 */
	public void saveZb() {
		initRequest();
		Map curUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		String id = this.request.getParameter("id");
		String staff_id = this.request.getParameter("staff_id");
		String department_id = this.request.getParameter("department_id");
		String riqi = this.request.getParameter("riqi");
		String remarks = this.request.getParameter("remarks");
		String dutyType = this.request.getParameter("dutyType");
		String jiesuanOptions = this.request.getParameter("jiesuanOptions");
		// 需要验证一下是否更改的值班人员，如果更改了值班人员，需要将之前的值班人员的日志状态切换掉
		if (StringUtils.isNotEmpty(id)) {
			Map<String, Object> map = glgnService.getZbrl(id);
			if (staff_id.equals("" + map.get("staff_info_id"))) {// 名字相同的情况下，只做修改操作
				glgnService.updZb_(id, department_id, "" + map.get("staff_info_id"), riqi, jiesuanOptions, remarks, curUser);
				getPrintWriter().print("true");
				return;// 直接修改掉数据，不做保存处理
			} else {// 在不相同的情况下，将之前的人员相关的记录删除掉
				glgnService.deleteZb_((Integer) map.get("staff_info_id"), riqi, dutyType, curUser);
			}
		} else {// 验证设置的值班人员，在指定的时间内是否在已经存在，如果已经存在将不允许添加该人员到该时间段中
			int count = this.glgnService.getCountByRiqiStaffid(riqi, staff_id);
			if (count > 0) {
				getPrintWriter().print("error1");// 设置的人员已经存在
				return;
			}
		}
		glgnService.saveZb_(Integer.valueOf(staff_id), Integer.valueOf(department_id), riqi, remarks, dutyType, jiesuanOptions, curUser);
		getPrintWriter().print("true");
	}

	/*************************************************/
	// 值班小组维护
	public String zbTeamBiz() {
		initRequest();
		List<Map> deptList = departmentInfoService.list();
		for (Map map : deptList) {
			List<Map<String, Object>> userList = tzggService.usersByDeptId("" + map.get("id"));
			map.put("userList", userList);
		}
		String dutyType = this.request.getParameter("dutyType");
		this.request.setAttribute("dutyType", dutyType);
		if ("1".equals(dutyType)) {
			List<Map<String, Object>> ondutyLeaderList = glgnService.zbTeamBizList("1");// 1:领导值班
			this.request.setAttribute("ondutyLeaderList", ondutyLeaderList);
		}
		if ("2".equals(dutyType)) {
			List<Map<String, Object>> ondutyTeamList = glgnService.zbTeamBizList("2");// 2:小分队听班
			this.request.setAttribute("ondutyTeamList", ondutyTeamList);
		}
		if ("3".equals(dutyType)) {
			List<Map<String, Object>> ondutyTotalList = glgnService.zbTeamBizList("3");// 3:总值班
			this.request.setAttribute("ondutyTotalList", ondutyTotalList);
		}
		this.request.setAttribute("departmentList", deptList);
		return SUCCESS;
	}

	// 保存或修改值班维护小组人员
	public void zbTeamSave() {
		initRequest();
		Map curUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		String id = this.request.getParameter("id");
		String staffid1 = this.request.getParameter("staffid1");
		String staffid2 = this.request.getParameter("staffid2");
		String order = this.request.getParameter("order");
		String ondutyType = this.request.getParameter("ondutyType");
		try {
			glgnService.saveZbTeamUpdOrAdd(id, staffid1, staffid2, ondutyType, order, curUser);
			getPrintWriter().print("true");
		} catch (Exception e) {
			e.printStackTrace();
			getPrintWriter().print("false");
		}
	}

	/**
	 * 启用禁用和删除操作
	 */
	public void zbTeamDelete() {
		initRequest();
		Map curUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		String id = this.request.getParameter("id");
		String is_Delete = this.request.getParameter("is_Delete");
		try {
			glgnService.zbTeamDelete(id, is_Delete, curUser);
			getPrintWriter().print("true");
		} catch (Exception e) {
			e.printStackTrace();
			getPrintWriter().print("false");
		}
	}

	public void batchUpdZbonDutyOrder() {
		initRequest();
		Map curUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		String data = this.request.getParameter("data");
		List<Object[]> paramList = new ArrayList<Object[]>();
		if (data != null) {
			String[] datas = data.split(";");
			for (String data_ : datas) {
				Object[] objs = new Object[3];
				String[] ds = data_.split("-");
				objs[0] = ds[1];
				objs[1] = curUser.get("name");
				objs[2] = ds[0];
				paramList.add(objs);
			}
			try {
				this.glgnService.batchUpdZbonDutyOrder(paramList);
				getPrintWriter().print("true");
			} catch (Exception e) {
				e.printStackTrace();
				getPrintWriter().print("false");
			}
		}
	}

	// 值班小组维护规则
	public String zbTeamBizRule() {
		initRequest();
		String dutyType = this.request.getParameter("dutyType");
		String minDate = format1.format(new Date(System.currentTimeMillis() + 24 * 60 * 60 * 1000));
		List<Map<String, Object>> zbTeamBizList = glgnService.zbTeamBizList(dutyType);
		this.request.setAttribute("minDate", minDate);
		this.request.setAttribute("dutyType", dutyType);
		this.request.setAttribute("zbTeamBizList", zbTeamBizList);
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.YEAR, +2);
		this.request.setAttribute("maxDate", format1.format(cal.getTime()));// 最大时间两个年后
		return SUCCESS;
	}

	// 值班小组维护规则的维护列表
	public void zbTeamBizRuleList() {
		initRequest();
		BaseForm form = getForm();
		String is_Enable = this.request.getParameter("is_Enable");
		String rule_type = this.request.getParameter("rule_type");
		Page page = glgnService.zbTeamBizRuleList(form.getPageIndex(), form.getPageSize(), is_Enable, rule_type);
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	/**
	 * 值班日历预览
	 */
	public String zbRiliPreview() {
		initRequest();
		List<Map> deptList = departmentInfoService.list();
		for (Map map : deptList) {
			List<Map<String, Object>> userList = tzggService.usersByDeptId("" + map.get("id"));
			map.put("userList", userList);
		}
		String toDay = format1.format(new Date());
		this.request.setAttribute("today", toDay);
		this.request.setAttribute("departmentList", deptList);
		return SUCCESS;
	}

	public void zbRiliPreviewData() {
		initRequest();
		String year = this.request.getParameter("year");
		String moh = this.request.getParameter("moh");
		List<Map<String, Object>> list = glgnService.zbTeamPreview(year, moh);
		getPrintWriter().println(JsonUtil.listToJsonStr(list));
	}

	public void zbRiliPreviewUpd() {
		initRequest();
		Map curUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		String id = this.request.getParameter("id");
		String onduty_type = this.request.getParameter("onduty_type");
		String field = this.request.getParameter("field");
		String staffId = this.request.getParameter("staffId");
		try {
			glgnService.zbRiliPreviewUpd(id, field, onduty_type, staffId, curUser);
			getPrintWriter().print("true");
		} catch (Exception e) {
			e.printStackTrace();
			getPrintWriter().print("false");
		}
	}

	/**
	 * 启用禁用和删除操作
	 */
	public void zbTeamRuleEnableAndDelete() {
		initRequest();
		Map curUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		String id = this.request.getParameter("id");
		String is_Enable = this.request.getParameter("is_Enable");
		String is_Delete = this.request.getParameter("is_Delete");
		String rule_type = this.request.getParameter("rule_type");
		try {
			glgnService.zbTeamRuleEnableAndDelete(id, is_Enable, is_Delete, rule_type, curUser);
			getPrintWriter().print("true");
		} catch (Exception e) {
			e.printStackTrace();
			getPrintWriter().print("false");
		}
	}

	// 保存或修改值班维护小组规则内容
	public void zbTeamBizRuleSave() {
		initRequest();
		Map curUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		String start_time = this.request.getParameter("start_time");
		String end_time = this.request.getParameter("end_time");
		String is_Enable = this.request.getParameter("is_Enable");
		String rule_type = this.request.getParameter("rule_type");
		String orderno_teamid = this.request.getParameter("orderno_teamid");
		try {
			end_time = "".equals(end_time) ? null : end_time;
			glgnService.saveZbTeamRuleAdd(start_time, end_time, is_Enable, rule_type, orderno_teamid, curUser);
			getPrintWriter().print("true");
		} catch (Exception e) {
			e.printStackTrace();
			getPrintWriter().print("false");
		}
	}

	/*************************************************/

	private GlgnService glgnService;
	private TzggService tzggService;
	private DepartmentInfoService departmentInfoService;
	private OASysDictService oaSysDictService;

	public void setOaSysDictService(OASysDictService oaSysDictService) {
		this.oaSysDictService = oaSysDictService;
	}

	public void setGlgnService(GlgnService glgnService) {
		this.glgnService = glgnService;
	}

	public void setTzggService(TzggService tzggService) {
		this.tzggService = tzggService;
	}

	public void setDepartmentInfoService(DepartmentInfoService departmentInfoService) {
		this.departmentInfoService = departmentInfoService;
	}
}
