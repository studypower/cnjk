package com.disease_control.core.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;

import com.disease_control.core.config.SystemConfig;

public class SystemListener implements ServletContextListener {
 
	private static Logger logger = Logger.getLogger(ServletContextListener.class.getName());

	@Override
	public void contextDestroyed(ServletContextEvent servletContextEvent) {

	}

	@Override
	public void contextInitialized(ServletContextEvent servletContextEvent) {
		// 初始化项目路径
		SystemConfig.SYS_URL = servletContextEvent.getServletContext().getRealPath(SystemConfig.FILE_SEPARATOR);
	}

}
