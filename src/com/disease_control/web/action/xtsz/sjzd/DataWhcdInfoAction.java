package com.disease_control.web.action.xtsz.sjzd;

import java.util.HashMap;

import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.DataWhcdInfoService;
import com.disease_control.web.form.DataWhcdInfo;
import com.yakov.utils.JsonUtil;

public class DataWhcdInfoAction extends BaseAction<DataWhcdInfo>{
	
	public String initList(){
		return SUCCESS;
	}
	
	public void list(){
		initRequest();
		DataWhcdInfo dataWhcdInfo=getForm();
		Page page=dataWhcdInfoService.list(dataWhcdInfo.getPageIndex(),dataWhcdInfo.getPageSize());
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
		DataWhcdInfo dataWhcdInfo=getForm();
		if(dataWhcdInfoService.add_Tx(dataWhcdInfo)<=0){
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String initUpdate(){
		initRequest();
		DataWhcdInfo dataWhcdInfo=getForm();
		request.setAttribute("dataWhcdInfo",dataWhcdInfoService.get(dataWhcdInfo.getId()));
		return SUCCESS;
	}
	
	public String update(){
		initRequest();
		DataWhcdInfo dataWhcdInfo=getForm();
		if(dataWhcdInfoService.update_Tx(dataWhcdInfo)<=0){
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String del(){
		initRequest();
		DataWhcdInfo dataWhcdInfo=getForm();
		dataWhcdInfoService.del_Tx(dataWhcdInfo.getId());
		return SUCCESS;
	}
	private DataWhcdInfoService dataWhcdInfoService;
	public void setDataWhcdInfoService(DataWhcdInfoService dataWhcdInfoService) {
		this.dataWhcdInfoService = dataWhcdInfoService;
	}

}
