package com.disease_control.web.action.oagl;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import jxl.CellView;
import jxl.Workbook;
import jxl.WorkbookSettings;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.VerticalAlignment;
import jxl.write.Label;
import jxl.write.Number;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import com.disease_control.core.config.SystemConfig;
import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.DepartmentInfoService;
import com.disease_control.service.OASysDictService;
import com.disease_control.service.TzggService;
import com.disease_control.service.ZhcxService;
import com.disease_control.web.form.TzZhcxForm;
import com.yakov.utils.DateUtil;
import com.yakov.utils.JsonUtil;

/**
 * 综合查询
 */
@SuppressWarnings("unchecked")
public class ZhcxAction extends BaseAction<TzZhcxForm> {
	static DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");

	public String initList() {
		initRequest();
		List<Map> deptList = departmentInfoService.list();
		for (Map map : deptList) {
			List<Map<String, Object>> userList = tzggService.usersByDeptId("" + map.get("id"));
			map.put("userList", userList);
		}
		List<Map<String, Object>> dictList = oaSysDictService.findDicts("1");// 状态维护
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.MONTH, -1);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		String prevMoh = format1.format(cal.getTime());
		String toDay = format1.format(new Date());

		this.request.setAttribute("toDay", toDay);
		this.request.setAttribute("prevMoh", prevMoh);
		this.request.setAttribute("dictList", dictList);
		this.request.setAttribute("deptList", deptList);
		return SUCCESS;
	}

	public void list() {
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		TzZhcxForm form = getForm();
		String deptid = this.request.getParameter("deptid");
		String userid = this.request.getParameter("userid");
		String staffid = this.request.getParameter("staffid");
		String status = this.request.getParameter("status");
		String selectDay = this.request.getParameter("selectDay");
		String selectMoh = this.request.getParameter("selectMoh");
		String riqi_s = this.request.getParameter("riqi_s");
		String riqi_e = this.request.getParameter("riqi_e");
		String methodType = this.request.getParameter("methodType");
		if (!"exportData".equals(methodType)) {// 1:查询列表部分
			Page page = zhcxService.ztZhList(form.getPageIndex(), form.getPageSize(), deptid, userid, staffid, status, selectDay, selectMoh, riqi_s, riqi_e);
			HashMap jsonMap = new HashMap();
			jsonMap.put("total", page.getTotalPageCount());
			jsonMap.put("page", page.getCurrentPageNo());
			jsonMap.put("records", page.getTotalCount());
			jsonMap.put("rows", page.getResult());
			getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
		} else {// 2：导出内容部分
			Page page = zhcxService.ztZhList(1, Integer.MAX_VALUE, deptid, userid, staffid, status, selectDay, selectMoh, riqi_s, riqi_e);
			Object listObj = page.getResult();
			try {
				exportData(listObj);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void exportData(Object listObj) throws Exception {
		ArrayList<Map> list = (ArrayList) listObj;
		WorkbookSettings ws = new WorkbookSettings();
		this.response.setHeader("Content-disposition", "attachment;filename=statusSearchTable.xls");
		WritableWorkbook workbook = Workbook.createWorkbook(this.response.getOutputStream());
		ws.setLocale(new Locale("ZH", "China"));
		WritableSheet s1 = workbook.createSheet("Sheet1", 0);
		s1.addCell(new Label(0, 0, "状态综合查询导出表格"));
		String title = "序号,部门,姓名,日期,时间,状态,备注";
		String[] titleArray = title.split(",");
		for (int i = 0; i < titleArray.length; i++) {
			s1.addCell(new Label(i, 1, titleArray[i]));
		}
		for (int i = 2; i < list.size() + 2; i++) {
			s1.addCell(new Label(0, i, String.valueOf(i - 1)));
			Map obj = list.get(i - 2);
			s1.addCell(new Label(1, i, String.valueOf(obj.get("department_name"))));
			s1.addCell(new Label(2, i, String.valueOf(obj.get("staff_name"))));
			s1.addCell(new Label(3, i, String.valueOf(obj.get("attendance_time"))));
			s1.addCell(new Label(4, i, String.valueOf(obj.get("time_detail_name"))));
			s1.addCell(new Label(5, i, String.valueOf(obj.get("attendance_name"))));
			s1.addCell(new Label(6, i, String.valueOf(obj.get("remarks"))));
		}
		workbook.write();
		workbook.close();
	}

	/**
	 * 值班综合查询
	 */
	public String initZbList() {
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		List<Map> deptList = departmentInfoService.list();
		for (Map map : deptList) {
			List<Map<String, Object>> userList = tzggService.usersByDeptId("" + map.get("id"));
			map.put("userList", userList);
		}
		this.request.setAttribute("deptList", deptList);
		String toDay = format1.format(new Date());
		this.request.setAttribute("toDay", toDay);
		return SUCCESS;
	}

	/**
	 * 值班列表内容
	 */
	@SuppressWarnings("rawtypes")
	public void zbList() {
		initRequest();
		TzZhcxForm form = getForm();
		String deptid = this.request.getParameter("deptid");
		String userid = this.request.getParameter("userid");
		String staffid = this.request.getParameter("staffid");
		String status = this.request.getParameter("status");
		String riqi_s = this.request.getParameter("riqi_s");
		String riqi_e = this.request.getParameter("riqi_e");
		String methodType = this.request.getParameter("methodType");
		if (!"exportData".equals(methodType) && !"exportDataPiliang".equals(methodType)) {// 1:查询列表部分
			Page page = zhcxService.zbList(form.getPageIndex(), form.getPageSize(), deptid, userid, staffid, status, riqi_s, riqi_e);
			HashMap jsonMap = new HashMap();
			jsonMap.put("total", page.getTotalPageCount());
			jsonMap.put("page", page.getCurrentPageNo());
			jsonMap.put("records", page.getTotalCount());
			jsonMap.put("rows", page.getResult());
			getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
		} else if ("exportData".equals(methodType)) {// 2：导出内容部分
			Page page = zhcxService.zbList(1, Integer.MAX_VALUE, deptid, userid, staffid, status, riqi_s, riqi_e);
			String title = this.request.getParameter("title");
			if (StringUtils.isEmpty(title)) {
				title = "值班综合查询导出表格";
			} else if ("1".equals(title)) {
				title = "调休单统计列表";
			}
			Object listObj = page.getResult();
			try {
				exportDataZb(listObj, status, title);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("exportDataPiliang".equals(methodType)) {// 批量打印值班调休单
			String days = this.request.getParameter("days");
			String staff_names = this.request.getParameter("staff_names");
			try {
				printPiliang(staff_names, days);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void exportDataZb(Object listObj, String status, String titleName) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("1", "待确认");
		map.put("2", "调休");
		map.put("3", "值班费");
		ArrayList<Map> list = (ArrayList) listObj;
		WorkbookSettings ws = new WorkbookSettings();
		this.response.setHeader("Content-disposition", "attachment;filename=zhibanSearchTable.xls");
		WritableWorkbook workbook = Workbook.createWorkbook(this.response.getOutputStream());
		ws.setLocale(new Locale("ZH", "China"));
		WritableSheet s1 = workbook.createSheet("Sheet1", 0);
		s1.addCell(new Label(0, 0, titleName));

		String title = "序号,部门,姓名,日期,结算方式,调休天数,值班费,备注";
		if ("1".equals(status)) {
			title = "序号,部门,姓名,日期,结算方式,备注";
		} else if ("2".equals(status)) {
			title = "序号,部门,姓名,日期,结算方式,调休天数,备注";
		} else if ("3".equals(status)) {
			title = "序号,部门,姓名,日期,结算方式,值班费,备注";
		}

		String[] titleArray = title.split(",");
		for (int i = 0; i < titleArray.length; i++) {
			s1.addCell(new Label(i, 1, titleArray[i]));
		}

		for (int i = 2; i < list.size() + 2; i++) {
			s1.addCell(new Label(0, i, String.valueOf(i - 1)));
			Map obj = list.get(i - 2);
			s1.addCell(new Label(1, i, String.valueOf(obj.get("department_name"))));
			s1.addCell(new Label(2, i, String.valueOf(obj.get("staff_name"))));
			s1.addCell(new Label(3, i, String.valueOf(obj.get("on_duty_time"))));
			String dalance_status = String.valueOf(obj.get("dalance_status"));
			s1.addCell(new Label(4, i, map.get(String.valueOf(obj.get("dalance_status")))));
			if ("1".equals(status)) {
				s1.addCell(new Label(5, i, String.valueOf(obj.get("remarks"))));
			} else if ("2".equals(status)) {
				s1.addCell(new Label(5, i, String.valueOf(obj.get("jiesuantianshu"))));
				s1.addCell(new Label(6, i, String.valueOf(obj.get("remarks"))));
			} else if ("3".equals(status)) {
				s1.addCell(new Label(5, i, String.valueOf(obj.get("feiyong"))));
				s1.addCell(new Label(6, i, String.valueOf(obj.get("remarks"))));
			} else {
				if ("2".equals(dalance_status)) {
					s1.addCell(new Label(5, i, String.valueOf(obj.get("jiesuantianshu"))));
				} else {
					s1.addCell(new Label(5, i, ""));
				}
				if ("3".equals(dalance_status)) {
					s1.addCell(new Label(6, i, String.valueOf(obj.get("feiyong"))));
				} else {
					s1.addCell(new Label(6, i, ""));
				}
				s1.addCell(new Label(7, i, String.valueOf(obj.get("remarks"))));
			}

		}
		workbook.write();
		workbook.close();
	}

	public String initTxdtjList() {
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.MONTH, -1);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		String prevMoh = format1.format(cal.getTime());
		
		int day =cal.getActualMaximum(Calendar.DAY_OF_MONTH); 
		cal.set(Calendar.DAY_OF_MONTH, day);
		String endDay = format1.format(cal.getTime());

		this.request.setAttribute("toDay", endDay);
		this.request.setAttribute("prevMoh", prevMoh);
		return SUCCESS;
	}

	/**
	 * 值班费统计
	 */
	public String initZbftj() {
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.MONTH, -1);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		String prevMoh = format1.format(cal.getTime());
		
		int day =cal.getActualMaximum(Calendar.DAY_OF_MONTH); 
		cal.set(Calendar.DAY_OF_MONTH, day);
		String endDay = format1.format(cal.getTime());

		this.request.setAttribute("toDay", endDay);
		this.request.setAttribute("prevMoh", prevMoh);
		return SUCCESS;
	}

	public void zbftj() {
		initRequest();
		TzZhcxForm form = getForm();
		String riqi_s = this.request.getParameter("riqi_s");
		String riqi_e = this.request.getParameter("riqi_e");
		String methodType = this.request.getParameter("methodType");
		String status = this.request.getParameter("status");
		if (!"exportData".equals(methodType)) {// 1:查询列表部分
			Page page = zhcxService.zbftjList(form.getPageIndex(), form.getPageSize(), riqi_s, riqi_e, null, null,status);
			HashMap jsonMap = new HashMap();
			jsonMap.put("total", page.getTotalPageCount());
			jsonMap.put("page", page.getCurrentPageNo());
			jsonMap.put("records", page.getTotalCount());
			jsonMap.put("rows", page.getResult());
			getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
		} else {// 导出表格
			Page page = zhcxService.zbftjList(1, Integer.MAX_VALUE, riqi_s, riqi_e, null, null,status);
			Object listObj = page.getResult();
			try {
				exportData_zbftj(listObj);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 我的状态，值班费描述
	 */
	public void myStatusZbfInfo() {
		super.initRequest();
		String year = this.request.getParameter("year");
		String moh = this.request.getParameter("moh");
		String staffid = this.request.getParameter("staffid");
		Map<String, Object> map = zhcxService.myStatusZbfInfo(staffid, year + "-" + moh);
		getPrintWriter().println(JsonUtil.ObjToJsonStr(map));
	}

	public void exportData_zbftj(Object listObj) throws Exception {
		ArrayList<Map> list = (ArrayList) listObj;
		WorkbookSettings ws = new WorkbookSettings();
		this.response.setHeader("Content-disposition", "attachment;filename=zhibanfeitongjiTable.xls");
		WritableWorkbook workbook = Workbook.createWorkbook(this.response.getOutputStream());
		ws.setLocale(new Locale("ZH", "China"));
		WritableSheet s1 = workbook.createSheet("Sheet1", 0);
		s1.addCell(new Label(0, 0, ""));
		String title = "序号,编号,姓名,工作日天数,双休日天数,三薪日天数,合计系数,基数,合计饭贴,小计";
		String[] titleArray = title.split(",");
		for (int i = 0; i < titleArray.length; i++) {
			s1.addCell(new Label(i, 1, titleArray[i]));
		}
		for (int i = 2; i < list.size() + 2; i++) {
			s1.addCell(new Label(0, i, String.valueOf(i - 1)));
			Map obj = list.get(i - 2);
			s1.addCell(new Label(1, i, String.valueOf(obj.get("user_code"))));
			s1.addCell(new Label(2, i, String.valueOf(obj.get("user_name"))));
			s1.addCell(new Label(3, i, String.valueOf(obj.get("status2"))));
			s1.addCell(new Label(4, i, String.valueOf(obj.get("status1"))));
			s1.addCell(new Label(5, i, String.valueOf(obj.get("status3"))));
			s1.addCell(new Label(6, i, String.valueOf(obj.get("sumXiShu"))));
			s1.addCell(new Label(7, i, String.valueOf(obj.get("baseShu"))));
			s1.addCell(new Label(8, i, String.valueOf(obj.get("sumFanTie"))));
			s1.addCell(new Label(9, i, String.valueOf(obj.get("sum"))));
		}
		workbook.write();
		workbook.close();
	}

	public void printPiliang(String staffNames, String days) throws Exception {
		String staffNames_[] = staffNames.split(";");
		String days_[] = days.split(";");

		List<Map<String, Object>> dayList = zhcxService.onDayByDays(days_);
		Map<String, Integer> daySetVal = new HashMap<String, Integer>();
		if (dayList != null) {
			for (Map<String, Object> map : dayList) {
				daySetVal.put((String) map.get("day_time"), Integer.valueOf(map.get("status") + ""));
			}
		}

		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		for (int i = 0; i < days_.length; i++) {
			String d = days_[i];
			String n = staffNames_[i];
			Map<String, String> m = new HashMap<String, String>();
			m.put("name", n);
			m.put("day", d);
			Integer s = daySetVal.get(d);
			if (1 == s || 3 == s) {// 1：节假日，2：工作日，3：三薪日
				list.add(m);
				list.add(m);
			}
			list.add(m);
		}

		this.response.setHeader("Content-disposition", "attachment;filename=tiaoxiupiliangdayin.xls");
		WritableWorkbook wwb = Workbook.createWorkbook(this.response.getOutputStream());// 转换成excel像是
		WritableSheet ws = wwb.createSheet("调休单批量打印", 0);
		WritableCellFormat titleStyle = null;

		WritableFont font18 = new WritableFont(WritableFont.TIMES, 18, WritableFont.NO_BOLD, false);
		titleStyle = new WritableCellFormat(font18);
		titleStyle.setAlignment(jxl.format.Alignment.LEFT);
		titleStyle.setVerticalAlignment(VerticalAlignment.CENTRE);
		titleStyle.setBorder(Border.RIGHT, BorderLineStyle.THIN);
		titleStyle.setBorder(Border.TOP, BorderLineStyle.THIN);
		titleStyle.setBorder(Border.LEFT, BorderLineStyle.THIN);

		WritableCellFormat style_top = null;
		style_top = new WritableCellFormat(new WritableFont(WritableFont.TIMES, 12, WritableFont.NO_BOLD, false));
		style_top.setBorder(Border.TOP, BorderLineStyle.THIN);

		WritableCellFormat style_top_right = null;
		style_top_right = new WritableCellFormat(new WritableFont(WritableFont.TIMES, 12, WritableFont.NO_BOLD, false));
		style_top_right.setBorder(Border.RIGHT, BorderLineStyle.THIN);
		style_top_right.setBorder(Border.TOP, BorderLineStyle.THIN);

		WritableCellFormat style_ = null;
		style_ = new WritableCellFormat(new WritableFont(WritableFont.TIMES, 12, WritableFont.NO_BOLD, false));
		style_.setAlignment(Alignment.CENTRE);
		style_.setVerticalAlignment(VerticalAlignment.CENTRE);
		style_.setBorder(Border.BOTTOM, BorderLineStyle.THIN);

		WritableCellFormat style_left_ = null;
		style_left_ = new WritableCellFormat(new WritableFont(WritableFont.TIMES, 12, WritableFont.NO_BOLD, false));
		style_left_.setAlignment(Alignment.CENTRE);
		style_left_.setVerticalAlignment(VerticalAlignment.CENTRE);
		style_left_.setBorder(Border.BOTTOM, BorderLineStyle.THIN);
		style_left_.setBorder(Border.LEFT, BorderLineStyle.THIN);

		WritableCellFormat style_right = null;
		style_right = new WritableCellFormat(new WritableFont(WritableFont.TIMES, 12, WritableFont.NO_BOLD, false));
		style_right.setAlignment(Alignment.RIGHT);
		style_right.setVerticalAlignment(VerticalAlignment.CENTRE);
		style_right.setBorder(Border.BOTTOM, BorderLineStyle.THIN);

		WritableCellFormat style_right_left_ = null;
		style_right_left_ = new WritableCellFormat(new WritableFont(WritableFont.TIMES, 12, WritableFont.NO_BOLD, false));
		style_right_left_.setAlignment(Alignment.RIGHT);
		style_right_left_.setVerticalAlignment(VerticalAlignment.CENTRE);
		style_right_left_.setBorder(Border.BOTTOM, BorderLineStyle.THIN);
		style_right_left_.setBorder(Border.LEFT, BorderLineStyle.THIN);

		WritableCellFormat style_right_ = null;
		style_right_ = new WritableCellFormat(new WritableFont(WritableFont.TIMES, 12, WritableFont.NO_BOLD, false));
		style_right_.setAlignment(Alignment.RIGHT);
		style_right_.setBorder(Border.RIGHT, BorderLineStyle.THIN);

		WritableCellFormat style_right__ = null;
		style_right__ = new WritableCellFormat(new WritableFont(WritableFont.TIMES, 12, WritableFont.NO_BOLD, false));
		style_right__.setBorder(Border.RIGHT, BorderLineStyle.THIN);
		style_right__.setBorder(Border.BOTTOM, BorderLineStyle.THIN);

		WritableCellFormat style = new WritableCellFormat(new WritableFont(WritableFont.TIMES, 12, WritableFont.NO_BOLD, false));
		WritableCellFormat styleLeft_ = new WritableCellFormat(new WritableFont(WritableFont.TIMES, 12, WritableFont.NO_BOLD, false));
		styleLeft_.setBorder(Border.LEFT, BorderLineStyle.THIN);

		CellView viewA = new CellView();
		viewA.setSize(3250);
		ws.setColumnView(0, viewA);
		CellView viewB = new CellView();
		viewB.setSize(850);
		ws.setColumnView(1, viewB);
		CellView viewC = new CellView();
		viewC.setSize(1200);
		ws.setColumnView(2, viewC);
		CellView viewD = new CellView();
		viewD.setSize(1000);
		ws.setColumnView(3, viewD);
		CellView viewE = new CellView();
		viewE.setSize(1500);
		ws.setColumnView(4, viewE);
		CellView viewF = new CellView();
		viewF.setSize(1000);
		ws.setColumnView(5, viewF);
		CellView viewG = new CellView();
		viewG.setSize(2800);
		ws.setColumnView(6, viewG);
		CellView viewH = new CellView();
		viewH.setSize(1000);
		ws.setColumnView(7, viewH);
		CellView viewJ = new CellView();
		viewJ.setSize(1000);
		ws.setColumnView(8, viewJ);
		CellView viewK = new CellView();
		viewK.setSize(1000);
		ws.setColumnView(9, viewK);
		CellView viewL = new CellView();
		viewL.setSize(1000);
		ws.setColumnView(10, viewL);
		CellView viewQ = new CellView();
		viewQ.setSize(1000);
		ws.setColumnView(11, viewQ);
		ws.setColumnView(0 + 13, viewA);
		ws.setColumnView(1 + 13, viewB);
		ws.setColumnView(2 + 13, viewC);
		ws.setColumnView(3 + 13, viewD);
		ws.setColumnView(4 + 13, viewE);
		ws.setColumnView(5 + 13, viewF);
		ws.setColumnView(6 + 13, viewG);
		ws.setColumnView(7 + 13, viewH);
		ws.setColumnView(8 + 13, viewJ);
		ws.setColumnView(9 + 13, viewK);
		ws.setColumnView(10 + 13, viewL);
		ws.setColumnView(11 + 13, viewQ);
		CellView viewR = new CellView();
		viewR.setSize(400);
		CellView viewR0 = new CellView();
		viewR0.setSize(700);
		CellView viewR9 = new CellView();
		viewR9.setSize(1000);

		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.MONTH, +1);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		String df1 = format1.format(cal.getTime());
		String[] daydf1_ = df1.split("-");

		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(cal.getTime());
		cal2.add(Calendar.MONTH, +5);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		cal2.add(Calendar.DAY_OF_MONTH, -1);
		String df2 = format1.format(cal2.getTime());
		String[] daydf2_ = df2.split("-");
		for (int i = 0; i < list.size(); i++) {
			boolean os = i % 2 == 0;// 是否偶数
			Map<String, String> m = list.get(i);
			String day = m.get("day");
			String name = m.get("name");
			String[] day_ = day.split("-");
			ws.mergeCells(0 + (!os ? 13 : 0), (i / 2) * 11, 5 + (!os ? 13 : 0), 0);// 合并

			ws.addCell(new Label(0 + (!os ? 13 : 0), (i / 2) * 11, "    值班(加班)调休单", titleStyle));
			ws.addCell(new Label(6 + (!os ? 13 : 0), (i / 2) * 11, "", style_top));
			ws.addCell(new Label(7 + (!os ? 13 : 0), (i / 2) * 11, "", style_top));
			ws.addCell(new Label(8 + (!os ? 13 : 0), (i / 2) * 11, "", style_top));
			ws.addCell(new Label(9 + (!os ? 13 : 0), (i / 2) * 11, "", style_top));
			ws.addCell(new Label(10 + (!os ? 13 : 0), (i / 2) * 11, "", style_top));
			ws.addCell(new Label(11 + (!os ? 13 : 0), (i / 2) * 11, "", style_top_right));

			ws.addCell(new Label(0 + (!os ? 13 : 0), (i / 2) * 11 + 1, name, style_left_));
			ws.addCell(new Label(1 + (!os ? 13 : 0), (i / 2) * 11 + 1, "同志", style));
			ws.addCell(new Label(5 + (!os ? 13 : 0), (i / 2) * 11 + 1, "", style_right_));
			ws.addCell(new Label(6 + (!os ? 13 : 0), (i / 2) * 11 + 1, "", style_right));
			ws.addCell(new Label(7 + (!os ? 13 : 0), (i / 2) * 11 + 1, "年", style));
			ws.addCell(new Label(8 + (!os ? 13 : 0), (i / 2) * 11 + 1, "", style_));
			ws.addCell(new Label(9 + (!os ? 13 : 0), (i / 2) * 11 + 1, "月", style));
			ws.addCell(new Label(10 + (!os ? 13 : 0), (i / 2) * 11 + 1, "", style_));
			ws.addCell(new Label(11 + (!os ? 13 : 0), (i / 2) * 11 + 1, "日", style_right_));
			ws.addCell(new Number(0 + (!os ? 13 : 0), (i / 2) * 11 + 2, new Integer(day_[0]), style_right_left_));
			ws.addCell(new Label(1 + (!os ? 13 : 0), (i / 2) * 11 + 2, "年", style));
			ws.addCell(new Number(2 + (!os ? 13 : 0), (i / 2) * 11 + 2, new Integer(day_[1]), style_));
			ws.addCell(new Label(3 + (!os ? 13 : 0), (i / 2) * 11 + 2, "月", style));
			ws.addCell(new Number(4 + (!os ? 13 : 0), (i / 2) * 11 + 2, new Integer(day_[2]), style_));
			ws.addCell(new Label(5 + (!os ? 13 : 0), (i / 2) * 11 + 2, "日", style_right_));
			ws.addCell(new Label(6 + (!os ? 13 : 0), (i / 2) * 11 + 2, "             调休半天", style));
			ws.addCell(new Label(11 + (!os ? 13 : 0), (i / 2) * 11 + 2, "", style_right_));
			ws.addCell(new Label(0 + (!os ? 13 : 0), (i / 2) * 11 + 3, "      值(加)班半天", styleLeft_));
			ws.addCell(new Label(5 + (!os ? 13 : 0), (i / 2) * 11 + 3, "", style_right_));
			ws.addCell(new Label(11 + (!os ? 13 : 0), (i / 2) * 11 + 3, "", style_right_));
			ws.addCell(new Label(0 + (!os ? 13 : 0), (i / 2) * 11 + 4, "      人事科负责人签名", styleLeft_));
			ws.addCell(new Label(5 + (!os ? 13 : 0), (i / 2) * 11 + 4, "", style_right_));
			ws.addCell(new Label(6 + (!os ? 13 : 0), (i / 2) * 11 + 4, "      调休人签名", style));
			ws.addCell(new Label(11 + (!os ? 13 : 0), (i / 2) * 11 + 4, "", style_right_));
			ws.addCell(new Label(0 + (!os ? 13 : 0), (i / 2) * 11 + 5, "", styleLeft_));
			ws.addCell(new Label(5 + (!os ? 13 : 0), (i / 2) * 11 + 5, "", style_right_));
			ws.addCell(new Label(6 + (!os ? 13 : 0), (i / 2) * 11 + 5, "      科负责人签名", style));
			ws.addCell(new Label(11 + (!os ? 13 : 0), (i / 2) * 11 + 5, "", style_right_));
			ws.addCell(new Label(0 + (!os ? 13 : 0), (i / 2) * 11 + 6, "", styleLeft_));
			ws.addCell(new Label(5 + (!os ? 13 : 0), (i / 2) * 11 + 6, "", style_right_));
			ws.addCell(new Label(11 + (!os ? 13 : 0), (i / 2) * 11 + 6, "", style_right_));

			ws.addCell(new Number(0 + (!os ? 13 : 0), (i / 2) * 11 + 7, new Integer(daydf1_[0]), style_right_left_));
			ws.addCell(new Label(1 + (!os ? 13 : 0), (i / 2) * 11 + 7, "年", style_));
			ws.addCell(new Number(2 + (!os ? 13 : 0), (i / 2) * 11 + 7, new Integer(daydf1_[1]), style_));
			ws.addCell(new Label(3 + (!os ? 13 : 0), (i / 2) * 11 + 7, "月", style_));
			ws.addCell(new Number(4 + (!os ? 13 : 0), (i / 2) * 11 + 7, new Integer(daydf1_[2]), style_));
			ws.addCell(new Label(5 + (!os ? 13 : 0), (i / 2) * 11 + 7, "日", style_right__));
			ws.addCell(new Label(6 + (!os ? 13 : 0), (i / 2) * 11 + 7, "", style_right));
			ws.addCell(new Label(7 + (!os ? 13 : 0), (i / 2) * 11 + 7, "年", style_));
			ws.addCell(new Label(8 + (!os ? 13 : 0), (i / 2) * 11 + 7, "", style_));
			ws.addCell(new Label(9 + (!os ? 13 : 0), (i / 2) * 11 + 7, "月", style_));
			ws.addCell(new Label(10 + (!os ? 13 : 0), (i / 2) * 11 + 7, "", style_));
			ws.addCell(new Label(11 + (!os ? 13 : 0), (i / 2) * 11 + 7, "日", style_right__));

			ws.addCell(new Label(0 + (!os ? 13 : 0), (i / 2) * 11 + 8, "                         本单有效截止期为：", style));
			ws.addCell(new Number(6 + (!os ? 13 : 0), (i / 2) * 11 + 8, new Integer(daydf2_[0]), style));
			ws.addCell(new Label(7 + (!os ? 13 : 0), (i / 2) * 11 + 8, "年", style));
			ws.addCell(new Number(8 + (!os ? 13 : 0), (i / 2) * 11 + 8, new Integer(daydf2_[1]), style));
			ws.addCell(new Label(9 + (!os ? 13 : 0), (i / 2) * 11 + 8, "月", style));
			ws.addCell(new Number(10 + (!os ? 13 : 0), (i / 2) * 11 + 8, new Integer(daydf2_[2]), style));
			ws.addCell(new Label(11 + (!os ? 13 : 0), (i / 2) * 11 + 8, "日", style));
			ws.setRowView((i / 2) * 11 + 0, viewR0);
			ws.setRowView((i / 2) * 11 + 1, viewR);
			ws.setRowView((i / 2) * 11 + 2, viewR);
			ws.setRowView((i / 2) * 11 + 3, viewR);
			ws.setRowView((i / 2) * 11 + 4, viewR);
			ws.setRowView((i / 2) * 11 + 5, viewR);
			ws.setRowView((i / 2) * 11 + 6, viewR);
			ws.setRowView((i / 2) * 11 + 7, viewR);
			ws.setRowView((i / 2) * 11 + 8, viewR);
			ws.setRowView((i / 2) * 11 + 9, viewR9);
		}
		wwb.write();
		wwb.close();
	}

	private ZhcxService zhcxService;
	private TzggService tzggService;
	private DepartmentInfoService departmentInfoService;
	private OASysDictService oaSysDictService;

	public void setTzggService(TzggService tzggService) {
		this.tzggService = tzggService;
	}

	public void setDepartmentInfoService(DepartmentInfoService departmentInfoService) {
		this.departmentInfoService = departmentInfoService;
	}

	public void setOaSysDictService(OASysDictService oaSysDictService) {
		this.oaSysDictService = oaSysDictService;
	}

	public void setZhcxService(ZhcxService zhcxService) {
		this.zhcxService = zhcxService;
	}
}
