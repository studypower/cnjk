package com.disease_control.web.action.xtsz.sjzd;

import java.util.HashMap;

import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.DataMzInfoService;
import com.disease_control.web.form.DataMzInfo;
import com.yakov.utils.JsonUtil;

public class DataMzInfoAction extends BaseAction<DataMzInfo>{
	
	public String initList(){
		return SUCCESS;
	}
	
	public void list(){
		initRequest();
		DataMzInfo dataMzInfo=getForm();
		Page page=dataMzInfoService.list(dataMzInfo.getPageIndex(),dataMzInfo.getPageSize());
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
		DataMzInfo dataMzInfo=getForm();
		if(dataMzInfoService.add_Tx(dataMzInfo)<=0){
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String initUpdate(){
		initRequest();
		DataMzInfo dataMzInfo=getForm();
		request.setAttribute("dataMzInfo",dataMzInfoService.get(dataMzInfo.getId()));
		return SUCCESS;
	}
	
	public String update(){
		initRequest();
		DataMzInfo dataMzInfo=getForm();
		if(dataMzInfoService.update_Tx(dataMzInfo)<=0){
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String del(){
		initRequest();
		DataMzInfo dataMzInfo=getForm();
		dataMzInfoService.del_Tx(dataMzInfo.getId());
		return SUCCESS;
	}
	private DataMzInfoService dataMzInfoService;

	public void setDataMzInfoService(DataMzInfoService dataMzInfoService) {
		this.dataMzInfoService = dataMzInfoService;
	}

}
