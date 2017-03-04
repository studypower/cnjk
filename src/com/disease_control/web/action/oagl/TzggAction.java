package com.disease_control.web.action.oagl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import jxl.Workbook;
import jxl.WorkbookSettings;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import com.disease_control.core.config.SystemConfig;
import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.DepartmentInfoService;
import com.disease_control.service.TzggService;
import com.disease_control.web.form.TzggForm;
import com.yakov.utils.DateUtil;
import com.yakov.utils.JsonUtil;

/**
 * 通知公告
 */
@SuppressWarnings({ "rawtypes", "unchecked" })
public class TzggAction extends BaseAction<TzggForm> {
	public static Logger logger = Logger.getLogger(TzggAction.class);

	/**
	 * 通知公告列表
	 */
	public String initList() {
		return SUCCESS;
	}

	public String add() {
		logger.info("----------创建通知公告-----------");
		initRequest();
		List<Map> deptList = departmentInfoService.list();
		for (Map map : deptList) {
			List<Map<String, Object>> userList = tzggService.usersByDeptId("" + map.get("id"));
			map.put("userList", userList);
		}
		request.setAttribute("departmentList", deptList);// 所有的部门
		return SUCCESS;
	}

	public String edit() {
		initRequest();
		String id = request.getParameter("id");
		String preview = request.getParameter("preview");
		get(id);
		List<Map> deptList = departmentInfoService.list();
		for (Map map : deptList) {
			List<Map<String, Object>> userList = tzggService.usersByDeptId("" + map.get("id"));
			map.put("userList", userList);
		}
		request.setAttribute("preview", preview);// 为true的话，将打开预览窗口
		request.setAttribute("departmentList", deptList);// 所有的部门
		return SUCCESS;
	}

	public void list() {
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		String methodType = this.request.getParameter("methodType");
		TzggForm form = getForm();
		if (!"exportData".equals(methodType)) {// 1:查询列表部分
			Page page = tzggService.search(form.getPageIndex(), form.getPageSize(), form.getKeyword(), form.getStartTime(), form.getEndTime(), form.getStatus(), form.getTopSort(), currentUser);
			HashMap jsonMap = new HashMap();
			jsonMap.put("total", page.getTotalPageCount());
			jsonMap.put("page", page.getCurrentPageNo());
			jsonMap.put("records", page.getTotalCount());
			jsonMap.put("rows", page.getResult());
			getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
		} else {// 2：导出内容部分
			Page page = tzggService.search(1, Integer.MAX_VALUE, form.getKeyword(), form.getStartTime(), form.getEndTime(), form.getStatus(), form.getTopSort(), currentUser);
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
		this.response.setHeader("Content-disposition", "attachment;filename=noticeList.xls");
		WritableWorkbook workbook = Workbook.createWorkbook(this.response.getOutputStream());
		ws.setLocale(new Locale("ZH", "China"));
		WritableSheet s1 = workbook.createSheet("Sheet1", 0);
		s1.addCell(new Label(0, 0, "通知公告列表"));
		String title = "序号,标题,关键字,部门,发布人,发布时间,浏览次数";
		String[] titleArray = title.split(",");
		for (int i = 0; i < titleArray.length; i++) {
			s1.addCell(new Label(i, 1, titleArray[i]));
		}
		for (int i = 2; i < list.size() + 2; i++) {
			s1.addCell(new Label(0, i, String.valueOf(i - 1)));
			Map obj = list.get(i - 2);
			s1.addCell(new Label(1, i, String.valueOf(obj.get("notice"))));
			s1.addCell(new Label(2, i, String.valueOf(obj.get("keyword"))));
			s1.addCell(new Label(3, i, String.valueOf(obj.get("department_name"))));
			s1.addCell(new Label(4, i, String.valueOf(obj.get("publisher_name"))));
			s1.addCell(new Label(5, i, String.valueOf(DateUtil.format((Date) obj.get("publish_date"), "yyyy-MM-dd HH", ""))));
			s1.addCell(new Label(6, i, String.valueOf(obj.get("read_count"))));
		}
		workbook.write();
		workbook.close();
	}

	public void del() {
		initRequest();// 删除通知公告
		String id = this.request.getParameter("id");
		tzggService.update(new Integer(id), null, null, null, null, null, "3", null, null, null);
	}

	/**
	 * 查看详细信息
	 */
	public String view() {
		initRequest();
		String id = this.request.getParameter("id");
		String preview = this.request.getParameter("preview");
		get(id);
		if (!"true".equals(preview)) {// 如果是正式浏览 非预览状态将要累加读取次数
			Map notice = (Map) this.request.getAttribute("notice");
			Integer readCount = (Integer) notice.get("read_count");
			tzggService.update(new Integer(id), null, null, null, null, null, null, "" + (readCount + 1), null, null);
			notice.put("read_count", "" + (readCount + 1));
		}
		if ("0".equals("" + ((Map) this.request.getAttribute("notice")).get("isSendAll"))) {
			List<Map> deptList = departmentInfoService.list();
			for (Map map : deptList) {
				List<Map<String, Object>> userList = tzggService.usersByDeptId("" + map.get("id"));
				map.put("userList", userList);
			}
			request.setAttribute("departmentList", deptList);// 所有的部门
		}
		return SUCCESS;
	}

	public void saveTops() {
		initRequest();
		String[] ids = this.request.getParameterValues("id");
		String[] orderbys = this.request.getParameterValues("orderby");
		int i = 0;
		for (String id : ids) {
			this.tzggService.update(new Integer(id), null, null, null, null, null, null, null, orderbys[i++], null);
		}
	}

	/**
	 * 保存通知公告内容
	 */
	public void save() {
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);// 当前操作的用户
		String notice = this.request.getParameter("notice");// 标题
		String keyword = this.request.getParameter("keyword");// 关键子
		String content = this.request.getParameter("content");// 聊天内容
		String saveType = this.request.getParameter("saveType");// 1:暂存，2:暂存后预览，3：发布
		String isSendAll = StringUtils.defaultIfEmpty(this.request.getParameter("isSendAll"), "0");
		String[] userCheckBox = this.request.getParameterValues("userCheckBox");
		String[] fileNames = this.request.getParameterValues("fileNames");// 附件内容

		String type = saveType;
		if ("5".equals(saveType)) {// 发布
			type = "1";
		} else if ("4".equals(saveType)) {// 预览
			type = "2";
		}
		String id = request.getParameter("id");
		Integer noticeId = null;
		if (StringUtils.isNotEmpty(id)) {
			noticeId = new Integer(id);
			tzggService.update(noticeId, notice, content, "" + currentUser.get("name"), keyword, "0", type, "0", null, isSendAll);
		} else {
			noticeId = tzggService.add(notice, content, "" + currentUser.get("name"), keyword, "" + currentUser.get("departmentId"), "0", type, isSendAll);
		}
		if (userCheckBox != null & noticeId != null) {// 添加收件人信息
			if ("1".equals(isSendAll)) {
				userCheckBox = new String[0];
			}
			tzggService.addAccept(noticeId, userCheckBox);
		}
		if (noticeId != null) {
			tzggService.saveFile(noticeId, fileNames);
		}
		try {
			if (!"4".equals(saveType)) {
				this.response.sendRedirect("oagl/tzgg/initList.do");// 跳转到列表页面
			} else {// 跳转到预览页面 跳转到修改页面并打开预览窗口
				this.response.sendRedirect("oagl/tzgg/edit.do?id=" + noticeId + "&preview=true");// 打开预览页面
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void findTops() {// 查询置顶区内容
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		List<Map<String, Object>> list = tzggService.findTops(currentUser);
		getPrintWriter().println(JsonUtil.listToJsonStr(list));
	}

	public String get(String id) {
		if (StringUtils.isNotEmpty(id)) {
			Map<String, Object> map = tzggService.get(id);
			List<Map<String, Object>> accepts = tzggService.findAccepts(id);
			if (accepts != null & accepts.size() > 0) {
				map.put("accepts_size", accepts.size());
			} else {
				map.put("accepts_size", 0);
			}
			// 读取附件内容
			List<Map<String, Object>> files = tzggService.findFiles(id);
			if (files != null) {
				for (Map<String, Object> map2 : files) {
					String atachment_name = (String) map2.get("atachment_name");
					String[] names = atachment_name.split("\\.");
					if (names.length > 0) {
						map2.put("fileExt", names[names.length - 1]);
					}
				}
			}
			map.put("accepts", accepts);
			map.put("files", files);
			request.setAttribute("notice", map);// 读取接收人
		}
		return SUCCESS;
	}

	public void top() {// 置顶设置和解除置顶
		initRequest();
		String id = this.request.getParameter("id");
		String top = this.request.getParameter("top");
		this.tzggService.update(new Integer(id), null, null, null, null, top, null, null, "0", null);
	}

	private TzggService tzggService;
	private DepartmentInfoService departmentInfoService;

	public void setTzggService(TzggService tzggService) {
		this.tzggService = tzggService;
	}

	public void setDepartmentInfoService(DepartmentInfoService departmentInfoService) {
		this.departmentInfoService = departmentInfoService;
	}
}
