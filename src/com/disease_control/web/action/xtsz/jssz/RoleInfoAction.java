package com.disease_control.web.action.xtsz.jssz;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.MenuInfoService;
import com.disease_control.service.RoleInfoService;
import com.disease_control.service.RoleMenuService;
import com.disease_control.web.form.RoleInfo;
import com.yakov.utils.JsonUtil;


/**
 * 权限设置
 * @author hqjiang
 *
 */
public class RoleInfoAction extends BaseAction<RoleInfo> {

	public String initList() {
		return SUCCESS;
	}

	/**
	 * 权限列表
	 */
	public void list() {
		initRequest();
		RoleInfo roleInfo = getForm();
		Page page = roleInfoService.list(roleInfo.getPageIndex(), roleInfo.getPageSize(), roleInfo.getName());
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}
	
	/**
	 * 跳转至权限添加页面
	 * @return
	 */
	public String initAdd() {
		initRequest();
		request.setAttribute("menuInfoList", JsonUtil.listToJsonStr(menuInfoService.list()));
		return SUCCESS;
	}
	
	/**
	 * 添加权限
	 * @return
	 */
	public String add() {
		initRequest();
		RoleInfo roleInfo = getForm();
		if (roleInfoService.add_Tx(roleInfo) == 0) {
			return ERROR;
		}
		return SUCCESS;
	}
	
	/**
	 * 跳转至修改权限
	 * @return
	 */
	public String initUpdate() {
		initRequest();
		RoleInfo roleInfo = getForm();
		List<Map> menuInfoList = menuInfoService.list();
		List<Map> roleMenuList = roleMenuService.list(roleInfo.getId());
		for1: for (Map roleMenu : roleMenuList) {
			for (Map menuInfo : menuInfoList) {
				if (menuInfo.get("key").equals(roleMenu.get("menu_key"))) {
					menuInfo.put("checked", true);
					continue for1;
				}
			}
		}
		request.setAttribute("roleInfo", roleInfoService.get(roleInfo.getId()));
		request.setAttribute("menuInfoList", JsonUtil.listToJsonStr(menuInfoList));
		return SUCCESS;
	}
	
	/**
	 * 修改权限
	 * @return
	 */
	public String update() {
		initRequest();
		RoleInfo roleInfo = getForm();
		if (roleInfoService.update(roleInfo) == 0) {
			request.setAttribute("roleInfo", roleInfoService.get(roleInfo.getId()));
			return ERROR;
		}
		Page page = roleInfoService.list(roleInfo.getPageIndex(), roleInfo.getPageSize(), roleInfo.getName());
		request.setAttribute("roleInfoPage", page);
		return SUCCESS;
	}
	
	/**
	 * 删除
	 * @return
	 */
	public String del() {
		initRequest();
		RoleInfo roleInfo = getForm();
		roleInfoService.del(roleInfo.getId());
		Page page = roleInfoService.list(roleInfo.getPageIndex(), roleInfo.getPageSize(), roleInfo.getName());
		request.setAttribute("roleInfoPage", page);
		return SUCCESS;
	}
	
	/**
	 * 根据权限获取菜单列表
	 */
	public void getRoleMenuList(){
		initRequest();
		RoleInfo roleInfo = getForm();
		List<Map> menuInfoList = menuInfoService.list();
		List<Map> roleMenuList = roleMenuService.list(roleInfo.getId());
		for1: for (Map roleMenu : roleMenuList) {
			for (Map menuInfo : menuInfoList) {
				if (menuInfo.get("key").equals(roleMenu.get("menu_key"))) {
					menuInfo.put("checked", true);
					continue for1;
				}
			}
		}
		getPrintWriter().println(JsonUtil.listToJsonStr(menuInfoList));
	}

	private RoleInfoService roleInfoService;
	private RoleMenuService roleMenuService;
	private MenuInfoService menuInfoService;

	public void setRoleInfoService(RoleInfoService roleInfoService) {
		this.roleInfoService = roleInfoService;
	}

	public void setRoleMenuService(RoleMenuService roleMenuService) {
		this.roleMenuService = roleMenuService;
	}

	public void setMenuInfoService(MenuInfoService menuInfoService) {
		this.menuInfoService = menuInfoService;
	}

}
