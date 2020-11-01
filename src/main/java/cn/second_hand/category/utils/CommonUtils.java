package cn.second_hand.category.utils;

import java.util.Map;
import java.util.UUID;

import org.apache.commons.beanutils.BeanUtils;

public class CommonUtils {
	
	public static String uuid() {
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
	}
	
	
	public static <T> T toBean(Map map, Class<T> c) {
		try {
			T bean = c.newInstance();
			
			BeanUtils.populate(bean, map);
			
			return bean;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
