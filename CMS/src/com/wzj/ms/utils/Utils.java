package com.wzj.ms.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;

public class Utils {
	private static Map<String, Object> search = new HashMap();
	public static Logger log = Logger.getLogger("Utils");
	private static SimpleDateFormat dateFormator = new SimpleDateFormat("yyyy-MM-dd");
	private static SimpleDateFormat dateFormator01 = new SimpleDateFormat("yyyyMMdd");
	private static SimpleDateFormat ft = new SimpleDateFormat("yyyy:MM:dd:HH:mm:ss");


	public static String getOName(Object obj) {
		String str = obj.getClass().getName();
		return str.substring(str.lastIndexOf(".") + 1);
	}

	public static Map<String, Object> getSearch(String table) {
		search = new HashMap();
		search.put("table", table);
		return search;
	}

	public static String DateTime() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String s = format.format(date);
		return s;
	}

	public static String DateTime(String mate) {
		SimpleDateFormat format = new SimpleDateFormat(mate);
		Date date = new Date();
		String s = format.format(date);
		return s;
	}

	public static String getID(String tem_name) {
		String id = "";
		int nums = 0;
		for (int i = 0; i < tem_name.length(); i++) {
			int num = tem_name.charAt(i);
			nums += num;
		}
		for (int i = 0; i < 4; i++) {
			id = id + new Random().nextInt(9);
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		String ctime = format.format(new Date());
		id = ctime + nums + id;
		return id;
	}

	public static boolean isNULL(String str) {
		if ((str == null) || (str.length() <= 0) || (str.equals("null")) || (str.equals("NULL"))) {
			return true;
		}
		return false;
	}

	public static Map<String, Object> getSearch() {
		return getSearch("SqlMap");
	}

	public static String WeekTime() {
		Date date = new Date();
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(date);
		calendar.add(5, -7);
		date = calendar.getTime();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = formatter.format(date);

		return dateString;
	}

	public static String numberday(int num) {
		Date date = new Date();
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(date);
		calendar.add(5, num);
		date = calendar.getTime();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = formatter.format(date);

		return dateString;
	}

	public static int daysBetween(String endtime) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date smdate = null;
		Date bdate = null;
		try {
			smdate = sdf.parse(sdf.format(new Date()));
			bdate = sdf.parse(endtime);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		Calendar cal = Calendar.getInstance();
		cal.setTime(smdate);
		long time1 = cal.getTimeInMillis();
		cal.setTime(bdate);
		long time2 = cal.getTimeInMillis();
		long between_days = (time2 - time1) / 86400000L;

		return Integer.parseInt(String.valueOf(between_days));
	}

	public static List<Date> dateToWeek(Date mdate) {
		int b = mdate.getDay();

		List list = new ArrayList();
		Long fTime = Long.valueOf(mdate.getTime() - b * 24 * 3600000);
		for (int a = 0; a < 8; a++) {
			Date fdate = new Date();
			fdate.setTime(fTime.longValue() + a * 24 * 3600000);
			list.add(a, fdate);
		}
		return list;
	}

	/**
	 * 2016年11月22日 09:13:06 时间格式校检工具
	 * 校检格式  2016-11-22
	 * 
	 * @param code
	 * @param tablename
	 * @return
	 */
	public static boolean testTime(String time) {
		String rexp = "^((\\d{2}(([02468][048])|([13579][26]))[\\-\\/\\s]?((((0?[13578])|(1[02]))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])))))|(\\d{2}(([02468][1235679])|([13579][01345789]))[\\-\\/\\s]?((((0?[13578])|(1[02]))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-\\/\\s]?((0?[1-9])|(1[0-9])|(2[0-8]))))))";

		Pattern pat = Pattern.compile(rexp);

		Matcher mat = pat.matcher(time);

		boolean result = mat.matches();
		return result;
	}

	public static Map<String, Object> getSearch(String code, String tablename) {
		Map search = getSearch();
		search.put("code", code);
		search.put("tablename", tablename);
		return search;
	}

	public static String getYesterday() {
		return getYesterday("yyyy-MM-dd");
	}

	public static String getYesterday(String mate) {
		SimpleDateFormat format = new SimpleDateFormat(mate);
		Date date = new Date(new Date().getTime() - 86400000L);
		String s = format.format(date);
		return s;
	}

	public static long parseDate(String date) {
		try {
			return dateFormator.parse(date).getTime();
		} catch (ParseException e) {
			throw new RuntimeException(e.getMessage());
		}
	}

	public static long parseDateM(String date) {
		try {
			return ft.parse(date).getTime();
		} catch (ParseException e) {
			throw new RuntimeException(e.getMessage());
		}
	}

	public static long parseDate(String date, String mate) {
		SimpleDateFormat format = new SimpleDateFormat(mate);
		try {
			return format.parse(date).getTime();
		} catch (ParseException e) {
			throw new RuntimeException(e.getMessage());
		}
	}

	public static String formateDate(Date date) {
		return dateFormator.format(date);
	}

	public static String formateDate01(Date date) {
		return dateFormator01.format(date);
	}

	public static String DateTime(String mate1, String date, String mate2) {
		SimpleDateFormat format = new SimpleDateFormat(mate1);
		Date d = null;
		try {
			d = format.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
			return "";
		}
		format = new SimpleDateFormat(mate2);
		String s = format.format(d);

		return s;
	}

	public static String uuID() {
		return UUID.randomUUID().toString().replace("-", "");
	}

	public static String getCName() {
		List listA = new ArrayList();
		List lista = new ArrayList();
		for (char c = 'A'; c <= 'Z'; c = (char) (c + '\001')) {
			listA.add(Character.valueOf(c));
		}
		for (char c = 'a'; c <= 'z'; c = (char) (c + '\001')) {
			lista.add(Character.valueOf(c));
		}
		lista.addAll(lista);
		String str = "";
		int num = 0;
		while ((num < 1) || (num > 3)) {
			num = (int) (Math.random() * 4.0D);
		}
		for (int j = 0; j < num; j++) {
			int n = (int) (Math.random() * 52.0D);
			str = str + lista.get(n);
		}
		return listA.get((int) (Math.random() * 26.0D)) + str;
	}

	public static boolean isW() {
		return System.getProperties().getProperty("os.name").indexOf("Windows") >= 0;
	}

	public static boolean isN(String num) {
		if (isNULL(num)) {
			return false;
		}
		char[] cha = num.toCharArray();
		for (char c : cha) {
			int n = c;
			if ((n < 48) || (n > 57)) {
				System.out.println("1");
				return false;
			}
			System.out.println(n);
		}
		return true;
	}

	public static Date getDefinedDateTime(int hour, int minute, int second, int milliSecond) {
		Calendar cal = Calendar.getInstance();
		cal.set(11, hour);
		cal.set(12, minute);
		cal.set(13, second);
		cal.set(14, milliSecond);
		Date date = new Date(cal.getTimeInMillis());
		return date;
	}

	public static void main(String[] args) {
		 String date1 = "2014-01-03";
	        /**
	         * 日期范围不正确---平年二月没有29号
	         */
	        String date2 = "2014-02-29";
	        /**
	         * 日期月份范围不正确---月份没有13月
	         */
	        String date3 = "2014-13-03";
	        /**
	         * 日期范围不正确---六月没有31号
	         */
	        String date4 = "2014-06-31";
	        /**
	         * 日期范围不正确 ----1月超过31天
	         */
	        String date5 = "2014-01-32";
	        /**
	         * 这个测试年份
	         */
	        String date6 = "0014-01-03";
	        
	        System.out.println(testTime(date1));
	        System.out.println(testTime(date2));
	        System.out.println(testTime(date3));
	        System.out.println(testTime(date4));
	        System.out.println(testTime(date5));
	        System.out.println(testTime(date6));
	        
	}

	public static void clearM(String appid) {
		if (!isNULL(appid)) {
			String key = appid;
		}
	}
}