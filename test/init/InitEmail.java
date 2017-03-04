package init;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.http.Header;
import org.apache.http.message.BasicHeader;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;

import com.yakov.utils.EmailHttpXmlClient;

public class InitEmail {
	private static Logger logger = Logger.getLogger(InitEmail.class.getName());
	private static String ADD = "2";

	public static void main(String[] args) throws Exception {
		List<String[]> emailList = loadEmailList();
		logger.info("获取认证......");
		JSONObject jsonOAuth = EmailHttpXmlClient.getJsonOAuth(EmailHttpXmlClient.client_id, EmailHttpXmlClient.client_secret);
		logger.info("获取认证结束");
		logger.info("token_type=" + jsonOAuth.getString("token_type"));
		logger.info("access_token=" + jsonOAuth.getString("access_token"));
		if (jsonOAuth.has("token_type")) {
			Map<String, Boolean> partyMaps = partyMaps(jsonOAuth.getString("token_type"), jsonOAuth.getString("access_token"));
			for (String[] strings : emailList) {
				String loginId = "cdc" + strings[0];
				String dept = strings[1];// 部门
				String name = strings[2];// 名称
				String email = strings[3] + "@cncdc.org";// 邮箱帐号
				String gender = strings[4];// 性别
				if (!partyMaps.containsKey(dept)) {
					String syncObj = syncParty(dept, jsonOAuth.getString("token_type"), jsonOAuth.getString("access_token"));
					System.out.println("添加部门(" + dept + ")内容：" + syncObj);
					partyMaps.put(dept, true);
				}
				if (!isExistsEmail(email, jsonOAuth.getString("token_type"), jsonOAuth.getString("access_token"))) {// 判断账号是否已经存在
					Map<String, String> user = new HashMap<String, String>();
					user.put("Action", InitEmail.ADD);// 1=DEL, 2=ADD, 3=MOD
					user.put("Alias", email);
					user.put("Name", name);
					user.put("Gender", "男".equals(gender) ? "1" : "2");
					user.put("ExtId", loginId);
					user.put("Password", "e10adc3949ba59abbe56e057f20f883e");
					user.put("Md5", "1");
					user.put("PartyPath", dept);
					user.put("OpenType", "1");
					String syncData = "";
					try {
						syncData = userSync(user, jsonOAuth.getString("token_type"), jsonOAuth.getString("access_token"));// 添加用户
						logger.info(loginId + " ：" + name + " ：" + email + " ，\n操作返回值：" + syncData);
					} catch (Exception e) {
						logger.info("出现异常 " + loginId + " ：" + name + " ：" + email + " ，\n操作返回值：" + syncData, e);
					}
				} else {
					logger.info(name + "：" + email + "   已经存在");
				}
			}
		}
	}

	/**
	 * 同步用户
	 */
	public static String userSync(Map<String, String> user, String token_type, String access_token) {
		List<Header> headerList = new ArrayList<Header>();
		headerList.add(new BasicHeader("Authorization", token_type + " " + access_token));
		String syncJsonStr = EmailHttpXmlClient.post("http://openapi.exmail.qq.com:12211/openapi/user/sync", user, headerList);
		return syncJsonStr;
	}

	/**
	 * 同步部门
	 */
	public static String syncParty(String dept, String token_type, String access_token) {
		List<Header> headerList = new ArrayList<Header>();
		headerList.add(new BasicHeader("Authorization", token_type + " " + access_token));
		Map<String, String> params = new HashMap<>();
		params.put("Action", ADD);
		params.put("DstPath", dept);
		String syncJsonStr = EmailHttpXmlClient.post("http://openapi.exmail.qq.com:12211/openapi/party/sync", params, headerList);
		return syncJsonStr;
	}

	public static Map<String, Boolean> partyMaps(String token_type, String access_token) {
		Map<String, Boolean> partyMaps = new HashMap<>();
		List<Header> headerList = new ArrayList<Header>();
		headerList.add(new BasicHeader("Authorization", token_type + " " + access_token));
		Map<String, String> params = new HashMap<>();
		params.put("Action", "3");
		params.put("DstPath", "/");
		String syncJsonStr = EmailHttpXmlClient.post("http://openapi.exmail.qq.com:12211/openapi/party/list", params, headerList);
		if (StringUtils.isNotEmpty(syncJsonStr)) {
			JSONObject json = new JSONObject(syncJsonStr);
			JSONArray jsonArray = json.getJSONArray("List");
			if (jsonArray != null) {
				for (int i = 0; i < jsonArray.length(); i++) {
					partyMaps.put(jsonArray.getJSONObject(i).getString("Value"), true);
				}
			}
		}
		return partyMaps;
	}

	public static List<String[]> loadEmailList() throws Exception {
		List<String[]> list = new ArrayList<String[]>();
		InputStream in = InitEmail.class.getClassLoader().getResourceAsStream("email.list");
		BufferedReader br = new BufferedReader(new InputStreamReader(in));
		for (String line = br.readLine(); line != null; line = br.readLine()) {
			String[] strings = line.split("\t");
			if (strings.length == 5) {
				list.add(strings);
			}
		}
		br.close();
		return list;
	}

	public static boolean isExistsEmail(String email, String token_type, String access_token) {
		List<Header> headerList = new ArrayList<Header>();
		headerList.add(new BasicHeader("Authorization", token_type + " " + access_token));
		Map<String, String> params = new HashMap<String, String>();
		params.put("email", email);
		String checkJsonStr = EmailHttpXmlClient.post("http://openapi.exmail.qq.com:12211/openapi/user/check", params, headerList);
		if (StringUtils.isNotEmpty(checkJsonStr)) {
			JSONObject checkJson = new JSONObject(checkJsonStr);
			if (checkJson.getJSONArray("List") != null) {
				JSONArray jsonArray = checkJson.getJSONArray("List");
				for (int j = 0; j < jsonArray.length(); j++) {
					JSONObject jsonObject = jsonArray.getJSONObject(j);
					// 帐号类型Type
					// -1：帐号名无效，
					// 0：帐号名没被占用
					// 1：主帐号名
					// 2：别名帐号
					// 3：邮件群组帐号
					if (jsonObject != null && email.equals(jsonObject.getString("Email")) && 0 == jsonObject.getInt("Type")) {
						return false;// 表示帐号不存在
					}
				}
			}
		}
		return true;// 表示帐号存在
	}
}
