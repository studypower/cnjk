package com.disease_control.web.action.xtsz.bmgl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.DepartmentInfoService;
import com.disease_control.service.RoleInfoService;
import com.disease_control.web.form.DepartmentInfo;
import com.yakov.utils.JsonUtil;

public class DepartmentInfoAction extends BaseAction<DepartmentInfo> {

	public String initList() {
		initRequest();
		DepartmentInfo departmentInfo = (DepartmentInfo) getForm();
		request.setAttribute("baseId", departmentInfo.getBaseId());
		return SUCCESS;
	}

	/**
	 * 查出部门列表
	 * 
	 * @return
	 */
	public void list() {
		initRequest();
		DepartmentInfo departmentInfo = (DepartmentInfo) getForm();
		Page page = departmentInfoService.list(departmentInfo.getPageIndex(), departmentInfo.getPageSize(), departmentInfo.getBaseId(), departmentInfo.getName());
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
		DepartmentInfo departmentInfo = (DepartmentInfo) getForm();
		request.setAttribute("baseId", departmentInfo.getBaseId());
		request.setAttribute("department", departmentInfoService.get(departmentInfo.getBaseId()));
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
		DepartmentInfo departmentInfo = (DepartmentInfo) getForm();
		if (departmentInfo.getName() == null || "".equals(departmentInfo.getName())) {
			return ERROR;
		}
		if (departmentInfoService.add(departmentInfo) <= 0) {
			return ERROR;
		}
		return SUCCESS;
	}

	/**
	 * 查出部门信息
	 * 
	 * @return
	 */
	public String info() {
		initRequest();
		DepartmentInfo departmentInfo = (DepartmentInfo) getForm();
		request.setAttribute("department", departmentInfoService.get(departmentInfo.getId()));
		return SUCCESS;
	}

	/**
	 * 进入修改页面
	 * 
	 * @return
	 */
	public String initUpdate() {
		initRequest();
		DepartmentInfo departmentInfo = (DepartmentInfo) getForm();
		request.setAttribute("baseId", departmentInfo.getBaseId());
		request.setAttribute("baseDepartment", departmentInfoService.get(departmentInfo.getBaseId()));
		request.setAttribute("departmentInfo", departmentInfoService.get(departmentInfo.getId()));
		request.setAttribute("roleInfoList", roleInfoService.list());
		return SUCCESS;
	}

	/**
	 * 更改
	 * 
	 * @return
	 */
	public String update() {
		initRequest();
		DepartmentInfo departmentInfo = (DepartmentInfo) getForm();
		if (departmentInfoService.update(departmentInfo) <= 0) {
			return ERROR;
		}
		return SUCCESS;
	}

	/**
	 * 禁用/启用
	 * 
	 * @return
	 */
	public String updateStatus() {
		initRequest();
		DepartmentInfo departmentInfo = (DepartmentInfo) getForm();
		departmentInfoService.updateStatus(departmentInfo.getId(), departmentInfo.getStatus());
		return SUCCESS;
	}

	/**
	 * 删除
	 * 
	 * @return
	 */
	public String del() {
		initRequest();
		DepartmentInfo departmentInfo = (DepartmentInfo) getForm();
		int resultInt = departmentInfoService.del(departmentInfo.getId(), departmentInfo.getBaseId());
		if (resultInt == 0) {
			request.setAttribute("result", 0);
			return ERROR;
		} else if (resultInt == -1) {
			request.setAttribute("result", -1);// 说明改部门下面还存在员工信息
			return ERROR;
		} else if (resultInt == -2) {
			request.setAttribute("result", -2);// 说明该部门还存在下级部门
			return ERROR;
		}
		return SUCCESS;
	}

	private DepartmentInfoService departmentInfoService;
	private RoleInfoService roleInfoService;

	public void setDepartmentInfoService(DepartmentInfoService departmentInfoService) {
		this.departmentInfoService = departmentInfoService;
	}

	public void setRoleInfoService(RoleInfoService roleInfoService) {
		this.roleInfoService = roleInfoService;
	}
}
