package com.irs.scheduled;

import com.irs.service.LogService;
import com.irs.util.DateUtil;
import com.irs.util.GlobalUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * 自动清除系统日志
 * @author Mr Du
 *
 */

@Component
public class MethodLogScheduled {
    private static Logger LOGGER = Logger.getLogger(MethodLogScheduled.class);
    private static final String LOGDAYS = "log.days";

    @Autowired
    private LogService logServiceImpl;

    public void clearLog() {
        int logDays = Integer.valueOf(GlobalUtil.getValue(LOGDAYS));
        Date date = DateUtil.getDate(DateUtil.getDate(), -logDays);
        int count =logServiceImpl.delLogsByDate(date);
        LOGGER.info("delete from MethodLog count:" + count + ", createDate < "
                + DateUtil.getStringDate(date, DateUtil.DateFormat1));
    }
}
