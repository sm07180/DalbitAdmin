package com.dalbit.schelduler;

import com.dalbit.content.service.AlarmTalkService;
import com.dalbit.content.vo.procedure.P_AlarmTalkInsertVo;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

@Slf4j
@Component
public class AlarmTalkScheduler {

    @Autowired
    AlarmTalkService alarmTalkService;

    @Scheduled(cron = "45 * * * * *")
    protected void deleteTemp() {
        SimpleDateFormat yyyymm = new SimpleDateFormat("/YYYY/MM");

        Date now = new Date();
        Calendar cal = new GregorianCalendar();
        cal.setTime(now);
        cal.add(Calendar.DATE, -2);

        System.out.println(now);

        List<P_AlarmTalkInsertVo> list = alarmTalkService.callSpStatGetData();

        System.out.println(new Gson().toJson(list));
    }
}
