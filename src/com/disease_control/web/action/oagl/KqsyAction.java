package com.disease_control.web.action.oagl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.disease_control.core.config.SystemConfig;
import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.DepartmentInfoService;
import com.disease_control.service.GlgnService;
import com.disease_control.service.KqsyService;
import com.disease_control.service.OASysDictService;
import com.disease_control.service.TzggService;
import com.disease_control.web.form.TzZhcxForm;
import com.disease_control.web.form.TzggForm;
import com.yakov.utils.JsonUtil;
import com.yakov.utils.RoleTools;

/**
 * 考勤首页
 */
public class KqsyAction extends BaseAction<TzggForm> {
	// 进入考勤首页内容
	public String kqsy() {
		initRequest();
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		List<Map> deptList = null;
		deptList = departmentInfoService.list();
		List<Map> deptkqsyList = departmentInfoService.kqsyList();
		for (Map map : deptList) {
			List<Map<String, Object>> userList = tzggService.usersByDeptId("" + map.get("id"));
			map.put("userList", userList);
			map.put("usersize", userList != null ? userList.size() : 0);
		}
		List<Map<String, Object>> timesModelList = glgnService.findTimesModels();// 时间模型
		Integer timesModelsValue = 0;
		if (timesModelList != null && timesModelList.size() > 0) {
			timesModelsValue = (Integer) timesModelList.get(0).get("id");
		}
		DateFormat formatHH = new SimpleDateFormat("HH");
		DateFormat formatmm = new SimpleDateFormat("mm");
		int curHH = Integer.parseInt(formatHH.format(new Date()));
		int curmm = Integer.parseInt(formatmm.format(new Date()));
		int curHM = curHH * 60 + curmm;
		for (Map<String, Object> map : timesModelList) {
			String startTime = (String) map.get("start_time");
			String[] startTimes = startTime.split(":");
			int sh = Integer.parseInt(startTimes[0]);
			int sm = Integer.parseInt(startTimes[1]);
			int shm = sh * 60 + sm;
			if (curHM > shm) {
				timesModelsValue = (Integer) map.get("id");
			}
		}
		request.setAttribute("timesModelsValue", timesModelsValue);
		request.setAttribute("today", format1.format(new Date()));
		request.setAttribute("deptList", deptList);
		request.setAttribute("deptkqsyList", deptkqsyList);
		this.request.setAttribute("timesModelList", timesModelList);
		return SUCCESS;
	}

	public void kqList() {
		initRequest();
		TzggForm form = getForm();
		String staffid = this.request.getParameter("staffid");
		String attendance_status = this.request.getParameter("attendance_status");
		String riqi = this.request.getParameter("riqi");
		String timeModelId = this.request.getParameter("timeModelId");
		Page page = kqsyService.ztZhList(form.getPageIndex(), form.getPageSize(), staffid, attendance_status, timeModelId, riqi);
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	/**
	 * 根据部门查询出状态列表
	 */
	public void cxztListByDept() {

	}

	/**
	 * 考勤首页的状态查询 根据部门查询出在岗 外出 请假
	 */
	public void kqsyZtcx() {
		initRequest();
		String staffid = this.request.getParameter("staffid");
		String attendance_status = this.request.getParameter("attendance_status");
		String riqi = this.request.getParameter("riqi");
		String timeModelId = this.request.getParameter("timeModelId");
		List<Map<String, Object>> list = kqsyService.kqsyZtcx(staffid, attendance_status, timeModelId, riqi);
		getPrintWriter().print(JsonUtil.listToJsonStr(list));
	}

	/**
	 * 考勤首页所有内容中表格内的内容查询
	 */
	public void kqsysy() {
		initRequest();
		String riqi = this.request.getParameter("riqi");
		String deptid = this.request.getParameter("deptid");
		String timeModelId = this.request.getParameter("timeModelId");
		List<Map<String, Object>> list = kqsyService.kqsysy(riqi, timeModelId, deptid);
		getPrintWriter().print(JsonUtil.listToJsonStr(list));
	}

	public void kqsyInfo() {
		initRequest();
		String riqi = this.request.getParameter("riqi");
		String deptid = this.request.getParameter("deptid");
		String timeModelId = this.request.getParameter("timeModelId");
		String staffId = this.request.getParameter("staffId");
		Map<String, Object> map = kqsyService.kqsyInfo(riqi, timeModelId, deptid, staffId);
		getPrintWriter().print(JsonUtil.ObjToJsonStr(map));
	}

	public void kqsyContent() {
		initRequest();
		String riqi = this.request.getParameter("riqi");
		String deptid = this.request.getParameter("deptid");
		List<Map<String, Object>> dictList = oaSysDictService.findDictsAll("1");
		List<Object> list = kqsyService.kqsyContent(riqi, deptid);
		list.add(0, dictList);//第一行为状态列表
		getPrintWriter().print(JsonUtil.listToJsonStr(list));
	}

	private KqsyService kqsyService;
	private TzggService tzggService;
	private DepartmentInfoService departmentInfoService;
	private GlgnService glgnService;
	private OASysDictService oaSysDictService;

	public void setTzggService(TzggService tzggService) {
		this.tzggService = tzggService;
	}

	public void setKqsyService(KqsyService kqsyService) {
		this.kqsyService = kqsyService;
	}

	public void setDepartmentInfoService(DepartmentInfoService departmentInfoService) {
		this.departmentInfoService = departmentInfoService;
	}

	public void setGlgnService(GlgnService glgnService) {
		this.glgnService = glgnService;
	}

	public void setOaSysDictService(OASysDictService oaSysDictService) {
		this.oaSysDictService = oaSysDictService;
	}

}
