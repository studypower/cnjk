package com.yakov.utils;

import java.util.List;
import java.util.Map;

public class RoleTools {
	public static boolean isRole(Map<String, Object> curMap, String key) {
		if (curMap != null && key != null) {
			List<String> list = (List<String>) curMap.get("keyList");
			if (list != null && !list.isEmpty()) {
				for (String string : list) {
					if (key.equals(string)) {
						return true;
					}
				}
			}
		}
		return false;
	}
}
