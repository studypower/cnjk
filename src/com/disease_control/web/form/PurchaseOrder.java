package com.disease_control.web.form;

import java.io.File;
import java.util.Date;
import java.util.List;

import com.disease_control.core.status.BaseForm;

public class PurchaseOrder extends BaseForm {

	private int id;
	private int fundsApplyId;
	private String name;
	private int type = -100;
	private int cgType; // 1--集采,2--政采
	private int step;
	private int status;
	private int signSupplierId;
	private String signContractNum;
	private Date createTime;

	private List<PurchaseOrderEntry> purchaseOrderEntryList;
	private List<Integer> fundsApplyEntryId;
	private List<Integer> amount;

	private List<PurchaseOrderSupplier> purchaseOrderSupplierList;
	private List<Integer> supplierId;
	private List<Double> supplierMoney;
	private List<File> supplierFile;
	private List<String> supplierFileType;
	private List<String> supplierFileFileName;
	private List<Integer> supplierStatus;

	private PurchaseOrderAudit purchaseOrderAudit;
	private String ysdKey;
	private Date ysTime;
	private String rkdKey;
	private Date rkTime;

	private int selectedSupplierId;

	private Date startTime;
	private Date endTime;
	private String fundsApplyNum;

	private List<Integer> purchaseOrderEntryId;
	private List<Integer> purchaseOrderEntryAmount;

	private String cgFileUrl;
	private String ysFileUrl;

	private List<File> cgFile;
	private List<String> cgFileType;
	private List<String> cgFileFileName;

	private List<File> ysFile;
	private List<String> ysFileType;
	private List<String> ysFileFileName;

	private List<Integer> deviceTypeId;
	private List<Integer> deviceId;
	private List<Integer> brandId;
	private List<Integer> brandFormatId;
	private List<Double> money;
	private List<DepotRkEntry> depotRkEntryList;

	private List<DataFileInfo> dataFileInfoList;
	private String zcRemark;

	public String getYsdKey() {
		return ysdKey;
	}

	public void setYsdKey(String ysdKey) {
		this.ysdKey = ysdKey;
	}

	public Date getYsTime() {
		return ysTime;
	}

	public void setYsTime(Date ysTime) {
		this.ysTime = ysTime;
	}

	public String getRkdKey() {
		return rkdKey;
	}

	public void setRkdKey(String rkdKey) {
		this.rkdKey = rkdKey;
	}

	public Date getRkTime() {
		return rkTime;
	}

	public void setRkTime(Date rkTime) {
		this.rkTime = rkTime;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getFundsApplyId() {
		return fundsApplyId;
	}

	public void setFundsApplyId(int fundsApplyId) {
		this.fundsApplyId = fundsApplyId;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public List<PurchaseOrderEntry> getPurchaseOrderEntryList() {
		return purchaseOrderEntryList;
	}

	public void setPurchaseOrderEntryList(List<PurchaseOrderEntry> purchaseOrderEntryList) {
		this.purchaseOrderEntryList = purchaseOrderEntryList;
	}

	public List<Integer> getFundsApplyEntryId() {
		return fundsApplyEntryId;
	}

	public void setFundsApplyEntryId(List<Integer> fundsApplyEntryId) {
		this.fundsApplyEntryId = fundsApplyEntryId;
	}

	public List<Integer> getAmount() {
		return amount;
	}

	public void setAmount(List<Integer> amount) {
		this.amount = amount;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public List<Integer> getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(List<Integer> supplierId) {
		this.supplierId = supplierId;
	}

	public List<Double> getSupplierMoney() {
		return supplierMoney;
	}

	public void setSupplierMoney(List<Double> supplierMoney) {
		this.supplierMoney = supplierMoney;
	}

	public List<File> getSupplierFile() {
		return supplierFile;
	}

	public void setSupplierFile(List<File> supplierFile) {
		this.supplierFile = supplierFile;
	}

	public List<String> getSupplierFileType() {
		return supplierFileType;
	}

	public void setSupplierFileType(List<String> supplierFileType) {
		this.supplierFileType = supplierFileType;
	}

	public List<String> getSupplierFileFileName() {
		return supplierFileFileName;
	}

	public void setSupplierFileFileName(List<String> supplierFileFileName) {
		this.supplierFileFileName = supplierFileFileName;
	}

	public List<PurchaseOrderSupplier> getPurchaseOrderSupplierList() {
		return purchaseOrderSupplierList;
	}

	public void setPurchaseOrderSupplierList(List<PurchaseOrderSupplier> purchaseOrderSupplierList) {
		this.purchaseOrderSupplierList = purchaseOrderSupplierList;
	}

	public List<Integer> getSupplierStatus() {
		return supplierStatus;
	}

	public void setSupplierStatus(List<Integer> supplierStatus) {
		this.supplierStatus = supplierStatus;
	}

	public PurchaseOrderAudit getPurchaseOrderAudit() {
		return purchaseOrderAudit;
	}

	public void setPurchaseOrderAudit(PurchaseOrderAudit purchaseOrderAudit) {
		this.purchaseOrderAudit = purchaseOrderAudit;
	}

	public int getSignSupplierId() {
		return signSupplierId;
	}

	public void setSignSupplierId(int signSupplierId) {
		this.signSupplierId = signSupplierId;
	}

	public String getSignContractNum() {
		return signContractNum;
	}

	public void setSignContractNum(String signContractNum) {
		this.signContractNum = signContractNum;
	}

	public int getSelectedSupplierId() {
		return selectedSupplierId;
	}

	public void setSelectedSupplierId(int selectedSupplierId) {
		this.selectedSupplierId = selectedSupplierId;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getFundsApplyNum() {
		return fundsApplyNum;
	}

	public void setFundsApplyNum(String fundsApplyNum) {
		this.fundsApplyNum = fundsApplyNum;
	}

	public List<Integer> getPurchaseOrderEntryId() {
		return purchaseOrderEntryId;
	}

	public void setPurchaseOrderEntryId(List<Integer> purchaseOrderEntryId) {
		this.purchaseOrderEntryId = purchaseOrderEntryId;
	}

	public List<Integer> getPurchaseOrderEntryAmount() {
		return purchaseOrderEntryAmount;
	}

	public void setPurchaseOrderEntryAmount(List<Integer> purchaseOrderEntryAmount) {
		this.purchaseOrderEntryAmount = purchaseOrderEntryAmount;
	}

	public String getCgFileUrl() {
		return cgFileUrl;
	}

	public void setCgFileUrl(String cgFileUrl) {
		this.cgFileUrl = cgFileUrl;
	}

	public String getYsFileUrl() {
		return ysFileUrl;
	}

	public void setYsFileUrl(String ysFileUrl) {
		this.ysFileUrl = ysFileUrl;
	}

	public List<File> getCgFile() {
		return cgFile;
	}

	public void setCgFile(List<File> cgFile) {
		this.cgFile = cgFile;
	}

	public List<String> getCgFileType() {
		return cgFileType;
	}

	public void setCgFileType(List<String> cgFileType) {
		this.cgFileType = cgFileType;
	}

	public List<String> getCgFileFileName() {
		return cgFileFileName;
	}

	public void setCgFileFileName(List<String> cgFileFileName) {
		this.cgFileFileName = cgFileFileName;
	}

	public List<File> getYsFile() {
		return ysFile;
	}

	public void setYsFile(List<File> ysFile) {
		this.ysFile = ysFile;
	}

	public List<String> getYsFileType() {
		return ysFileType;
	}

	public void setYsFileType(List<String> ysFileType) {
		this.ysFileType = ysFileType;
	}

	public List<String> getYsFileFileName() {
		return ysFileFileName;
	}

	public void setYsFileFileName(List<String> ysFileFileName) {
		this.ysFileFileName = ysFileFileName;
	}

	public List<Integer> getDeviceTypeId() {
		return deviceTypeId;
	}

	public void setDeviceTypeId(List<Integer> deviceTypeId) {
		this.deviceTypeId = deviceTypeId;
	}

	public List<Integer> getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(List<Integer> deviceId) {
		this.deviceId = deviceId;
	}

	public List<Integer> getBrandId() {
		return brandId;
	}

	public void setBrandId(List<Integer> brandId) {
		this.brandId = brandId;
	}

	public List<Integer> getBrandFormatId() {
		return brandFormatId;
	}

	public void setBrandFormatId(List<Integer> brandFormatId) {
		this.brandFormatId = brandFormatId;
	}

	public List<DepotRkEntry> getDepotRkEntryList() {
		return depotRkEntryList;
	}

	public void setDepotRkEntryList(List<DepotRkEntry> depotRkEntryList) {
		this.depotRkEntryList = depotRkEntryList;
	}

	public List<Double> getMoney() {
		return money;
	}

	public void setMoney(List<Double> money) {
		this.money = money;
	}

	public int getCgType() {
		return cgType;
	}

	public void setCgType(int cgType) {
		this.cgType = cgType;
	}

	public List<DataFileInfo> getDataFileInfoList() {
		return dataFileInfoList;
	}

	public void setDataFileInfoList(List<DataFileInfo> dataFileInfoList) {
		this.dataFileInfoList = dataFileInfoList;
	}

	public String getZcRemark() {
		return zcRemark;
	}

	public void setZcRemark(String zcRemark) {
		this.zcRemark = zcRemark;
	}

}
