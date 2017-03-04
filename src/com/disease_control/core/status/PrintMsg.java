package com.disease_control.core.status;

import java.io.PrintWriter;
import java.util.HashMap;

import com.yakov.utils.JsonUtil;

public class PrintMsg {

	public static void printErrorMsg(PrintWriter printWriter,String requestUrl, int errorCode, String errorMsg) {
		HashMap errorMap = new HashMap();
		errorMap.put("request_url", requestUrl);
		errorMap.put("error_code", errorCode);
		errorMap.put("error_msg", errorMsg);
		printWriter.println(JsonUtil.ObjToJsonStr(errorMap));
	}

}
