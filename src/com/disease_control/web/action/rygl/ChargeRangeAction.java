package com.disease_control.web.action.rygl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.ChargeRangeService;
import com.disease_control.service.DepartmentInfoService;
import com.disease_control.service.StaffInfoService;
import com.disease_control.web.form.ChargeRange;
import com.yakov.utils.JsonUtil;

/**
 * 分管范围
 * 
 * @author
 * 
 */
public class ChargeRangeAction extends BaseAction<ChargeRange> {
	/**
	 * 进入列表页
	 * 
	 * @return
	 */
	public String initList() {
		initRequest();
		request.setAttribute("staffInfoList", staffInfoService.list());
		return SUCCESS;
	}

	/**
	 * 列表
	 */
	public void list() {
		initRequest();
		ChargeRange chargeRange = getForm();
		Page page = chargeRangeService.list(chargeRange.getPageIndex(), chargeRange.getPageSize(), chargeRange.getStaffId());
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		ArrayList<Map> resultList = (ArrayList<Map>) page.getResult();
		for (Map result : resultList) {
			result.put("action", result.get("id"));
		}
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	/**
	 * 进入添加页面
	 * 
	 * @return
	 */
	public String initAdd() {
		initRequest();
		ChargeRange chargeRange = getForm();
		request.setAttribute("departmentInfoList", departmentInfoService.list());
		request.setAttribute("staffInfoList", staffInfoService.list());
		return SUCCESS;
	}

	/**
	 * 添加
	 * 
	 * @return
	 */
	public String add() {
		initRequest();
		ChargeRange chargeRange = getForm();
		int resultInt = chargeRangeService.add(chargeRange);
		if (resultInt == 0) {
			request.setAttribute("result", 0);
			return ERROR;
		} else if (resultInt == -1) {
			request.setAttribute("result", -1);
			return ERROR;
		}
		return SUCCESS;
	}

	/**
	 * 详情
	 * 
	 * @return
	 */
	public String info() {
		initRequest();
		ChargeRange chargeRange = getForm();
		request.setAttribute("departmentInfoList", departmentInfoService.list());
		request.setAttribute("chargeRange", chargeRangeService.get(chargeRange.getId()));
		request.setAttribute("staffInfoList", staffInfoService.list());
		return SUCCESS;
	}

	/**
	 * 进入修改页
	 * 
	 * @return
	 */
	public String initUpdate() {
		initRequest();
		ChargeRange chargeRange = getForm();
		request.setAttribute("departmentInfoList", departmentInfoService.list());
		request.setAttribute("chargeRange", chargeRangeService.get(chargeRange.getId()));
		request.setAttribute("staffInfoList", staffInfoService.list());
		return SUCCESS;
	}

	/**
	 * 修改
	 * 
	 * @return
	 */
	public String update() {
		initRequest();
		ChargeRange chargeRange = getForm();
		if (chargeRangeService.update(chargeRange) <= 0) {
			return ERROR;
		}
		return SUCCESS;
	}

	/**
	 * 删除
	 * 
	 * @return
	 */
	public void del() {
		initRequest();
		ChargeRange chargeRange = getForm();
		chargeRangeService.del(chargeRange.getId());
		getPrintWriter().println(1);
	}

	private ChargeRangeService chargeRangeService;
	private StaffInfoService staffInfoService;
	private DepartmentInfoService departmentInfoService;

	public void setChargeRangeService(ChargeRangeService chargeRangeService) {
		this.chargeRangeService = chargeRangeService;
	}

	public void setStaffInfoService(StaffInfoService staffInfoService) {
		this.staffInfoService = staffInfoService;
	}

	public void setDepartmentInfoService(DepartmentInfoService departmentInfoService) {
		this.departmentInfoService = departmentInfoService;
	}

}
