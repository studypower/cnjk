package com.disease_control.web.action.oagl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.json.JSONObject;

import com.disease_control.core.config.SystemConfig;
import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.core.status.BaseForm;
import com.disease_control.service.KqsyService;
import com.disease_control.service.OaglIndexService;
import com.yakov.utils.EmailHttpXmlClient;
import com.yakov.utils.JsonUtil;
import com.yakov.utils.RoleTools;

public class IndexAction extends BaseAction<BaseForm> {

	DateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");

	/**
	 * OA管理的首页
	 */
	public String index() {
		initRequest();
		// 代办事宜
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		// 1：车辆申请
		Integer carUseCount = oaglIndexService.carUseCount((Integer) currentUser.get("staffId"),RoleTools.isRole(currentUser, "1_1_3") );
		// 2：供应商管理
		Integer gysxxCount = oaglIndexService.gysxxCount();
		// 3: 会议室申请
		Integer roomCount = oaglIndexService.roomCount((Integer) currentUser.get("staffId"),RoleTools.isRole(currentUser, "8_1_3"));
		// 4: 固定资产管理
		Integer gdzcCount = oaglIndexService.gdzcCount((Integer) currentUser.get("departmentId"));
		// 5: 经费管理
		Integer jfclCount = oaglIndexService.jfclCount((Integer) currentUser.get("staffId"));
		// 6: 电子工资单
		Integer dzgzdCount = oaglIndexService.dzgzdCount((Integer) currentUser.get("staffId"));
		// 7: 物品采购
		Integer wpcgCount = oaglIndexService.wpcgCount();
		// 8: 人员管理
		Integer ryglCount = oaglIndexService.ryglCount();
		// 9: 通知公告
		Page pageNoticeList = oaglIndexService.tzggShow((Integer) currentUser.get("id"),1,15);
		List<Map<String, Object>> noticeList = (List<Map<String, Object>>) pageNoticeList.getResult();
		
		
		this.request.setAttribute("carUseCount", carUseCount);
		this.request.setAttribute("gysxxCount", gysxxCount);
		this.request.setAttribute("roomCount", roomCount);
		this.request.setAttribute("gdzcCount", gdzcCount);
		this.request.setAttribute("jfclCount", jfclCount);
		this.request.setAttribute("wpcgCount", wpcgCount);
		this.request.setAttribute("ryglCount", ryglCount);
		this.request.setAttribute("dzgzdCount", dzgzdCount);
		this.request.setAttribute("noticeList", noticeList);
		this.request.setAttribute("today", dateformat.format(new Date()));
		return SUCCESS;
	}
	/**
	 * 通知公告接收者查询列表 界面
	 */
	public String initTzggList(){
		return SUCCESS;
	}
	
	/**
	 * 通知公告接收者查询列表
	 */
	public void tzggList(){
		initRequest();
		BaseForm form = this.getForm();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		Page pageNoticeList = oaglIndexService.tzggShow((Integer) currentUser.get("id"),form.getPageIndex(),form.getPageSize());
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", pageNoticeList.getTotalPageCount());
		jsonMap.put("page", pageNoticeList.getCurrentPageNo());
		jsonMap.put("records", pageNoticeList.getTotalCount());
		jsonMap.put("rows", pageNoticeList.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	/**
	 * 显示当前值班人
	 */
	public void zhiban() {
		initRequest();
		String riqi = this.request.getParameter("riqi");
		List<Map<String, Object>> list = kqsyService.zhibanByDay(riqi);
		getPrintWriter().println(JsonUtil.listToJsonStr(list));
	}

	/**
	 * 获取未读邮件个数
	 */
	public void emailNewcount() {
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		Object email = currentUser.get("email");
		if (email != null && !"".equals(email)) {
			JSONObject jsonOAuth = EmailHttpXmlClient.getJsonOAuth(EmailHttpXmlClient.client_id, EmailHttpXmlClient.client_secret);
			if (jsonOAuth.has("token_type")) {
				JSONObject jsonNewcount = EmailHttpXmlClient.getNewCount(email.toString(), jsonOAuth.getString("token_type"), jsonOAuth.getString("access_token"));
				getPrintWriter().println(jsonNewcount);
			} else {
				getPrintWriter().println("{\"NewCount\":\"0\"}");
			}
		}
	}

	/**
	 * 获取单点登录链接
	 */
	public void emailLoginUrl() {
		initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		Object email = currentUser.get("email");
		if (email != null && !"".equals(email)) {
			JSONObject jsonOAuth = EmailHttpXmlClient.getJsonOAuth(EmailHttpXmlClient.client_id, EmailHttpXmlClient.client_secret);
			if (jsonOAuth.has("token_type")) {
				JSONObject jsonAuthkey = EmailHttpXmlClient.getJsonAuthkey(email.toString(), jsonOAuth.getString("token_type"), jsonOAuth.getString("access_token"));
				String loginUrl = EmailHttpXmlClient.getLoginUrl(EmailHttpXmlClient.client_id, email.toString(), jsonAuthkey.getString("auth_key"));
				getPrintWriter().print(loginUrl);
			} else {
				getPrintWriter().print("###");
			}
		}
	}

	public KqsyService kqsyService;
	public OaglIndexService oaglIndexService;

	public void setKqsyService(KqsyService kqsyService) {
		this.kqsyService = kqsyService;
	}

	public void setOaglIndexService(OaglIndexService oaglIndexService) {
		this.oaglIndexService = oaglIndexService;
	}
}
