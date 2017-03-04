package com.yakov.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.MissingResourceException;
import java.util.ResourceBundle;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.i18n.LocaleContextHolder;

/**
 * Date Utility Class This is used to convert Strings to Dates and Timestamps
 * 
 * <p>
 * <a href="DateUtil.java.html"><i>View Source</i></a>
 * </p>
 * 
 * @author <a href="mailto:matt@raibledesigns.com">Matt Raible</a> Modified by
 *         <a href="mailto:dan@getrolling.com">Dan Kibler </a> to correct time
 *         pattern. Minutes should be mm not MM (MM is month).
 * @version $Revision: 1.5 $ $Date: 2009/11/13 09:37:42 $
 */
public class DateUtil {
	// ~ Static fields/initializers
	// =============================================

	public static final long SECOND = 1000;

	public static final long MINUTE = SECOND * 60;

	public static final long HOUR = MINUTE * 60;

	public static final long DAY = HOUR * 24;

	public static final long WEEK = DAY * 7;

	public static final long YEAR = DAY * 365;

	public static final String YYYYMDHMS = "yyyy-M-d H:m:s";

	public static final String yyyy_MM_DD = "yyyy-MM-dd";

	private static Log log = LogFactory.getLog(DateUtil.class);
	private static String defaultDatePattern = null;
	private static String timePattern = "HH:mm";

	private static String DATE_CURRENT = "0";
	private static String DATE_YESTORDAY = "1";
	private static String DATE_THREEDAY = "2";
	private static String DATE_ONEWEEK = "3";
	private static String DATE_ONEMONTH = "4";

	private static final Map<String, DateFormat> DFS = new HashMap<String, DateFormat>();

	// ~ Methods
	// ================================================================

	/**
	 * Return default datePattern (MM/dd/yyyy)
	 * 
	 * @return a string representing the date pattern on the UI
	 */
	public static synchronized String getDatePattern() {
		Locale locale = LocaleContextHolder.getLocale();
		try {
			defaultDatePattern = ResourceBundle.getBundle(Constants.BUNDLE_KEY, locale).getString("date.format");
		} catch (MissingResourceException mse) {
			defaultDatePattern = "yyyy-MM-dd";
		}

		return defaultDatePattern;
	}

	public static String getDateTimePattern() {
		return DateUtil.getDatePattern() + " HH:mm:ss";
	}

	public static final String getDateTime(Date aDate) {
		SimpleDateFormat df = null;
		String returnValue = "";

		if (aDate != null) {
			df = new SimpleDateFormat(getDateTimePattern());
			returnValue = df.format(aDate);
		}

		return (returnValue);
	}

	/**
	 * This method attempts to convert an Oracle-formatted date in the form
	 * dd-MMM-yyyy to mm/dd/yyyy.
	 * 
	 * @param aDate
	 *            date from database as a string
	 * @return formatted string for the ui
	 */
	public static final String getDate(Date aDate) {
		SimpleDateFormat df = null;
		String returnValue = "";

		if (aDate != null) {
			df = new SimpleDateFormat(getDatePattern());
			returnValue = df.format(aDate);
		}

		return (returnValue);
	}

	/**
	 * This method generates a string representation of a date/time in the
	 * format you specify on input
	 * 
	 * @param aMask
	 *            the date pattern the string is in
	 * @param strDate
	 *            a string representation of a date
	 * @return a converted Date object
	 * @see java.text.SimpleDateFormat
	 * @throws ParseException
	 */
	public static final Date convertStringToDate(String aMask, String strDate) throws ParseException {
		SimpleDateFormat df = null;
		Date date = null;
		df = new SimpleDateFormat(aMask);

		if (log.isDebugEnabled()) {
			log.debug("converting '" + strDate + "' to date with mask '" + aMask + "'");
		}

		try {
			date = df.parse(strDate);
		} catch (ParseException pe) {
			// log.error("ParseException: " + pe);
			throw new ParseException(pe.getMessage(), pe.getErrorOffset());
		}

		return (date);
	}

	public static final Date convertStringToDate_YYYY_MM_DD(String strDate) {
		Date date = null;
		try {
			date = convertStringToDate(yyyy_MM_DD, strDate);
		} catch (ParseException pe) {
			log.error("ParseException: " + pe);
		}
		return date;

	}

	/**
	 * This method returns the current date time in the format: MM/dd/yyyy HH:MM
	 * a
	 * 
	 * @param theTime
	 *            the current time
	 * @return the current date/time
	 */
	public static String getTimeNow(Date theTime) {
		return getDateTime(timePattern, theTime);
	}

	/**
	 * This method returns the current date in the format: MM/dd/yyyy
	 * 
	 * @return the current date
	 * @throws ParseException
	 */
	public static Calendar getToday() throws ParseException {
		Date today = new Date();
		SimpleDateFormat df = new SimpleDateFormat(getDatePattern());
		String todayAsString = df.format(today);
		Calendar cal = new GregorianCalendar();
		cal.setTime(convertStringToDate(todayAsString));
		return cal;
	}

	/**
	 * This method generates a string representation of a date's date/time in
	 * the format you specify on input
	 * 
	 * @param aMask
	 *            the date pattern the string is in
	 * @param aDate
	 *            a date object
	 * @return a formatted string representation of the date
	 * 
	 * @see java.text.SimpleDateFormat
	 */
	public static final String getDateTime(String aMask, Date aDate) {
		SimpleDateFormat df = null;
		String returnValue = "";

		if (aDate == null) {
			log.error("aDate is null!");
		} else {
			df = new SimpleDateFormat(aMask);
			returnValue = df.format(aDate);
		}

		return (returnValue);
	}

	/**
	 * This method generates a string representation of a date based on the
	 * System Property 'dateFormat' in the format you specify on input
	 * 
	 * @param aDate
	 *            A date to convert
	 * @return a string representation of the date
	 */
	public static final String convertDateToString(Date aDate) {
		return getDateTime(getDatePattern(), aDate);
	}

	/**
	 * This method converts a String to a date using the datePattern
	 * 
	 * @param strDate
	 *            the date to convert (in format MM/dd/yyyy)
	 * @return a date object
	 * 
	 * @throws ParseException
	 */
	public static Date convertStringToDate(String strDate) throws ParseException {
		Date aDate = null;

		try {
			aDate = convertStringToDate(getDatePattern(), strDate);
		} catch (ParseException pe) {
			log.error("Could not convert '" + strDate + "' to a date, throwing exception");
			pe.printStackTrace();
			throw new ParseException(pe.getMessage(), pe.getErrorOffset());

		}

		return aDate;
	}

	// ���date
	public static String getDateFromTime(long longtime, String pattern) {
		Date date = new Date(longtime);
		SimpleDateFormat df = new SimpleDateFormat(pattern);
		return df.format(date);
	}

	/**
	 * 获取当前小时数
	 * 
	 * @return
	 */
	public static int getNowHour() {
		Calendar calendar = Calendar.getInstance();
		return calendar.get(Calendar.HOUR_OF_DAY);
	}

	/**
	 * 比较两个时间相差的天数
	 * 
	 * @param date1
	 * @param date2
	 * @return
	 * @throws ParseException
	 */
	public static int diffDate(String date1, String date2) throws ParseException {
		return diffDate(convertStringToDate(date1), convertStringToDate(date2));
	}

	public static int diffDate(Calendar date1, Calendar date2) {
		return diffDate(date1.getTime(), date2.getTime());
	}

	public static int diffDate(Date date1, Date date2) {
		return (int) ((date2.getTime() - date1.getTime()) / (24 * 60 * 60 * 1000));
	}

	/**
	 * 比较两个时间相差的数据。
	 * 
	 * @param date1
	 * @param date2
	 * @param field
	 *            （年、月、日）
	 * @return
	 */
	public static int dayDiff(Date date1, Date date2, int field) {
		long field0 = DAY;
		switch (field) {
		case Calendar.DATE:
			field0 = DAY;
			break;
		case Calendar.YEAR:
			field0 = YEAR;
			break;
		case Calendar.SECOND:
			field0 = SECOND;
			break;
		case Calendar.MINUTE:
			field0 = MINUTE;
			break;
		case Calendar.HOUR:
			field0 = HOUR;
			break;
		default:
			break;
		}

		long diff = date1.getTime() - date2.getTime();
		return (int) (diff / field0);
	}

	// ���ѡ��ؽ������ڣ�ѡ�����|����|3����|һ����|һ���ڵȵ� by ������ ---start---
	public static String getStrdateByChoose(String currentdate, String param) throws ParseException {
		String strdate = "";
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c = Calendar.getInstance();
		if (DATE_CURRENT.equals(param)) {
			strdate = currentdate;
		} else if (DATE_YESTORDAY.equals(param)) {
			c.add(Calendar.DATE, -1);
			strdate = df.format(c.getTime());
		} else if (DATE_THREEDAY.equals(param)) {
			c.add(Calendar.DATE, -2);
			strdate = df.format(c.getTime());
		} else if (DATE_ONEWEEK.equals(param)) {
			c.add(Calendar.DATE, -6);
			strdate = df.format(c.getTime());
		} else if (DATE_ONEMONTH.equals(param)) {
			c.add(Calendar.MONTH, -1);
			strdate = df.format(c.getTime());
		} else {
			strdate = "";
		}
		return strdate;
	}

	public static java.sql.Date getSqlDate(Date date) {
		return new java.sql.Date(date.getTime());
	}

	/**
	 * 更改当前时间，增加天数
	 * 
	 * @param date
	 * @param offset
	 * @return
	 */
	public static Date dayOffset(Date date, int offset) {
		return offsetDate(date, Calendar.DATE, offset);
	}

	/**
	 * 更改时间
	 * 
	 * @param date
	 * @param field
	 * @param offset
	 * @return
	 */
	public static Date offsetDate(Date date, int field, int offset) {
		Calendar calendar = convert(date);
		calendar.add(field, offset);
		return calendar.getTime();
	}

	private static Calendar convert(Date date) {
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(date);
		return calendar;
	}

	public static String format(Date date, String pattern, String defaultValue) {
		if (StringUtil.isInvalid(pattern)) {
			pattern = "yyyy-MM-dd";
		}

		if (date == null) {
			return defaultValue;
		}
		return getFormat(pattern).format(date);
	}

	public static DateFormat getFormat(String pattern) {
		DateFormat format = DFS.get(pattern);
		if (format == null) {
			format = new SimpleDateFormat(pattern);
			DFS.put(pattern, format);
		}
		return format;
	}

	/**
	 * 将毫秒换算成时长
	 * 
	 * @param ms
	 * @return
	 */
	public static String formatMS(long ms) {
		long ss = 1000;
		long mi = ss * 60;
		long hh = mi * 60;
		long dd = hh * 24;

		long day = ms / dd;
		long hour = (ms - day * dd) / hh;
		long minute = (ms - day * dd - hour * hh) / mi;
		long second = (ms - day * dd - hour * hh - minute * mi) / ss;
		long milliSecond = ms - day * dd - hour * hh - minute * mi - second * ss;
		String strDay = day < 10 ? "0" + day : "" + day;
		String strHour = hour < 10 ? "0" + hour : "" + hour;
		String strMinute = minute < 10 ? "0" + minute : "" + minute;
		String strMilliSecond = milliSecond < 10 ? "0" + milliSecond : "" + milliSecond;
		strMilliSecond = milliSecond < 100 ? "0" + strMilliSecond : "" + strMilliSecond;
		return strDay + "天" + strHour + "时" + strMinute + "分";
	}

	/**
	 * 获取当前时间戳 传入 1000 单位为秒
	 * 
	 * @return
	 */
	public static int getNowTime() {
		return Integer.parseInt(String.valueOf(new Date().getTime() / 1000));
	}

	/**
	 * 获得年月日如201416
	 * 
	 * @return
	 */
	public static String getYmd() {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		Date now = new Date();
		String time = format.format(now);
		return time;
	}

	/**
	 * 获得年月日如2014-1-6
	 * 
	 * @return
	 */
	public static String getNewDate() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		String time = format.format(now);
		return time;
	}

	public static void main(String[] args) {
		System.out.println(new SimpleDateFormat("yy", Locale.CHINESE).format(Calendar.getInstance().getTime()));
		System.out.println(diffDate(offsetDate(new Date(), 1, 1), new Date()));
		System.out.println(getDateTimePattern());
		System.out.println(getYmd());
		System.out.println(getNewDate());
		System.out.println(getMonday(-7));
	}

	/**
	 * 获取周一日期，
	 * 
	 * @param day
	 *            传入0代表本周，-7上周，7下周
	 * @return
	 */
	public static Date getMonday(int day) {
		Calendar calendar = Calendar.getInstance();
		int day_of_week = calendar.get(Calendar.DAY_OF_WEEK) - 1;
		if (day_of_week == 0) {
			day_of_week = 7;
		}
		calendar.add(Calendar.DATE, -day_of_week + 1 + day);
		return calendar.getTime();
	}

}
