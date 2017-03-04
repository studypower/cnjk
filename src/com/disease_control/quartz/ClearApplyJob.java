package com.disease_control.quartz;

import org.apache.log4j.Logger;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.disease_control.service.CarUseApplyService;
import com.disease_control.service.MeetingRoomApplyService;

public class ClearApplyJob extends QuartzJobBean {

	private static Logger logger = Logger.getLogger(ClearApplyJob.class.getName());

	protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException {
		carUseApplyService.clearApply();
		meetingRoomApplyService.clearApply();
	}

	private CarUseApplyService carUseApplyService;
	private MeetingRoomApplyService meetingRoomApplyService;

	public void setCarUseApplyService(CarUseApplyService carUseApplyService) {
		this.carUseApplyService = carUseApplyService;
	}

	public void setMeetingRoomApplyService(MeetingRoomApplyService meetingRoomApplyService) {
		this.meetingRoomApplyService = meetingRoomApplyService;
	}
}
