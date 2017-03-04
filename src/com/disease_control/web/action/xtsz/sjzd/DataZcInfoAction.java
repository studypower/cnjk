package com.disease_control.web.action.xtsz.sjzd;

import java.util.HashMap;

import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.DataZcInfoService;
import com.disease_control.web.form.DataZcInfo;
import com.yakov.utils.JsonUtil;

public class DataZcInfoAction extends BaseAction<DataZcInfo>{
	
	public String initList(){
		return SUCCESS;
	}
	
	public void list(){
		initRequest();
		DataZcInfo dataZcInfo=getForm();
		Page page=dataZcInfoService.list(dataZcInfo.getPageIndex(),dataZcInfo.getPageSize());
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
		DataZcInfo dataZcInfo=getForm();
		if(dataZcInfoService.add_Tx(dataZcInfo)<=0){
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String initUpdate(){
		initRequest();
		DataZcInfo dataZcInfo=getForm();
		request.setAttribute("dataZcInfo",dataZcInfoService.get(dataZcInfo.getId()));
		return SUCCESS;
	}
	
	public String update(){
		initRequest();
		DataZcInfo dataZcInfo=getForm();
		if(dataZcInfoService.update_Tx(dataZcInfo)<=0){
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String del(){
		initRequest();
		DataZcInfo dataZcInfo=getForm();
		dataZcInfoService.del_Tx(dataZcInfo.getId());
		return SUCCESS;
	}
	private DataZcInfoService dataZcInfoService;
	public void setDataZcInfoService(DataZcInfoService dataZcInfoService) {
		this.dataZcInfoService = dataZcInfoService;
	}

}
