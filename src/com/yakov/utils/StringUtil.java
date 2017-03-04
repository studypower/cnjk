package com.yakov.utils;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class StringUtil {

	private static Log log = LogFactory.getLog(StringUtil.class);

	public static String[] stringToArray(String str) {// 'name','sku','price','status','visibility','color'
		str = str.replaceAll("'", "");
		String[] result = str.split(",");
		return result;
	}

	public static String arrayToString(String[] strArr) {// 'name','sku','price','status','visibility','color'
		String str = "";
		for (String temp : strArr) {
			if (!str.equals("")) {
				str = str + ",'" + temp + "'";
			} else {
				str = "'" + temp + "'";
			}

		}
		return str;
	}

	public static String arrayToString(String[] strArr, String charStr) {// 'name','sku','price','status','visibility','color'
		String str = "";
		for (String temp : strArr) {
			if (!str.equals("")) {
				str = str + charStr + temp;
			} else {
				str = temp;
			}
		}
		return str;
	}

	public static String tableNameToOrmName(String tableName) {// product_entity_datetime
		String ormName = "";// ProductEntityDatetime
		String _Arr[] = tableName.split("_");
		for (int i = 0; i < _Arr.length; i++) {
			ormName = ormName + _Arr[i].substring(0, 1).toUpperCase() + _Arr[i].substring(1);// ����ĸ��д
		}
		return ormName;
	}

	public static String getSubString(String str, char begin, char end) {// ȡ���ƶ�����Char֮����ַ�"[we]",'[',']'�Ľ����we
		int indexBegin = str.indexOf(begin);
		int indexEnd = str.indexOf(end);
		String subString = str.substring(indexBegin + 1, indexEnd);
		return subString;
	}

	public static String encodeString_iso2utf8(String str) {
		try {
			String s = new String(str.getBytes("ISO8859_1"), "utf-8");
			return s;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
	}

	public static String encodeString(String str, String srcCharset, String decCharset) {
		try {
			String s = new String(str.getBytes(srcCharset), decCharset);
			return s;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
	}

	public static String getObjectName(Object obj) {
		return obj.getClass().getName();
	}

	public static String getTableType(Object obj) {
		return getObjectName(obj).substring(getObjectName(obj).lastIndexOf("Entity"));
	}

	public static short getAttributeId(Object obj) {
		Short attritbueId = 0;
		Object[] param = new Object[] {};
		Class[] classArgs = new Class[param.length];
		// String tableType = getTableType(obj);
		try {
			Method method = obj.getClass().getMethod("getAttributeId", classArgs);
			attritbueId = (Short) method.invoke(obj, param);

		} catch (Exception e) {

			e.printStackTrace();
		}
		return attritbueId;
	}

	public static int getEntityId(Object obj) {
		return (Integer) getObjectValueByGetName(obj, "getEntityId");
	}

	public static Object getAttributeValue(Object obj) {
		return getObjectValueByGetName(obj, "getValue");

	}

	public static Object getAttributeValueId(Object obj) {
		return getObjectValueByGetName(obj, "getValueId");

	}

	public static Object getObjectValueByGetName(Object obj, String getName) {
		Object objectValue = null;
		Object[] param = new Object[] {};
		Class[] classArgs = new Class[param.length];

		try {
			Method method = obj.getClass().getMethod(getName, classArgs);
			objectValue = method.invoke(obj, param);
		} catch (Exception e) {
			// e.printStackTrace();
			return "";
		}
		if (null != objectValue) {
			return objectValue;
		} else {
			return "";
		}

	}

	public static String[] getEavAttributeArray(String[] cloumns) {
		String[] result = new String[cloumns.length];
		for (int i = 0; i < cloumns.length; i++) {
			result[i] = cloumns[i].substring(0, cloumns[i].indexOf(","));
		}
		return result;
	}

	// public static String getParamValue(HttpServletRequest request, String
	// attributeName, Map chechboxParamMap, String startWith){//����checkbox��ֵ
	// if(chechboxParamMap.get(startWith + attributeName) ==
	// null){//�����checkbox
	// return null;
	// }else{
	// return request.getParameter(startWith + attributeName);//��checkbox�򷵻�
	// }
	// }

	// ��װҳ���checkbox��һ������
	public static Map<String, String> getParamMap(HttpServletRequest request, String startWith) {
		Map<String, String> chechboxParamMap = new HashMap<String, String>();
		Map paramMap = request.getParameterMap();
		Iterator it = paramMap.keySet().iterator();
		while (it.hasNext()) {
			String paramName = (String) it.next();
			if (paramName.startsWith(startWith)) {
				chechboxParamMap.put(paramName, request.getParameter(paramName));
			}
		}
		return chechboxParamMap;
	}

	// public static void main(String[] args) {
	// // String str = "'name','sku','price','status','visibility','color'";
	// // String[] strArr = stringToArray(str);
	// //
	// // System.out.println(arrayToString(strArr));
	//
	// // System.out.println(tableNameToOrmName("product_entity_datetime"));
	//
	// BigDecimal dec = new BigDecimal("10");
	// System.out.println(getObjectName(dec));//java.math.BigDecimal
	//
	//
	//
	// }

	public static int getRandomNum(int num)// ȡ��ָ��λ������������
	{
		String random = "";
		Random r = new Random();
		for (int j = 1; j <= num; j++) {
			Integer i = new Integer(Math.abs(r.nextInt()) % 10);
			random = random + i.toString();
		}
		return new Integer(random);
	}

	public static int getInt(String s) {
		return Integer.parseInt(s);
	}

	/**
	 * ���ַ�ת��������ֵ�����ת��ʧ��,�򷵻�Ĭ��ֵ
	 * 
	 * @param stringValue
	 *            Ҫת�����ַ�
	 * @param defValue
	 *            ���ת��ʧ��,Ҫ���ص�Ĭ��ֵ
	 * @return
	 */
	public static int getInt(String stringValue, int defValue) {
		int intValue = defValue;
		if (!isInvalid(stringValue)) {
			try {
				intValue = Integer.parseInt(stringValue);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		return intValue;
	}

	/**
	 * ����յķ���,������Ϊ���򷵻ؿ��ַ�
	 * 
	 * @param obj
	 * @return
	 */
	public static Object nullHandler(Object obj) {
		if (null == obj)
			return "";
		else
			return obj;
	}

	/**
	 * ����ڲ����ַ������ĸת��Ϊ��д��ĸ.
	 * 
	 * @param str
	 * @return
	 */
	public static String upperCaseFirstChar(String str) {
		if (null == str || "".equals(str.trim())) {
			return "";
		} else {
			String firstChar = str.substring(0, 1);
			firstChar = StringUtils.upperCase(firstChar);
			return firstChar + str.substring(1, str.length());
		}
	}

	/**
	 * ȥ���»������»��ߺ�����ĸ��д
	 * 
	 * @param str
	 * @return
	 */
	public static String removeUnderLineAndUperCharAfter(String str) {
		if (null == str || "".equals(str.trim())) {
			return "";
		} else {
			String result = "";
			String temp[] = str.split("_");
			result = temp[0];
			for (int i = 1; i < temp.length; i++) {
				String fChar = StringUtils.upperCase(temp[i].substring(0, 1));
				result = result + fChar + temp[i].substring(1, temp[i].length());
			}
			return result;
		}
	}

	/**
	 * ����ڲ����ַ������ĸת��Ϊ��д��ĸ.����ȥ���»������»��ߺ�����ĸ��д
	 * 
	 * @param str
	 * @return
	 */
	public static String uFirstCharAndu_Char(String str) {
		if (null == str || "".equals(str.trim())) {
			return "";
		} else {
			String result = "";
			String temp[] = str.split("_");
			for (int i = 0; i < temp.length; i++) {
				String fChar = StringUtils.upperCase(temp[i].substring(0, 1));
				temp[i] = fChar + temp[i].substring(1, temp[i].length());
			}
			for (int i = 0; i < temp.length; i++) {
				result = result + temp[i];
			}
			return result;
		}
	}

	/**
	 * 
	 * @param str
	 *            Ҫ�޸ĵ��ַ�
	 * @param length
	 *            ��Ҫ�ﵽ�ĳ���
	 * @param charStr
	 *            ��ȱ���ַ�
	 * @param target
	 *            Ŀ��λ�ã�S�����ڿ�ʼ��E������β����
	 * @return
	 */
	public static String addCharToSize(String str, int length, String charStr, String target) {
		while (str.length() < length) {
			if (target.toUpperCase().equals("S")) {
				str = charStr + str;
			} else {
				str += charStr;
			}
		}
		return str;
	}

	/*
	 * 0A ===> 10
	 */
	public static String String2Hex(String str) {
		return String.valueOf(Integer.parseInt(str, 16));
	}

	/*
	 * 10 ===> 0A
	 */
	public static String Hex2String(String str) {
		String tmp = String.valueOf(Integer.toHexString(Integer.parseInt(str))).toUpperCase();
		if (tmp.length() == 1) {
			return "0" + tmp;
		} else {
			return tmp;
		}
	}

	public static String praseNull(Object obj) {
		if (obj == null) {
			return "";
		} else {
			return String.valueOf(obj);
		}
	}

	/**
	 * 是否无效
	 */
	public static boolean isInvalid(String value) {
		return (value == null || value.trim().length() == 0);
	}

	public static String tonicZero(Object str, int maxLength) {
		String _str = str.toString();
		while (_str.length() < maxLength) {
			_str = "0" + _str;
		}
		return _str;

	}
	
	public static String getObjectsValue(Object[] objs)
	{
		String str=null;
		StringBuilder s=new StringBuilder("：：：值：：：");
		if(objs!=null&&objs.length>0)
		{
			for(int i=0;i<objs.length;i++)
			{
				if(i<objs.length-1)
				{
					if(objs[i]!=null)
					s.append(objs[i].toString()).append("  $$");
				}
				else
				{
					s.append(objs.toString());
				}
			}
		}
		str=s.toString();
		return str;
	}
}
