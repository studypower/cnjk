package com.disease_control.web.action.oagl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.disease_control.core.config.SystemConfig;
import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.core.status.BaseForm;
import com.disease_control.service.GzsjdszService;
import com.yakov.utils.JsonUtil;

/**
 * 工作时间段设置
 */
@SuppressWarnings("rawtypes")
public class GzsjdszAction extends BaseAction<BaseForm> {
	// 初始化进入时间段集合界面
	public String initList() {
		this.initRequest();
		List modelList = gzsjdszService.getModelList();// 时间段模型类型数据
		this.request.setAttribute("modelList", modelList);
		return SUCCESS;
	}

	// 时间段维护 分页列表
	public void list() {
		this.initRequest();
		BaseForm form = this.getForm();
		String modelType = this.request.getParameter("model_type");
		String isUse = this.request.getParameter("is_use");
		Page page = gzsjdszService.list(form.getPageIndex(), form.getPageSize(), modelType, isUse);
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	// 设置启用，并将原有的启用状态设置为禁用
	public void setIsUse() {
		this.initRequest();
		String id = this.request.getParameter("id");
		gzsjdszService.setIsUse(id);
		getPrintWriter().print("true");
	}

	// 做初始化数据准备
	public void initEdit() {
		this.initRequest();
		String id = this.request.getParameter("id");
		List<Map<String, Object>> list = gzsjdszService.initEdit(id);
		getPrintWriter().println(JsonUtil.listToJsonStr(list));
	}

	public void edit() {
		this.initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		String model_type_name_ = this.request.getParameter("model_type_name_");
		String model_type_ = this.request.getParameter("model_type_");
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for (int i = 1; i <= 4; i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			String id = this.request.getParameter("id" + i);
			String type = this.request.getParameter("type" + i);
			String dx_1 = this.request.getParameter("d" + i + "_1");
			String dx_2 = this.request.getParameter("d" + i + "_2");
			map.put("id", id);
			map.put("type", type);
			map.put("start_time", dx_1);
			map.put("end_time", dx_2);
			map.put("model_type", model_type_);
			map.put("model_type_name", model_type_name_);
			map.put("model_name", dx_1 + " — " + dx_2);
			map.put("update_user", currentUser.get("name"));
			list.add(map);
		}
		this.gzsjdszService.edits(list);
		getPrintWriter().print("true");
	}

	public void addNew() {
		this.initRequest();
		Map currentUser = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		String model_type_name_ = this.request.getParameter("model_type_name_");
		String model_type_ = this.request.getParameter("model_type_");
		String is_use = this.request.getParameter("is_use");
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for (int i = 1; i <= 4; i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			String id = this.request.getParameter("id" + i);
			String type = this.request.getParameter("type" + i);
			String dx_1 = this.request.getParameter("d" + i + "_1");
			String dx_2 = this.request.getParameter("d" + i + "_2");
			map.put("id", id);
			map.put("type", type);
			map.put("start_time", dx_1);
			map.put("end_time", dx_2);
			map.put("model_type", model_type_);
			map.put("model_type_name", model_type_name_);
			map.put("model_name", dx_1 + " — " + dx_2);
			map.put("update_user", currentUser.get("name"));
			map.put("create_user", currentUser.get("name"));
			map.put("is_use", is_use);
			list.add(map);
		}
		this.gzsjdszService.addNews(list);
		getPrintWriter().print("true");
	}

	/**
	 * 根据模型名称和类型编号查询是否已经存在同名的类型
	 */
	public void valModelName() {
		this.initRequest();
		String model_type_name_ = this.request.getParameter("model_type_name_");
		String model_type_ = this.request.getParameter("model_type_");
		List list = this.gzsjdszService.valModelName(model_type_, model_type_name_);
		getPrintWriter().print(JsonUtil.listToJsonStr(list));
	}

	/**
	 * 根据时间段内容删除未启用的时间段
	 */
	public void setDelete() {
		this.initRequest();
		String model_type = this.request.getParameter("model_type");
		this.gzsjdszService.setDelete(model_type);
		getPrintWriter().print("true");
	}

	private GzsjdszService gzsjdszService;

	public void setGzsjdszService(GzsjdszService gzsjdszService) {
		this.gzsjdszService = gzsjdszService;
	}
}
