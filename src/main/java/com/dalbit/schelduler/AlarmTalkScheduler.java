package com.dalbit.schelduler;

import com.dalbit.administrate.service.Adm_AlarmTalkService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Component;

@Slf4j
@Component
@Profile({"dev"})
public class AlarmTalkScheduler {

    @Autowired
    Adm_AlarmTalkService admAlarmTalkService;

    //TODO 통계 알림톡 발송 스케쥴링 시간 추가 필요
//    @Scheduled(cron = "45 * * * * *")
    protected void sendStatusAlarmTalk() {
        // 달빛라이브 통계 알림톡 발송 요청
        admAlarmTalkService.sendStatusAlarmTalk();
    }
}
