package com.disease_control.web.form;

import java.io.File;
import java.util.Date;
import java.util.List;

import com.disease_control.core.status.BaseForm;

public class RecommendSupplier extends BaseForm {
	private int id;
	private int goodsBuyId;
	private List<Integer> supplierId;
	private List<Double> price;
	private int result;
	private List<String> fileUrl;
	private int status;

	private List<File> file;
	private List<String> fileType;
	private List<String> fileFileName;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getGoodsBuyId() {
		return goodsBuyId;
	}

	public void setGoodsBuyId(int goodsBuyId) {
		this.goodsBuyId = goodsBuyId;
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

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	public List<String> getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(List<String> fileUrl) {
		this.fileUrl = fileUrl;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
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

}
