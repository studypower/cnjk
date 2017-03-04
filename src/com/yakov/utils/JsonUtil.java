package com.yakov.utils;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

/**
 * 
 * @author YakovYu 2013-5-8 上午10:00:53
 * 
 */
public class JsonUtil {

	public static String ObjToJsonStr(Object obj) {
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		jsonConfig.registerJsonValueProcessor(Timestamp.class, new JsonTimestampValueProcessor());
		JSONObject jsonObject = JSONObject.fromObject(obj, jsonConfig);
		return jsonObject.toString();
	}

	public static String listToJsonStr(Object obj) {
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());
		jsonConfig.registerJsonValueProcessor(Timestamp.class, new JsonTimestampValueProcessor());
		JSONArray jsonArray = JSONArray.fromObject(obj, jsonConfig);
		return jsonArray.toString();
	}

	public static Map jsonStrToMap(String jsonStr) {
		return (Map) JSONObject.fromObject(jsonStr);
	}

	public static List jsonStrToList(String jsonStr) {
		return (List) JSONArray.fromObject(jsonStr);
	}

}
