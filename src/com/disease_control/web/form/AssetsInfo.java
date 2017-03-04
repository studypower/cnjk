package com.disease_control.web.form;

import java.io.File;
import java.util.Date;

import com.disease_control.core.status.BaseForm;

public class AssetsInfo extends BaseForm {

	private int id; // 自增长ID
	private String num; // 编号
	private String name; // 名称
	private int storageModeId=-100; // 获得模式
	private int deviceTypeId; // 设备类别ID
	private int deviceId; // 设备ID
	private int brandId; // 品牌ID
	private int brandFormatId; // 品牌型号ID
	private String serialNumber; // 流水号
	private String originPlace; // 产地
	private String measureUnit; // 计量单位
	private int amount; // 数量
	private double unitPrice; // 单价
	private double unitPrice1; // 实际单价
	private String invoiceNumber; // 发票号码
	private int useSituationId=-100; // 使用情况
	private int serviceSituationId=-100; // 维修情况
	private String serviceFirm; // 服务企业
	private int supplierId; // 供应商ID
	private int buyStaffId; // 购买员工ID
	private Date buyTime; // 购买时间
	private int signStaffId; // 签收员工ID
	private Date signTime; // 签收时间
	private int depotStaffId; // 入库员工ID
	private Date depotTime; // 入库时间
	private int usePlaceId; // 使用地点ID
	private String remark; // 备注
	private int status; // 状态
	
	private int useStaffId;
	
	private AssetsInfoLog assetsInfoLog;
	
	
	private File dataFile;
	private String dataFileType;
	private String dataFileFileName;


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getStorageModeId() {
		return storageModeId;
	}

	public void setStorageModeId(int storageModeId) {
		this.storageModeId = storageModeId;
	}

	public int getDeviceTypeId() {
		return deviceTypeId;
	}

	public void setDeviceTypeId(int deviceTypeId) {
		this.deviceTypeId = deviceTypeId;
	}

	public int getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(int deviceId) {
		this.deviceId = deviceId;
	}

	public int getBrandId() {
		return brandId;
	}

	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}

	public int getBrandFormatId() {
		return brandFormatId;
	}

	public void setBrandFormatId(int brandFormatId) {
		this.brandFormatId = brandFormatId;
	}

	public String getSerialNumber() {
		return serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

	public String getOriginPlace() {
		return originPlace;
	}

	public void setOriginPlace(String originPlace) {
		this.originPlace = originPlace;
	}

	public String getMeasureUnit() {
		return measureUnit;
	}

	public void setMeasureUnit(String measureUnit) {
		this.measureUnit = measureUnit;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public double getUnitPrice1() {
		return unitPrice1;
	}

	public void setUnitPrice1(double unitPrice1) {
		this.unitPrice1 = unitPrice1;
	}

	public String getInvoiceNumber() {
		return invoiceNumber;
	}

	public void setInvoiceNumber(String invoiceNumber) {
		this.invoiceNumber = invoiceNumber;
	}

	public int getUseSituationId() {
		return useSituationId;
	}

	public void setUseSituationId(int useSituationId) {
		this.useSituationId = useSituationId;
	}

	public int getServiceSituationId() {
		return serviceSituationId;
	}

	public void setServiceSituationId(int serviceSituationId) {
		this.serviceSituationId = serviceSituationId;
	}

	public String getServiceFirm() {
		return serviceFirm;
	}

	public void setServiceFirm(String serviceFirm) {
		this.serviceFirm = serviceFirm;
	}

	public int getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}

	public int getBuyStaffId() {
		return buyStaffId;
	}

	public void setBuyStaffId(int buyStaffId) {
		this.buyStaffId = buyStaffId;
	}

	public Date getBuyTime() {
		return buyTime;
	}

	public void setBuyTime(Date buyTime) {
		this.buyTime = buyTime;
	}

	public int getSignStaffId() {
		return signStaffId;
	}

	public void setSignStaffId(int signStaffId) {
		this.signStaffId = signStaffId;
	}

	public Date getSignTime() {
		return signTime;
	}

	public void setSignTime(Date signTime) {
		this.signTime = signTime;
	}

	public int getDepotStaffId() {
		return depotStaffId;
	}

	public void setDepotStaffId(int depotStaffId) {
		this.depotStaffId = depotStaffId;
	}

	public Date getDepotTime() {
		return depotTime;
	}

	public void setDepotTime(Date depotTime) {
		this.depotTime = depotTime;
	}

	public int getUsePlaceId() {
		return usePlaceId;
	}

	public void setUsePlaceId(int usePlaceId) {
		this.usePlaceId = usePlaceId;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public AssetsInfoLog getAssetsInfoLog() {
		return assetsInfoLog;
	}

	public void setAssetsInfoLog(AssetsInfoLog assetsInfoLog) {
		this.assetsInfoLog = assetsInfoLog;
	}

	public int getUseStaffId() {
		return useStaffId;
	}

	public void setUseStaffId(int useStaffId) {
		this.useStaffId = useStaffId;
	}

	public File getDataFile() {
		if(dataFileFileName==null||"".equals(dataFileFileName)){
			return null;
		}
		return dataFile;
	}

	public void setDataFile(File dataFile) {
		this.dataFile = dataFile;
	}

	public String getDataFileType() {
		return dataFileType;
	}

	public void setDataFileType(String dataFileType) {
		this.dataFileType = dataFileType;
	}

	public String getDataFileFileName() {
		return dataFileFileName;
	}

	public void setDataFileFileName(String dataFileFileName) {
		this.dataFileFileName = dataFileFileName;
	}

}
