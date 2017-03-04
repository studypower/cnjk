package com.disease_control.web.form;

import java.io.File;
import java.util.Date;

import com.disease_control.core.status.BaseForm;

/**
 * 经费审批
 * 
 * @author
 * 
 */
public class FundsApproval extends BaseForm {
	private int id;
	private int applyId;// 经费申请表Id
	private int approvalStaffId;// 审批人Id
	private Date approvalTime;// 审批时间
	private int result;// 审批结果
	private String remark;// 审批意见
	private String fileName;
	private String fileUrl;// 资料地址
	private int step;
	private FundsApplyInfo fundsApplyInfo;

	private File approvalFile;
	private String approvalFileType;
	private String approvalFileFileName;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getApplyId() {
		return applyId;
	}

	public void setApplyId(int applyId) {
		this.applyId = applyId;
	}

	public int getApprovalStaffId() {
		return approvalStaffId;
	}

	public void setApprovalStaffId(int approvalStaffId) {
		this.approvalStaffId = approvalStaffId;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public Date getApprovalTime() {
		return approvalTime;
	}

	public void setApprovalTime(Date approvalTime) {
		this.approvalTime = approvalTime;
	}

	public File getApprovalFile() {
		if (approvalFileFileName == null || "".equals(approvalFileFileName)) {
			return null;
		}
		return approvalFile;
	}

	public void setApprovalFile(File approvalFile) {
		this.approvalFile = approvalFile;
	}

	public String getApprovalFileType() {
		return approvalFileType;
	}

	public void setApprovalFileType(String approvalFileType) {
		this.approvalFileType = approvalFileType;
	}

	public FundsApplyInfo getFundsApplyInfo() {
		return fundsApplyInfo;
	}

	public void setFundsApplyInfo(FundsApplyInfo fundsApplyInfo) {
		this.fundsApplyInfo = fundsApplyInfo;
	}

	public String getApprovalFileFileName() {
		return approvalFileFileName;
	}

	public void setApprovalFileFileName(String approvalFileFileName) {
		this.approvalFileFileName = approvalFileFileName;
	}
}
