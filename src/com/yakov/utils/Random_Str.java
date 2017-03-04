package com.yakov.utils;

import java.util.Random;

public class Random_Str {
	public Random_Str() {
		super();
	}

	/**
	 * 生成纯数字的随机字符串
	 * @param num
	 * @return
	 */
	public static String getrandom_int(int num) {
		String random = "";
		Random r = new Random();
		for (int j = 1; j <= num; j++) {
			Integer i = new Integer(Math.abs(r.nextInt()) % 10);
			random = random + i.toString();
		}
		return random;
	}

	/**
	 * 生成纯字母的随机字符串
	 * @param num
	 * @return
	 */
	public static String getrandom_str(int num) {
		String random = "";
		Random r = new Random();
		for (int j = 1; j <= num; j++) {
			char c = (char) (Math.random() * 26 + 'A');
			random = random + c;
		}
		return random;
	}

	/**
	 * 生成数字和字母混合的随机字符串
	 * @param num
	 * @return
	 */
	public static String getrandom_str_int(int num) {
		String random = "";
		Random r = new Random();
		for (int j = 1; j <= num; j++) {
			Integer i = new Integer(Math.abs(r.nextInt()) % 10);
			int ranbum = Integer.parseInt(i.toString());
			if (ranbum % 2 == 1) {
				char c = (char) (Math.random() * 26 + 'A');
				random = random + c;
			} else {
				random = random + i.toString();
			}
		}
		return random;
	}

	/**
	 * 生成数字和字母混合的随机字符串，去掉不想包含的字符
	 * @param num
	 * @param shieldChar
	 * @return
	 */
	public static String getrandom_str_int(int num, String shieldChar) {
		String random = "";
		String str = "";
		Random r = new Random();
		while (random.length() < num) {
			if (Math.abs(r.nextInt()) % 2 == 1) {
				char c = (char) (Math.random() * 26 + 'A');
				str += c;
			} else {
				int c = Math.abs(r.nextInt()) % 10;
				str += c;
			}
			if (!shieldChar.contains(str)) {
				random += str;
			}
			str = "";
		}
		return random;
	}

	public static void main(String[] args) {
		System.out.println(getrandom_str_int(20));
	}
}
