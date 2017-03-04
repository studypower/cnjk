package com.disease_control.web.form;

import java.util.Date;

import com.disease_control.core.status.BaseForm;
/**
 * 考勤日志表
 * @author 
 *
 */
public class WorkLog extends BaseForm{
     private int id;
     private int staffId;
     private int typeId;//工作状态
     private int entryId;//状态明细
     private Date startTime;//开始时间
     private Date endTime;//结束时间
     private int type;//上午/下午
     private int auditStatus;//审核状态
     private int workId;//考勤记录表Id
}
