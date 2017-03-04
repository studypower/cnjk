package com.yakov.utils;

public class Md5Util {

	public static String encrypt32(String str) {

		java.security.MessageDigest md5 = null;

		try {
			md5 = java.security.MessageDigest.getInstance("MD5");
		} catch (java.security.NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		byte[] digest = md5.digest(str.getBytes());
		char[] hex = new char[digest.length * 2];
		for (int i = 0; i < digest.length; i++) {
			char c;
			c = (char) ((digest[i] >> 4) & 0xf);
			if (c > 9) {
				c = (char) ((c - 10) + 'a');
			} else {
				c = (char) (c + '0');
			}
			hex[2 * i] = c;
			c = (char) (digest[i] & 0xf);
			if (c > 9) {
				c = (char) ((c - 10) + 'a');
			} else {
				c = (char) (c + '0');
			}
			hex[2 * i + 1] = c;
		}
		return String.valueOf(hex);
	}

	public static String encrypt16(String str) {
		return encrypt32(str).substring(8, 24);
	}

	public static void main(String[] args) {
		System.out.println(Md5Util.encrypt32("123456"));
	}

}