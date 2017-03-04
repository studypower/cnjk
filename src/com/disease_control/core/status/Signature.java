package com.disease_control.core.status;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import com.yakov.utils.Base64;

public class Signature {

	private static final String HMAC_SHA1 = "HmacSHA1";

	private static String generateSignature(String data, String appSecret) {
		byte[] byteHMAC = null;
		try {
			Mac mac = Mac.getInstance(HMAC_SHA1);
			SecretKeySpec spec = new SecretKeySpec(appSecret.getBytes(), HMAC_SHA1);
			mac.init(spec);
			byteHMAC = mac.doFinal(data.getBytes());
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException ignore) {
			// should never happen
		}
		return new String(Base64.encode(byteHMAC));
	}

	/**
	 * @param postParams
	 *            parameters to be enocded and concatenated
	 * @return eoncoded string
	 * @see <a href="http://wiki.oauth.net/TestCases">OAuth / TestCases</a>
	 * @see <a
	 *      href="http://groups.google.com/group/oauth/browse_thread/thread/a8398d0521f4ae3d/9d79b698ab217df2?hl=en&lnk=gst&q=space+encoding#9d79b698ab217df2">Space
	 *      encoding - OAuth | Google Groups</a>
	 */
	private static String encodeParameters(List<PostParameter> postParams) {
		Collections.sort(postParams);
		return encodeParameters(postParams, "&", false);
	}

	private static String encodeParameters(List<PostParameter> postParams, String splitter, boolean quot) {
		StringBuffer buf = new StringBuffer();
		for (PostParameter param : postParams) {
			if (buf.length() != 0) {
				if (quot) {
					buf.append("\"");
				}
				buf.append(splitter);
			}
			buf.append(encode(param.name)).append("=");
			if (quot) {
				buf.append("\"");
			}
			buf.append(encode(param.value));
		}
		if (buf.length() != 0) {
			if (quot) {
				buf.append("\"");
			}
		}
		return buf.toString();
	}

	/**
	 * @param value
	 *            string to be encoded
	 * @return encoded string
	 * @see <a href="http://wiki.oauth.net/TestCases">OAuth / TestCases</a>
	 * @see <a
	 *      href="http://groups.google.com/group/oauth/browse_thread/thread/a8398d0521f4ae3d/9d79b698ab217df2?hl=en&lnk=gst&q=space+encoding#9d79b698ab217df2">Space
	 *      encoding - OAuth | Google Groups</a>
	 * @see <a href="http://tools.ietf.org/html/rfc3986#section-2.1">RFC 3986 -
	 *      Uniform Resource Identifier (URI): Generic Syntax - 2.1.
	 *      Percent-Encoding</a>
	 */
	public static String encode(String value) {
		String encoded = null;
		try {
			encoded = URLEncoder.encode(value, "UTF-8");
		} catch (UnsupportedEncodingException ignore) {
		}
		StringBuffer buf = new StringBuffer(encoded.length());
		char focus;
		for (int i = 0; i < encoded.length(); i++) {
			focus = encoded.charAt(i);
			if (focus == '*') {
				buf.append("%2A");
			} else if (focus == '+') {
				buf.append("%20");
			} else if (focus == '%' && (i + 1) < encoded.length() && encoded.charAt(i + 1) == '7' && encoded.charAt(i + 2) == 'E') {
				buf.append('~');
				i += 2;
			} else {
				buf.append(focus);
			}
		}
		return buf.toString();
	}

	private static List<PostParameter> parseGetParameters(String url) {
		List<PostParameter> signatureBaseParams = new ArrayList<PostParameter>();
		int queryStart = url.indexOf("?");
		if (-1 != queryStart) {
			String[] queryStrs = url.substring(queryStart + 1).split("&");
			try {
				for (String query : queryStrs) {
					String[] split = query.split("=");
					if (split.length == 2) {
						signatureBaseParams.add(new PostParameter(URLDecoder.decode(split[0], "UTF-8"), URLDecoder.decode(split[1], "UTF-8")));
					} else {
						signatureBaseParams.add(new PostParameter(URLDecoder.decode(split[0], "UTF-8"), ""));
					}
				}
			} catch (UnsupportedEncodingException ignore) {
			}
		}
		return signatureBaseParams;
	}

	/**
	 * 验证Sign是否正确
	 * 
	 * @param url
	 *            客户端请求的URL
	 * @param appSecret
	 *            分配给系统的AppKey
	 * @return
	 */
	public static boolean valiSignature(String url, String appSecret) {
		String sign = null;
		PostParameter signParam = null;
		List<PostParameter> params = parseGetParameters(url);
		for (PostParameter postParameter : params) {
			if (postParameter.getName().equals("sign")) {
				signParam = postParameter;
				sign = postParameter.getValue();
				break;
			}
		}
		if (sign == null) {
			return false;
		}
		params.remove(signParam);
		String _sign = generateSignature(encodeParameters(params), appSecret);
		return _sign.equals(sign);
	}

	/**
	 * 获取sign
	 * 
	 * @param url
	 *            参数列表，必须以？开头（例如：?param1=value1&param2=value2）
	 * @param appSecret
	 *            分配给系统的AppKey
	 * @return
	 */
	public static String getSignature(String url, String appSecret) {
		List<PostParameter> params = parseGetParameters(url);
		return generateSignature(encodeParameters(params), appSecret);
	}

	public static void main(String[] args) {
		//System.out.println(encode(getSignature("?accountNum=123456&appKey=1000001", "23522J0C70V0NRYK3LE57")));
		List<PostParameter> signatureBaseParams = parseGetParameters("?nickname=ttt&email=&accountPwd=12345&appKey=1000001");
		System.out.println(encodeParameters(signatureBaseParams));
		//System.out.println(encode("中文"));
		try {
			System.out.println(URLEncoder.encode(generateSignature(encodeParameters(signatureBaseParams), "23522J0C70V0NRYK3LE57"), "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
}
