package com.disease_control.core.config;

import java.util.HashMap;

public class SystemConfig {

	public static String SYS_URL = "";

	public static String CURRENT_USER = "currentUser";

	// 系统初始化状态
	public static int INITIALIZE_STATUS = 0;

	public final static String FILE_SEPARATOR = System.getProperty("file.separator");

	public final static int BUSINESS_DEPARTMENT_ID = 3; // 业务部ID
	public final static int EIGINEERING_DEPARTMENT_ID = 6; // 工程部ID
	public final static int OPERATION_DEPARTMENT_ID = 7; // 运行部ID

	public final static int PROJECT_SURVEY_TYPE_GC = 1; // 工程项目勘测ID
	public final static int PROJECT_SURVEY_TYPE_YX = 2; // 运行项目勘测ID

	public final static int PROJECT_TENDER_TYPE_JS = 1;// 标书类别技术ID
	public final static int PROJECT_TENDER_TYPE_SW = 2;// 标书类别商务ID

	public final static HashMap<String, HashMap<String, String>> DATA_COLUMN_TYPES = new HashMap<String, HashMap<String, String>>();
	static {
		HashMap<String, String> dataColumnType = new HashMap<String, String>();
		dataColumnType.put("name", "整数");
		dataColumnType.put("value", "int");
		dataColumnType.put("length", "11");
		DATA_COLUMN_TYPES.put("int", dataColumnType);

		dataColumnType = new HashMap<String, String>();
		dataColumnType.put("name", "浮点数");
		dataColumnType.put("value", "double");
		dataColumnType.put("length", "0");
		DATA_COLUMN_TYPES.put("double", dataColumnType);

		dataColumnType = new HashMap<String, String>();
		dataColumnType.put("name", "字符");
		dataColumnType.put("value", "varchar");
		dataColumnType.put("length", "255");
		DATA_COLUMN_TYPES.put("varchar", dataColumnType);

		dataColumnType = new HashMap<String, String>();
		dataColumnType.put("name", "长字符");
		dataColumnType.put("value", "text");
		dataColumnType.put("length", "0");
		DATA_COLUMN_TYPES.put("text", dataColumnType);

		dataColumnType = new HashMap<String, String>();
		dataColumnType.put("name", "日期");
		dataColumnType.put("value", "date");
		dataColumnType.put("length", "0");
		DATA_COLUMN_TYPES.put("date", dataColumnType);

		dataColumnType = new HashMap<String, String>();
		dataColumnType.put("name", "日期时间");
		dataColumnType.put("value", "datetime");
		dataColumnType.put("length", "0");
		DATA_COLUMN_TYPES.put("datetime", dataColumnType);
	}

	public static float TX_XISU_GZRI = 0.5f;// 调休天数系数 工作日
	public static float TX_XISU_SHUANGXIU = 1.5f;// 调休天数系数 双休
	public static float TX_XISU_SANXINRI = 1.5f;// 调休天数系数 三薪日

	public static float ZBF_XISU_GZRI = 1f;// 值班费双休日系数
	public static float ZBF_XISU_SHUANGXIU = 3f;// 值班费双休日系数
	public static float ZBF_XISU_SANXINRI = 4.5f;// 值班费三薪日系数
}
