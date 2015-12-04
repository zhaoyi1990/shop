package com.csxh.eshop.util;

import org.apache.log4j.Logger;

public class Log4jUtil {

	private static Logger logger = Logger.getLogger(Log4jUtil.class);

	public static void debug(Object message) {
		logger.debug(message);
	}

	public static void info(Object message) {
		logger.info(message);
	}

	public static void warn(Object message) {
		logger.warn(message);
	}
}
