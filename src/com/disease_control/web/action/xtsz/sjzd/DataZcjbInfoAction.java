package com.disease_control.web.action.xtsz.sjzd;

import java.util.HashMap;

import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.DataZcjbInfoService;
import com.disease_control.web.form.DataZcjbInfo;
import com.yakov.utils.JsonUtil;

public class DataZcjbInfoAction extends BaseAction<DataZcjbInfo>{
	
	public String initList(){
		return SUCCESS;
	}
	
	public void list(){
		initRequest();
		DataZcjbInfo dataZcjbInfo=getForm();
		Page page=dataZcjbInfoService.list(dataZcjbInfo.getPageIndex(),dataZcjbInfo.getPageSize());
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
		DataZcjbInfo dataZcjbInfo=getForm();
		if(dataZcjbInfoService.add_Tx(dataZcjbInfo)<=0){
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String initUpdate(){
		initRequest();
		DataZcjbInfo dataZcjbInfo=getForm();
		request.setAttribute("dataZcjbInfo",dataZcjbInfoService.get(dataZcjbInfo.getId()));
		return SUCCESS;
	}
	
	public String update(){
		initRequest();
		DataZcjbInfo dataZcjbInfo=getForm();
		if(dataZcjbInfoService.update_Tx(dataZcjbInfo)<=0){
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String del(){
		initRequest();
		DataZcjbInfo dataZcjbInfo=getForm();
		dataZcjbInfoService.del_Tx(dataZcjbInfo.getId());
		return SUCCESS;
	}
	private DataZcjbInfoService dataZcjbInfoService;
	public void setDataZcjbInfoService(DataZcjbInfoService dataZcjbInfoService) {
		this.dataZcjbInfoService = dataZcjbInfoService;
	}
}
