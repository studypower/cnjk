package com.yakov.utils;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.Assert;

public class BeanUtils extends org.apache.commons.beanutils.BeanUtils {

	protected static final Log logger = LogFactory.getLog(BeanUtils.class);

	private BeanUtils() {
	}

	/**
	 * 获取私有属性值
	 * 
	 * @param object
	 * @param propertyName
	 * @return
	 * @throws IllegalAccessException
	 * @throws NoSuchFieldException
	 */
	static public Object getDeclaredProperty(Object object, String propertyName) throws IllegalAccessException, NoSuchFieldException {
		Assert.notNull(object);
		Assert.hasText(propertyName);
		Field field = object.getClass().getDeclaredField(propertyName);
		return getDeclaredProperty(object, field);
	}

	/**
	 * 获取私有属性值
	 * 
	 * @param object
	 * @param field
	 * @return
	 * @throws IllegalAccessException
	 */
	static public Object getDeclaredProperty(Object object, Field field) throws IllegalAccessException {
		Assert.notNull(object);
		Assert.notNull(field);
		boolean accessible = field.isAccessible();
		field.setAccessible(true);
		Object result = field.get(object);
		field.setAccessible(accessible);
		return result;
	}

	/**
	 * 更改私有属性值
	 * 
	 * @param object
	 * @param propertyName
	 * @param newValue
	 * @throws IllegalAccessException
	 * @throws NoSuchFieldException
	 */
	static public void setDeclaredProperty(Object object, String propertyName, Object newValue) throws IllegalAccessException, NoSuchFieldException {
		Assert.notNull(object);
		Assert.hasText(propertyName);

		Field field = object.getClass().getDeclaredField(propertyName);
		setDeclaredProperty(object, field, newValue);
	}

	/**
	 * 更改私有属性值
	 * 
	 * @param object
	 * @param field
	 * @param newValue
	 * @throws IllegalAccessException
	 */
	static public void setDeclaredProperty(Object object, Field field, Object newValue) throws IllegalAccessException {
		boolean accessible = field.isAccessible();
		field.setAccessible(true);
		field.set(object, newValue);
		field.setAccessible(accessible);
	}

	/**
	 * 调用私有方法
	 * 
	 * @param object
	 * @param methodName
	 * @param params
	 * @return
	 * @throws NoSuchMethodException
	 * @throws IllegalAccessException
	 * @throws InvocationTargetException
	 */
	static public Object invokePrivateMethod(Object object, String methodName, Object... params) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException {
		Assert.notNull(object);
		Assert.hasText(methodName);
		Class[] types = new Class[params.length];
		for (int i = 0; i < params.length; i++) {
			types[i] = params[i].getClass();
		}
		Method method = object.getClass().getDeclaredMethod(methodName, types);

		boolean accessible = method.isAccessible();
		method.setAccessible(true);
		Object result = method.invoke(object, params);
		method.setAccessible(accessible);
		return result;
	}

	/**
	 * 获取属性值列表
	 * 
	 * @param object
	 * @param type
	 * @return
	 */
	static public List<Field> getFieldsByType(Object object, Class type) {
		ArrayList<Field> list = new ArrayList<Field>();
		Field[] fields = object.getClass().getDeclaredFields();
		for (Field field : fields) {
			if (field.getType().isAssignableFrom(type)) {
				list.add(field);
			}
		}
		return list;
	}

	/**
	 * 根据属性名获取get方法名
	 * @param type
	 * @param fieldName
	 * @return
	 */
	public static String getAccessorName(Class type, String fieldName) {
		Assert.hasText(fieldName, "FieldName required");
		Assert.notNull(type, "Type required");
		if (type.getName().equals("boolean")) {
			return "is" + StringUtils.capitalize(fieldName);
		} else {
			return "get" + StringUtils.capitalize(fieldName);
		}
	}

	/**
	 * 根据属性名获取属性方法
	 * @param type
	 * @param fieldName
	 * @return
	 */
	public static Method getAccessor(Class type, String fieldName) {
		try {
			return type.getMethod(getAccessorName(type, fieldName));
		} catch (NoSuchMethodException e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}

	/**
	 * 将type里面的属性值拷贝到entity中
	 * @param type
	 * @param entity
	 * @return
	 */
	public static Object getFieldNames(Object type, Object entity) {
		Field[] fields = type.getClass().getDeclaredFields();
		Field[] fields_e = entity.getClass().getDeclaredFields();
		ArrayList<String> nameList = new ArrayList<String>();
		for (Field field : fields_e) {
			nameList.add(field.getName());
		}
		Object object = null;
		for (int i = 0; i < fields.length; i++) {
			try {
				object = getDeclaredProperty(type, fields[i].getName());
				if (null != object && !object.equals("null") && !object.equals("")) {
					if (nameList.contains(fields[i].getName())) {
						setDeclaredProperty(entity, fields[i].getName(), object);
					}
				}
			} catch (NoSuchFieldException e) {
				e.printStackTrace();
			} catch (IllegalAccessException ie) {
				ie.printStackTrace();
			}
		}
		return entity;
	}

}
