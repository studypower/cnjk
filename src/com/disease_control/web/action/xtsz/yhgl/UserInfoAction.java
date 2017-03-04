package com.disease_control.web.action.xtsz.yhgl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.disease_control.core.config.SystemConfig;
import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.DepartmentInfoService;
import com.disease_control.service.MenuInfoService;
import com.disease_control.service.RoleInfoService;
import com.disease_control.service.StaffInfoService;
import com.disease_control.service.UserInfoService;
import com.disease_control.service.UserMenuService;
import com.disease_control.web.form.UserInfo;
import com.yakov.utils.JsonUtil;
import com.yakov.utils.Md5Util;

/**
 * 账号管理
 * @author hqjiang
 *
 */
public class UserInfoAction extends BaseAction<UserInfo> {

	/**
	 * 用户列表
	 * 
	 * @return
	 */
	public String initList() {
		initRequest();
		request.setAttribute("departmentInfoList", departmentInfoService.list());
		return SUCCESS;
	}

	/**
	 * 用户列表
	 * 
	 * @return
	 */
	public void list() {
		initRequest();
		UserInfo userInfo = (UserInfo) getForm();
		Page page = userInfoService.list(userInfo.getPageIndex(), userInfo.getPageSize(), userInfo.getName(), userInfo.getStaffName(), userInfo.getDepartmentId(), userInfo.getRoleName());
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	/**
	 * 进入添加页面
	 * 
	 * @return
	 */
	public String initAdd() {
		initRequest();
		request.setAttribute("staffInfoList", staffInfoService.listByUser());
		request.setAttribute("menuInfoList", JsonUtil.listToJsonStr(menuInfoService.list()));
		request.setAttribute("roleInfoList", roleInfoService.list());
		return SUCCESS;
	}

	/**
	 * 添加
	 * 
	 * @return
	 */
	public String add() {
		initRequest();
		UserInfo userInfo = (UserInfo) getForm();
		userInfo.setPwd(Md5Util.encrypt32(userInfo.getPwd()));
		int result = userInfoService.add(userInfo);
		if (result == 0) {
			return ERROR;
		}
		return SUCCESS;
	}

	public String initUpdate() {
		initRequest();
		UserInfo userInfo = (UserInfo) getForm();
		Map userInfoMap = userInfoService.get(userInfo.getId());
		List<Map> menuInfoList = menuInfoService.list();
		List<Map> userMenuList = userMenuService.list(userInfo.getId());
		for1: for (Map userMenu : userMenuList) {
			for (Map menuInfo : menuInfoList) {
				if (menuInfo.get("key").equals(userMenu.get("menu_key"))) {
					menuInfo.put("checked", true);
					continue for1;
				}
			}
		}
		request.setAttribute("menuInfoList", JsonUtil.listToJsonStr(menuInfoList));
		request.setAttribute("roleInfoList", roleInfoService.list());
		request.setAttribute("staffInfoList", staffInfoService.listByUser());
		request.setAttribute("userInfo", userInfoMap);
		return SUCCESS;
	}

	/**
	 * 更改用户信息
	 * 
	 * @return
	 */
	public String update() {
		initRequest();
		UserInfo userInfo = (UserInfo) getForm();
		int resultInt = userInfoService.update(userInfo);
		if (resultInt != 1) {
			getPrintWriter().println("<script>alert('用户账号重复!');history.go(-1);</script>");
			return NONE;
		}
		getPrintWriter().println("<script>history.go(-2);</script>");
		return NONE;
	}

	/**
	 * 删除
	 * 
	 * @return
	 */
	public String del() {
		initRequest();
		UserInfo userInfo = (UserInfo) getForm();
		userInfoService.del_Tx(userInfo.getId());
		getPrintWriter().println("<script>history.go(-1);</script>");
		return NONE;
	}

	/**
	 * 查询用户个人信息
	 * 
	 * @return
	 */
	public String my() {
		initRequest();
		Map user = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		Map userInfoMap = userInfoService.my(Integer.parseInt(user.get("id").toString()));
		request.setAttribute("user", userInfoMap);
		return SUCCESS;
	}

	/**
	 * 进入密码修改页面
	 * 
	 * @return
	 */
	public String initUpdatePwd() {
		initRequest();
		return SUCCESS;
	}

	/**
	 * 修改用户密码
	 * 
	 * @return
	 */
	public String updatePwd() {
		initRequest();
		UserInfo userInfo = (UserInfo) getForm();
		String newPwd = request.getParameter("newPwd");
		Map user = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		userInfo.setName(String.valueOf(user.get("name")));
		if (userInfo.getPwd() == null || "".equals(userInfo.getPwd()) || newPwd == null || "".equals(newPwd)) {
			request.setAttribute("result", 0);
			return ERROR;
		}
		userInfo.setPwd(Md5Util.encrypt32(userInfo.getPwd()));
		newPwd = Md5Util.encrypt32(newPwd);
		int resultInt = userInfoService.updatePwd(userInfo, newPwd);
		if (resultInt == -1) {
			request.setAttribute("result", -1);
			return ERROR;
		}
		if (resultInt == 0) {
			request.setAttribute("result", 0);
			return ERROR;
		}
		request.setAttribute("result", 1);
		return SUCCESS;
	}

	public void unbundling() {
		initRequest();
		UserInfo userInfo = (UserInfo) getForm();
		userInfoService.unbundling_Tx(userInfo.getId());
		getPrintWriter().println(1);
	}

	public void status() {
		initRequest();
		UserInfo userInfo = (UserInfo) getForm();
		userInfoService.status_Tx(userInfo.getId(), userInfo.getStatus());
		getPrintWriter().println(1);
	}

	private UserInfoService userInfoService;
	private DepartmentInfoService departmentInfoService;
	private StaffInfoService staffInfoService;
	private RoleInfoService roleInfoService;
	private MenuInfoService menuInfoService;
	private UserMenuService userMenuService;

	public void setUserInfoService(UserInfoService userInfoService) {
		this.userInfoService = userInfoService;
	}

	public void setDepartmentInfoService(DepartmentInfoService departmentInfoService) {
		this.departmentInfoService = departmentInfoService;
	}

	public void setStaffInfoService(StaffInfoService staffInfoService) {
		this.staffInfoService = staffInfoService;
	}

	public void setRoleInfoService(RoleInfoService roleInfoService) {
		this.roleInfoService = roleInfoService;
	}

	public void setMenuInfoService(MenuInfoService menuInfoService) {
		this.menuInfoService = menuInfoService;
	}

	public void setUserMenuService(UserMenuService userMenuService) {
		this.userMenuService = userMenuService;
	}

}
