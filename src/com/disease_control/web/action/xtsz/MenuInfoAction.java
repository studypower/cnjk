package com.disease_control.web.action.xtsz;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.MenuInfoService;
import com.disease_control.web.form.MenuInfo;
import com.yakov.utils.JsonUtil;

public class MenuInfoAction extends BaseAction<MenuInfo> {

	public String initList() {
		initRequest();
		MenuInfo menuInfo = getForm();
		request.setAttribute("parentKey", menuInfo.getParentKey());
		return SUCCESS;
	}

	public void list() {
		initRequest();
		MenuInfo menuInfo = getForm();
		Page page = menuInfoService.list(menuInfo.getPageIndex(), menuInfo.getPageSize(), menuInfo.getParentKey());
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		ArrayList<Map> resultList = (ArrayList<Map>) page.getResult();
		for (Map result : resultList) {
			result.put("addressUrl", result.get("url") + "," + result.get("key"));
			result.put("action", result.get("key"));
		}
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	public String initAdd() {
		initRequest();
		MenuInfo menuInfo = getForm();
		if (menuInfo.getParentKey() != null && !menuInfo.getParentKey().equals("") && !menuInfo.getParentKey().equals("0")) {
			request.setAttribute("parentMenuInfo", menuInfoService.get(menuInfo.getParentKey()));
		}
		return SUCCESS;
	}

	public String add() {
		initRequest();
		MenuInfo menuInfo = getForm();
		if (menuInfo.getName() == null || "".equals(menuInfo.getName()) || menuInfo.getKey() == null || "".equals(menuInfo.getKey())) {
			request.setAttribute("result", 0);
			return ERROR;
		}
		if (menuInfo.getParentKey() != null) {
			menuInfo.setKey(menuInfo.getParentKey() + "_" + menuInfo.getKey());
		}
		if (menuInfo.getUrl() != null && menuInfo.getUrl().equals("")) {
			menuInfo.setUrl(null);
		}
		if (menuInfoService.add(menuInfo) <= 0) {
			request.setAttribute("result", 0);
			return ERROR;
		}
		return SUCCESS;
	}

	public String initUpdate() {
		initRequest();
		MenuInfo menuInfo = getForm();
		Map menuInfoMap = menuInfoService.get(menuInfo.getKey());
		if (menuInfoMap != null && menuInfoMap.get("parent_key") != null) {
			Map parentMenuInfoMap = menuInfoService.get(menuInfoMap.get("parent_key").toString());
			request.setAttribute("parentMenuInfo", parentMenuInfoMap);
		}
		request.setAttribute("menuInfo", menuInfoMap);
		return SUCCESS;
	}

	public String update() {
		initRequest();
		MenuInfo menuInfo = getForm();
		if (menuInfo.getName() == null || "".equals(menuInfo.getName())) {
			request.setAttribute("result", 0);
			return ERROR;
		}
		if (menuInfoService.update(menuInfo) <= 0) {
			request.setAttribute("result", 0);
			return ERROR;
		}
		return SUCCESS;
	}

	public String del() {
		initRequest();
		MenuInfo menuInfo = getForm();
		if (menuInfoService.del(menuInfo.getKey(), null) <= 0) {
			request.setAttribute("result", 0);
			return ERROR;
		}
		return SUCCESS;
	}

	private MenuInfoService menuInfoService;

	public void setMenuInfoService(MenuInfoService menuInfoService) {
		this.menuInfoService = menuInfoService;
	}

}
