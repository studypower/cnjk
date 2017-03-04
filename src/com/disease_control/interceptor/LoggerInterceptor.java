package com.disease_control.interceptor;

import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Aspect;

/**
 * 日志拦截器
 * 
 * @author hqjiang
 * 
 */
@Aspect  
public class LoggerInterceptor  {
	Logger logger = Logger.getLogger(LoggerInterceptor.class);

	public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
		Class clazz=joinPoint.getSignature().getDeclaringType();
		Signature signatrue=joinPoint.getSignature();
		Object[] arguments=joinPoint.getArgs();
		// 拦截器获取参数
		StringBuffer str = new StringBuffer("[").append(clazz.getName()).append(".").append(signatrue.getName()).append("]:::");
		if (arguments != null && arguments.length > 0) {
			for (Object arg : arguments) {
				str.append(arg).append(" $$ ");
			}
		}
		logger.info(str.toString());
		Object obj=joinPoint.proceed();
		return obj;
	}
}
