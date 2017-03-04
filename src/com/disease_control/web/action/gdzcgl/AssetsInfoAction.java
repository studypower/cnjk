package com.disease_control.web.action.gdzcgl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jxl.read.biff.BiffException;

import com.disease_control.core.config.SystemConfig;
import com.disease_control.core.page.Page;
import com.disease_control.core.status.BaseAction;
import com.disease_control.service.AssetsInfoService;
import com.disease_control.service.DataBrandFormatService;
import com.disease_control.service.DataBrandService;
import com.disease_control.service.DataDeviceService;
import com.disease_control.service.DataDeviceTypeService;
import com.disease_control.service.DataSystemService;
import com.disease_control.service.DataUsePlaceService;
import com.disease_control.service.StaffInfoService;
import com.disease_control.service.SupplierInfoService;
import com.disease_control.web.form.AssetsInfo;
import com.yakov.utils.ExcelReader;
import com.yakov.utils.JsonUtil;

public class AssetsInfoAction extends BaseAction<AssetsInfo> {

	public String initList() {
		initRequest();
		request.setAttribute("dataDeviceTypeList", dataDeviceTypeService.list());
		request.setAttribute("storageModeList", dataSystemService.list("storage_mode"));
		request.setAttribute("useSituationList", dataSystemService.list("use_situation"));
		request.setAttribute("serviceSituationList", dataSystemService.list("service_situation"));
		return SUCCESS;
	}

	public void list() {
		initRequest();
		AssetsInfo assetsInfo = getForm();
		Page page = assetsInfoService.list(assetsInfo.getPageIndex(), assetsInfo.getPageSize(), assetsInfo.getNum(), assetsInfo.getDeviceTypeId(), assetsInfo.getDeviceId(), assetsInfo.getBrandId(),
				assetsInfo.getBrandFormatId(), assetsInfo.getStorageModeId(), assetsInfo.getUseSituationId(), assetsInfo.getServiceSituationId());
		HashMap jsonMap = new HashMap();
		jsonMap.put("total", page.getTotalPageCount());
		jsonMap.put("page", page.getCurrentPageNo());
		jsonMap.put("records", page.getTotalCount());
		jsonMap.put("rows", page.getResult());
		getPrintWriter().println(JsonUtil.ObjToJsonStr(jsonMap));
	}

	public String initAdd() {
		initRequest();
		request.setAttribute("storageModeList", dataSystemService.list("storage_mode"));
		request.setAttribute("useSituationList", dataSystemService.list("use_situation"));
		request.setAttribute("serviceSituationList", dataSystemService.list("service_situation"));
		request.setAttribute("staffInfoList", staffInfoService.list());
		request.setAttribute("supplierInfoList", supplierInfoService.list());
		request.setAttribute("dataDeviceTypeList", dataDeviceTypeService.list());
		request.setAttribute("dataUsePlaceList", dataUsePlaceService.list());
		return SUCCESS;
	}

	public String add() {
		initRequest();
		AssetsInfo assetsInfo = getForm();
		if (assetsInfoService.add_Tx(assetsInfo) == 1) {
			return SUCCESS;
		}
		return ERROR;
	}

	public String initUpdate() {
		initRequest();
		AssetsInfo assetsInfo = getForm();
		Map assetsInfoMap = assetsInfoService.get(assetsInfo.getId());
		request.setAttribute("assetsInfo", assetsInfoMap);
		request.setAttribute("dataDeviceTypeList", dataDeviceTypeService.list());
		request.setAttribute("dataDeviceList", dataDeviceService.list(Integer.parseInt(assetsInfoMap.get("device_type_id").toString())));
		request.setAttribute("dataBrandList", dataBrandService.list(Integer.parseInt(assetsInfoMap.get("device_id").toString())));
		request.setAttribute("dataBrandFormatList", dataBrandFormatService.list(Integer.parseInt(assetsInfoMap.get("brand_id").toString())));
		request.setAttribute("storageModeList", dataSystemService.list("storage_mode"));
		request.setAttribute("useSituationList", dataSystemService.list("use_situation"));
		request.setAttribute("serviceSituationList", dataSystemService.list("service_situation"));
		request.setAttribute("staffInfoList", staffInfoService.list());
		request.setAttribute("supplierInfoList", supplierInfoService.list());
		request.setAttribute("dataUsePlaceList", dataUsePlaceService.list());
		return SUCCESS;
	}

	public String update() {
		initRequest();
		AssetsInfo assetsInfo = getForm();
		if (assetsInfoService.update_Tx(assetsInfo) <= 0) {
			return ERROR;
		}
		return SUCCESS;
	}

	public String initUpdateStatus() {
		initRequest();
		AssetsInfo assetsInfo = getForm();
		Map assetsInfoMap = assetsInfoService.get(assetsInfo.getId());
		request.setAttribute("assetsInfo", assetsInfoMap);
		request.setAttribute("dataDeviceTypeList", dataDeviceTypeService.list());
		request.setAttribute("dataDeviceList", dataDeviceService.list(Integer.parseInt(assetsInfoMap.get("device_type_id").toString())));
		request.setAttribute("dataBrandList", dataBrandService.list(Integer.parseInt(assetsInfoMap.get("device_id").toString())));
		request.setAttribute("dataBrandFormatList", dataBrandFormatService.list(Integer.parseInt(assetsInfoMap.get("brand_id").toString())));
		request.setAttribute("storageModeList", dataSystemService.list("storage_mode"));
		request.setAttribute("useSituationList", dataSystemService.list("use_situation"));
		request.setAttribute("serviceSituationList", dataSystemService.list("service_situation"));
		request.setAttribute("staffInfoList", staffInfoService.list());
		request.setAttribute("supplierInfoList", supplierInfoService.list());
		request.setAttribute("dataUsePlaceList", dataUsePlaceService.list());
		request.setAttribute("type", assetsInfo.getAssetsInfoLog().getType());
		return SUCCESS;
	}

	public String updateStatus() {
		initRequest();
		AssetsInfo assetsInfo = getForm();
		Map user = (Map) session.getAttribute(SystemConfig.CURRENT_USER);
		int staffId = Integer.parseInt(user.get("staffId").toString());
		assetsInfo.getAssetsInfoLog().setOperatingStaffId(staffId);
		assetsInfo.getAssetsInfoLog().setUseStaffId(assetsInfo.getUseStaffId());
		if (assetsInfoService.updateStatus_Tx(assetsInfo) <= 0) {
			return ERROR;
		}
		return SUCCESS;
	}

	public String initIntroduction() {
		return SUCCESS;
	}

	public String introduction() {
		initRequest();
		AssetsInfo assetsInfo = getForm();
		List<String[]> list = new ArrayList<String[]>();
		if (assetsInfo.getDataFile() != null) {
			try {
				list = ExcelReader.readExcel(assetsInfo.getDataFile(), 2);
			} catch (BiffException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch(Exception e){
				e.printStackTrace();
			}
		}
		int result = assetsInfoService.introduction_Tx(list);
		return SUCCESS;
	}

	public String export1() {
		initRequest();
		String ids = request.getParameter("ids");
		request.setAttribute("assetsInfoList", assetsInfoService.list(ids));
		return SUCCESS;
	}

	private AssetsInfoService assetsInfoService;
	private DataSystemService dataSystemService;
	private StaffInfoService staffInfoService;
	private SupplierInfoService supplierInfoService;
	private DataDeviceTypeService dataDeviceTypeService;
	private DataUsePlaceService dataUsePlaceService;
	private DataDeviceService dataDeviceService;
	private DataBrandService dataBrandService;
	private DataBrandFormatService dataBrandFormatService;

	public void setAssetsInfoService(AssetsInfoService assetsInfoService) {
		this.assetsInfoService = assetsInfoService;
	}

	public void setDataSystemService(DataSystemService dataSystemService) {
		this.dataSystemService = dataSystemService;
	}

	public void setStaffInfoService(StaffInfoService staffInfoService) {
		this.staffInfoService = staffInfoService;
	}

	public void setSupplierInfoService(SupplierInfoService supplierInfoService) {
		this.supplierInfoService = supplierInfoService;
	}

	public void setDataDeviceTypeService(DataDeviceTypeService dataDeviceTypeService) {
		this.dataDeviceTypeService = dataDeviceTypeService;
	}

	public void setDataUsePlaceService(DataUsePlaceService dataUsePlaceService) {
		this.dataUsePlaceService = dataUsePlaceService;
	}

	public void setDataDeviceService(DataDeviceService dataDeviceService) {
		this.dataDeviceService = dataDeviceService;
	}

	public void setDataBrandService(DataBrandService dataBrandService) {
		this.dataBrandService = dataBrandService;
	}

	public void setDataBrandFormatService(DataBrandFormatService dataBrandFormatService) {
		this.dataBrandFormatService = dataBrandFormatService;
	}

}
