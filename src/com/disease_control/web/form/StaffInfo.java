package com.disease_control.web.form;

import java.io.File;
import java.util.Date;

import com.disease_control.core.status.BaseForm;

/**
 * 员工信息
 * 
 * @author
 * 
 */
public class StaffInfo extends BaseForm {
	// 员工表Id
	private int id;
	// 员工姓名
	private String name;
	// 员工身份证编号
	private String IdNum;
	// 员工性别
	private int sex;
	// 出生年月
	private Date birthDate;
	// 年龄
	private int age;
	// 文化程度
	private int education;
	// 政治面貌
	private int politicalLandscape;
	// 住址
	private String address;
	// 邮箱地址
	private String email;
	// 座机号码/宅电
	private String landLine;
	// 手机号码
	private String phone;
	// 邮编
	private String zipCode;

	// 入职时间
	private Date enterTime;
	// 信息插入时间
	private Date insertTime;
	// 状态
	private int status;

	// 部门Id
	private int departmentId;
	// 职位Id
	private int positionId;

	private int trainingNotificationId;// 培训通知Id
	private Date startTime;
	private Date endTime;

	private String credentialsName;
	private int credentialsYear;

	private int workStatus;

	private File indexNumFile;
	private String indexNumFileType;
	private String indexNumFileFileName;

	private int indexNum;

	private int mzId;
	private int zcId;
	private int zcjbId;
	private int zzmmId;
	private int whcdId;
	private Date zcTime;

	private int startAge;
	private int endAge;

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

	public String getIdNum() {
		return IdNum;
	}

	public void setIdNum(String idNum) {
		IdNum = idNum;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}

	public int getPositionId() {
		return positionId;
	}

	public void setPositionId(int positionId) {
		this.positionId = positionId;
	}

	public String getLandLine() {
		return landLine;
	}

	public void setLandLine(String landLine) {
		this.landLine = landLine;
	}

	public Date getEnterTime() {
		return enterTime;
	}

	public void setEnterTime(Date enterTime) {
		this.enterTime = enterTime;
	}

	public Date getInsertTime() {
		return insertTime;
	}

	public void setInsertTime(Date insertTime) {
		this.insertTime = insertTime;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCredentialsName() {
		return credentialsName;
	}

	public void setCredentialsName(String credentialsName) {
		this.credentialsName = credentialsName;
	}

	public int getCredentialsYear() {
		return credentialsYear;
	}

	public void setCredentialsYear(int credentialsYear) {
		this.credentialsYear = credentialsYear;
	}

	public int getTrainingNotificationId() {
		return trainingNotificationId;
	}

	public void setTrainingNotificationId(int trainingNotificationId) {
		this.trainingNotificationId = trainingNotificationId;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public int getEducation() {
		return education;
	}

	public void setEducation(int education) {
		this.education = education;
	}

	public int getPoliticalLandscape() {
		return politicalLandscape;
	}

	public void setPoliticalLandscape(int politicalLandscape) {
		this.politicalLandscape = politicalLandscape;
	}

	public int getWorkStatus() {
		return workStatus;
	}

	public void setWorkStatus(int workStatus) {
		this.workStatus = workStatus;
	}

	public File getIndexNumFile() {
		return indexNumFile;
	}

	public void setIndexNumFile(File indexNumFile) {
		this.indexNumFile = indexNumFile;
	}

	public String getIndexNumFileType() {
		return indexNumFileType;
	}

	public void setIndexNumFileType(String indexNumFileType) {
		this.indexNumFileType = indexNumFileType;
	}

	public String getIndexNumFileFileName() {
		return indexNumFileFileName;
	}

	public void setIndexNumFileFileName(String indexNumFileFileName) {
		this.indexNumFileFileName = indexNumFileFileName;
	}

	public int getIndexNum() {
		return indexNum;
	}

	public void setIndexNum(int indexNum) {
		this.indexNum = indexNum;
	}

	public void setMzId(int mzId) {
		this.mzId = mzId;
	}

	public void setZcId(int zcId) {
		this.zcId = zcId;
	}

	public void setZcjbId(int zcjbId) {
		this.zcjbId = zcjbId;
	}

	public void setZzmmId(int zzmmId) {
		this.zzmmId = zzmmId;
	}

	public void setWhcdId(int whcdId) {
		this.whcdId = whcdId;
	}

	public int getMzId() {
		return mzId;
	}

	public int getZcId() {
		return zcId;
	}

	public int getZcjbId() {
		return zcjbId;
	}

	public int getZzmmId() {
		return zzmmId;
	}

	public int getWhcdId() {
		return whcdId;
	}

	public Date getZcTime() {
		return zcTime;
	}

	public void setZcTime(Date zcTime) {
		this.zcTime = zcTime;
	}

	public int getStartAge() {
		return startAge;
	}

	public void setStartAge(int startAge) {
		this.startAge = startAge;
	}

	public int getEndAge() {
		return endAge;
	}

	public void setEndAge(int endAge) {
		this.endAge = endAge;
	}

}
