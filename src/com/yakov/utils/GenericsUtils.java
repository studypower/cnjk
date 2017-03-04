package com.yakov.utils;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Generics��util��.
 * 
 * @author sshwsfc
 */
public class GenericsUtils {
	private static final Log log = LogFactory.getLog(GenericsUtils.class);

	private GenericsUtils() {
	}

	/**
	 * ͨ����,��ö���Classʱ�����ĸ���ķ��Ͳ��������. ��public BookManager extends
	 * GenricManager<Book>
	 * 
	 * @param clazz
	 *            The class to introspect
	 * @return the first generic declaration, or <code>Object.class</code> if
	 *         cannot be determined
	 */
	public static Class getSuperClassGenricType(Class clazz) {
		return getSuperClassGenricType(clazz, 0);
	}

	/**
	 * ͨ����,��ö���Classʱ�����ĸ���ķ��Ͳ��������. ��public BookManager extends
	 * GenricManager<Book>
	 * 
	 * @param clazz
	 *            clazz The class to introspect
	 * @param index
	 *            the Index of the generic ddeclaration,start from 0.
	 * @return the index generic declaration, or <code>Object.class</code> if
	 *         cannot be determined
	 */
	public static Class getSuperClassGenricType(Class clazz, int index) {
		Type genType = clazz.getGenericSuperclass(); // 返回表示此 Class
														// 所表示的实体（类、接口、基本类型或
														// void）的直接超类的 Type
		if (!(genType instanceof ParameterizedType)) {
			// log.warn(clazz.getSimpleName() +
			// "'s superclass not ParameterizedType");
			return Object.class;
		}
		Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
		if (index >= params.length || index < 0) {
			// log.warn("Index: " + index + ", Size of " + clazz.getSimpleName()
			// + "'s Parameterized Type: " + params.length);
			return Object.class;
		}
		if (!(params[index] instanceof Class)) {
			// log.warn(clazz.getSimpleName() +
			// " not set the actual class on superclass generic parameter");
			return Object.class;
		}
		return (Class) params[index];
	}
}
