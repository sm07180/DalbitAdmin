package com.dalbit.schelduler;

import com.dalbit.schelduler.service.LuckyChatService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Slf4j
@Component
@Profile({"real"})
public class DallaScheduler {

    @Autowired
    LuckyChatService luckyChatService;

    // 00시부터 1시간 간격마다 럭키 채팅 관련(키보드워리어) 스케쥴러 실행
    @Scheduled(cron = "0 0 0/1 * * *")
    public void luckyChatRewardChoice() {
        luckyChatService.luckyChatRewardChoice();
    }
}