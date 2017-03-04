package com.disease_control.web.form;

import java.io.File;
import java.util.Date;
import java.util.List;

import com.disease_control.core.status.BaseForm;

/**
 * 物品采购
 * 
 * @author
 * 
 */
public class GoodsBuyInfo extends BaseForm {
	private int id;
	private String name;
	private int fundsApplyId;
	private int createStaffId;
	private Date createTime;
	private List<RecommendSupplier> recommendSupplierList;
	private List<DepotRkEntry> fundsApplyStockEntryList;
	private int step;
	private int status;

	private int auditStaffId;// 审核人
	private Date auditTime;// 审核时间
	private String auditRemark;// 审核意见
	private int buyStaffId;// 采购人
	private Date buyTime;// 采购时间
	private int acceptanceStaffId;// 验收人
	private Date acceptanceTime;// 验收时间
	private int storageStaffId;// 入库人
	private Date storageTime;// 入库时间

	private List<Integer> buyAmount;// 已采购数量
	private List<Integer> stockEntryId;// 采购明细表Id
	private List<Integer> currentBuyAmount;// 当前采购数量

	private List<Integer> supplierId;
	private List<Double> price;
	private List<File> file;
	private List<String> fileType;
	private List<String> fileFileName;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getFundsApplyId() {
		return fundsApplyId;
	}

	public void setFundsApplyId(int fundsApplyId) {
		this.fundsApplyId = fundsApplyId;
	}

	public int getCreateStaffId() {
		return createStaffId;
	}

	public void setCreateStaffId(int createStaffId) {
		this.createStaffId = createStaffId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
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

	public int getAuditStaffId() {
		return auditStaffId;
	}

	public void setAuditStaffId(int auditStaffId) {
		this.auditStaffId = auditStaffId;
	}

	public Date getAuditTime() {
		return auditTime;
	}

	public void setAuditTime(Date auditTime) {
		this.auditTime = auditTime;
	}

	public String getAuditRemark() {
		return auditRemark;
	}

	public void setAuditRemark(String auditRemark) {
		this.auditRemark = auditRemark;
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

	public int getAcceptanceStaffId() {
		return acceptanceStaffId;
	}

	public void setAcceptanceStaffId(int acceptanceStaffId) {
		this.acceptanceStaffId = acceptanceStaffId;
	}

	public Date getAcceptanceTime() {
		return acceptanceTime;
	}

	public void setAcceptanceTime(Date acceptanceTime) {
		this.acceptanceTime = acceptanceTime;
	}

	public int getStorageStaffId() {
		return storageStaffId;
	}

	public void setStorageStaffId(int storageStaffId) {
		this.storageStaffId = storageStaffId;
	}

	public Date getStorageTime() {
		return storageTime;
	}

	public void setStorageTime(Date storageTime) {
		this.storageTime = storageTime;
	}

	public List<Integer> getBuyAmount() {
		return buyAmount;
	}

	public void setBuyAmount(List<Integer> buyAmount) {
		this.buyAmount = buyAmount;
	}

	public List<Integer> getStockEntryId() {
		return stockEntryId;
	}

	public void setStockEntryId(List<Integer> stockEntryId) {
		this.stockEntryId = stockEntryId;
	}

	public List<Integer> getCurrentBuyAmount() {
		return currentBuyAmount;
	}

	public void setCurrentBuyAmount(List<Integer> currentBuyAmount) {
		this.currentBuyAmount = currentBuyAmount;
	}

	public List<RecommendSupplier> getRecommendSupplierList() {
		return recommendSupplierList;
	}

	public void setRecommendSupplierList(List<RecommendSupplier> recommendSupplierList) {
		this.recommendSupplierList = recommendSupplierList;
	}

	public List<Integer> getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(List<Integer> supplierId) {
		this.supplierId = supplierId;
	}

	public List<Double> getPrice() {
		return price;
	}

	public void setPrice(List<Double> price) {
		this.price = price;
	}

	public List<File> getFile() {
		return file;
	}

	public void setFile(List<File> file) {
		this.file = file;
	}

	public List<String> getFileType() {
		return fileType;
	}

	public void setFileType(List<String> fileType) {
		this.fileType = fileType;
	}

	public List<String> getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(List<String> fileFileName) {
		this.fileFileName = fileFileName;
	}

	public List<DepotRkEntry> getFundsApplyStockEntryList() {
		return fundsApplyStockEntryList;
	}

	public void setFundsApplyStockEntryList(List<DepotRkEntry> fundsApplyStockEntryList) {
		this.fundsApplyStockEntryList = fundsApplyStockEntryList;
	}

}
