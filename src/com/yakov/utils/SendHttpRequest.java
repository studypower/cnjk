package com.yakov.utils;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

/**
 * 
 * @author YakovYu 2013-5-30 下午2:32:12
 * 
 */
public class SendHttpRequest {

	public static String sendMsgPost(String addr, String param, String jsessionId) {
		String resultStr = "";
		try {
			URL httpUrl = new URL(addr);
			HttpURLConnection httpCon = (HttpURLConnection) httpUrl.openConnection();
			if (jsessionId != null) {
				httpCon.setRequestProperty("Cookie", jsessionId);
			}
			httpCon.setDoInput(true);
			httpCon.setDoOutput(true);
			PrintWriter out = new PrintWriter(httpCon.getOutputStream());
			out.print(param);
			out.flush();
			out.close();
			BufferedReader in = new BufferedReader(new InputStreamReader(httpCon.getInputStream()));
			String line;
			while ((line = in.readLine()) != null) {
				resultStr += line;
			}
			in.close();
			httpCon.disconnect();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return resultStr;
	}

	/**
	 * 发送Get请求
	 * 
	 * @param addr
	 * @param param
	 * @return
	 */
	public static String sendMsgGet(String addr, String param, String jsessionId) {
		String resultStr = "";
		try {
			addr = addr + "?" + param;
			URL httpUrl = new URL(addr);
			HttpURLConnection httpCon = (HttpURLConnection) httpUrl.openConnection();
			httpCon.setConnectTimeout(5000);
			httpCon.setReadTimeout(5000);
			if (jsessionId != null) {
				httpCon.setRequestProperty("Cookie", jsessionId);
			}
			BufferedReader in = new BufferedReader(new InputStreamReader(httpCon.getInputStream(), "UTF-8"));
			String line;
			while ((line = in.readLine()) != null) {
				resultStr += line;
			}
			in.close();
			httpCon.disconnect();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return resultStr;
	}

	/**
	 * 获取jSessionId。
	 * 
	 * @param addr
	 * @return
	 */
	public static String getSessionId(String addr) {
		String jSessionId = "";
		try {
			URL httpUrl = new URL(addr);
			HttpURLConnection httpCon = (HttpURLConnection) httpUrl.openConnection();
			jSessionId = httpCon.getHeaderField("Set-Cookie").split(";")[0];
			httpCon.disconnect();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return jSessionId;
	}

	/**
	 * 获取网络文件并存档
	 * 
	 * @param fileUrl
	 *            文件URL
	 * @param dirUrl
	 *            存放位置
	 * @return
	 */
	public static boolean saveUrlAs(String fileUrl, String dirUrl, String fileName) {
		try {
			File dirFile = new File(dirUrl);
			if (!dirFile.exists()) {
				dirFile.mkdirs();
			}
			URL url = new URL(fileUrl);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			DataInputStream in = new DataInputStream(connection.getInputStream());
			DataOutputStream out = new DataOutputStream(new FileOutputStream(dirUrl + fileName));
			byte[] buffer = new byte[4096];
			int count = 0;
			while ((count = in.read(buffer)) > 0) {
				out.write(buffer, 0, count);
			}
			out.close();
			in.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public static boolean saveUrlAs(String fileUrl, String dirUrl) {
		return saveUrlAs(fileUrl, dirUrl, fileUrl.substring(fileUrl.lastIndexOf("/")));
	}

}
