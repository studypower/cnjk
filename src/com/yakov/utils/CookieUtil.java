package com.yakov.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtil {

	/**
	 * 返回一级域名
	 * 
	 * @param request
	 * @return
	 */
	public static String getDomain(HttpServletRequest request) {
		String str = request.getHeader("host");
		String[] hostStr = str.split(":");
		String host = hostStr[0];
		String[] strArr = host.split("\\.");
		int l = strArr.length;
		String domain = "";
		try {
			domain = "." + strArr[l - 2] + "." + strArr[l - 1];
		} catch (Exception e) {
			domain = "";
		}
		return domain;
	}

	/**
	 * 清理Cookie
	 * 
	 * @param response
	 * @param request
	 * @param cookieName
	 */
	public static void cleanCookie(HttpServletResponse response, HttpServletRequest request, String cookieName) {
		cleanCookie(response, request, cookieName, "/");
	}

	/**
	 * 
	 * @param response
	 * @param request
	 * @param cookieName
	 * @param path
	 */
	public static void cleanCookie(HttpServletResponse response, HttpServletRequest request, String cookieName, String path) {
		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
			if (cookie != null && cookieName.equals(cookie.getName())) {
				cookie.setDomain(getDomain(request));
				cookie.setPath(path);
				cookie.setMaxAge(0);
				cookie.setValue("");
				response.addCookie(cookie);
				break;
			}
		}
	}

	/**
	 * 书写Cookie
	 * 
	 * @param response
	 * @param request
	 * @param cookieName
	 * @param cookieStr
	 * @param maxAge
	 */
	public static void writerCookie(HttpServletResponse response, HttpServletRequest request, String cookieName, String cookieStr, int maxAge) {
		writerCookie(response, request, cookieName, cookieStr, maxAge, "/");
	}

	/**
	 * 书写Cookie
	 * 
	 * @param response
	 * @param request
	 * @param cookieName
	 * @param cookieStr
	 * @param maxAge
	 * @param path
	 */
	public static void writerCookie(HttpServletResponse response, HttpServletRequest request, String cookieName, String cookieStr, int maxAge, String path) {
		try {
			cookieStr = cookieStr.replace("\n", "");
			Cookie cookie = new Cookie(cookieName, cookieStr);
			cookie.setDomain(getDomain(request));
			cookie.setPath(path);
			cookie.setMaxAge(maxAge);
			response.addCookie(cookie);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 根据cookieName获取cookie值
	 * 
	 * @param request
	 * @param cookieName
	 * @return
	 */
	public static String getCookie(HttpServletRequest request, String cookieName) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookieName.equals(cookie.getName())) {
					return cookie.getValue();
				}
			}
		}
		return null;
	}

}
