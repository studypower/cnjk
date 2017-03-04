package com.disease_control.core.spring;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * 
 * @author yakov
 *
 */
public class SpringContext implements ApplicationContextAware {

	private static ApplicationContext ctx;

    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
    	SpringContext.ctx = applicationContext;
    }

    public static ApplicationContext getCtx() {
        return SpringContext.ctx;
    }

    public static void setCtx(ApplicationContext ctx) {
    	SpringContext.ctx = ctx;
    }
    
    /**
     * 根据JavaBean的名称，获取对象
     * @param beanName
     * @return
     */
	public static Object getBean(String beanName){
		return SpringContext.ctx.getBean(beanName);
	}

}