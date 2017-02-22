package com.xigeng.metroproject.log;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by free on 12/13/16.
 */
public class SystemLog {
    private static Logger logger = LoggerFactory.getLogger(SystemLog.class);
    public static void log(Object loginfo) {
        logger.debug(loginfo.toString());
    }
}
