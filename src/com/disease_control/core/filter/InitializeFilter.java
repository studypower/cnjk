package com.disease_control.core.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

public class InitializeFilter implements Filter {
	
	private static Logger logger = Logger.getLogger(InitializeFilter.class.getName());

	public void destroy() {
	}

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		HttpSession session = request.getSession();
		session.setAttribute("SYSTEM_NAME", "上海市长宁区疾病预防控制中心");
		chain.doFilter(request, response); 
	} 
 
	public void init(FilterConfig config) throws ServletException {
	}
}
