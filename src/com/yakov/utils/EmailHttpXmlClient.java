package com.yakov.utils;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicHeader;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;

@SuppressWarnings("deprecation")
public class EmailHttpXmlClient {
	public static String client_id;
	public static String client_secret;
	static {
		try {
			Properties emailProperties = new Properties();
			URL url = EmailHttpXmlClient.class.getClassLoader().getResource("email.properties");
			emailProperties.load(new FileInputStream(url.getFile().replaceAll("%20", " ")));
			client_id = emailProperties.getProperty("client_id");
			client_secret = emailProperties.getProperty("client_secret");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 获取认证
	 */
	public static JSONObject getJsonOAuth(String client_id, String client_secret) {
		Map<String, String> paramsOAuth = new HashMap<String, String>();
		paramsOAuth.put("grant_type", "client_credentials");
		paramsOAuth.put("client_id", client_id);
		paramsOAuth.put("client_secret", client_secret);
		String jsonstr = post("https://exmail.qq.com/cgi-bin/token", paramsOAuth, null);
		if (StringUtils.isNotEmpty(jsonstr)) {
			JSONObject jsonOAuth = new JSONObject(jsonstr);
			return jsonOAuth;
		}
		return new JSONObject();
	}

	/**
	 * 获取用户认证
	 */
	public static JSONObject getJsonAuthkey(String alias, String token_type, String access_token) {
		List<Header> headerList = new ArrayList<Header>();
		headerList.add(new BasicHeader("Authorization", token_type + " " + access_token));
		Map<String, String> paramsAuthkey = new HashMap<String, String>();
		paramsAuthkey.put("alias", alias);
		JSONObject jsonAuthkey = new JSONObject(post("http://openapi.exmail.qq.com:12211/openapi/mail/authkey", paramsAuthkey, headerList));
		return jsonAuthkey;
	}

	/**
	 * 根据相关认证内容，拼接单点登录链接
	 */
	public static String getLoginUrl(String agent, String user, String ticket) {
		return "https://exmail.qq.com/cgi-bin/login?fun=bizopenssologin&method=bizauth&agent=" + agent + "&user=" + user + "&ticket=" + ticket;
	}

	public static JSONObject getNewCount(String alias, String token_type, String access_token) {
		List<Header> headerList = new ArrayList<Header>();
		headerList.add(new BasicHeader("Authorization", token_type + " " + access_token));
		Map<String, String> paramsAuthkey = new HashMap<String, String>();
		paramsAuthkey.put("alias", alias);
		JSONObject jsonNewcount = new JSONObject(post("http://openapi.exmail.qq.com:12211/openapi/mail/newcount", paramsAuthkey, headerList));
		return jsonNewcount;
	}

	public static String post(String url, Map<String, String> params, List<Header> headerList) {
		DefaultHttpClient httpclient = new DefaultHttpClient();
		String body = null;
		HttpPost post = postForm(url, params);
		if (headerList != null) {
			for (Header header : headerList) {
				post.addHeader(header);
			}
		}
		body = invoke(httpclient, post);
		httpclient.getConnectionManager().shutdown();
		return body;
	}

	private static String invoke(DefaultHttpClient httpclient, HttpUriRequest httpost) {
		HttpResponse response = sendRequest(httpclient, httpost);
		String body = paseResponse(response);
		return body;
	}

	private static String paseResponse(HttpResponse response) {
		if (response != null) {
			HttpEntity entity = response.getEntity();
			String body = null;
			try {
				body = EntityUtils.toString(entity, HTTP.UTF_8);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return body;
		}
		return "";
	}

	private static HttpResponse sendRequest(DefaultHttpClient httpclient, HttpUriRequest httpost) {
		HttpResponse response = null;
		try {
			response = httpclient.execute(httpost);
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return response;
	}

	private static HttpPost postForm(String url, Map<String, String> params) {
		HttpPost httpost = new HttpPost(url);
		List<NameValuePair> nvps = new ArrayList<NameValuePair>();
		if (params != null) {
			Set<String> keySet = params.keySet();
			for (String key : keySet) {
				nvps.add(new BasicNameValuePair(key, params.get(key)));
			}
		}
		try {
			httpost.setEntity(new UrlEncodedFormEntity(nvps, HTTP.UTF_8));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return httpost;
	}
}
