package com.disease_control.web.action.xtsz.sjzd;

import java.util.HashMap;

import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.DataZzmmInfoService;
import com.disease_control.web.form.DataZzmmInfo;
import com.yakov.utils.JsonUtil;

public class DataZzmmInfoAction extends BaseAction<DataZzmmInfo>{
	
	public String initList(){
		return SUCCESS;
	}
	
	public void list(){
		initRequest();
		DataZzmmInfo dataZzmmInfo=getForm();
		Page page=dataZzmmInfoService.list(dataZzmmInfo.getPageIndex(),dataZzmmInfo.getPageSize());
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}
	
	public String initAdd(){
		return SUCCESS;
	}
	
	public String add(){
		initRequest();
		DataZzmmInfo dataZzmmInfo=getForm();
		if(dataZzmmInfoService.add_Tx(dataZzmmInfo)<=0){
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String initUpdate(){
		initRequest();
		DataZzmmInfo dataZzmmInfo=getForm();
		request.setAttribute("dataZzmmInfo",dataZzmmInfoService.get(dataZzmmInfo.getId()));
		return SUCCESS;
	}
	
	public String update(){
		initRequest();
		DataZzmmInfo dataZzmmInfo=getForm();
		if(dataZzmmInfoService.update_Tx(dataZzmmInfo)<=0){
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String del(){
		initRequest();
		DataZzmmInfo dataZzmmInfo=getForm();
		dataZzmmInfoService.del_Tx(dataZzmmInfo.getId());
		return SUCCESS;
	}
	private DataZzmmInfoService dataZzmmInfoService;
	public void setDataZzmmInfoService(DataZzmmInfoService dataZzmmInfoService) {
		this.dataZzmmInfoService = dataZzmmInfoService;
	}
}
