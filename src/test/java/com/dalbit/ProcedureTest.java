package com.dalbit;

import com.dalbit.sample.service.NotificationManager;
import com.dalbit.sample.service.SampleService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;


@Slf4j
@SpringBootTest
@ActiveProfiles({"local"})
public class ProcedureTest {

    @Autowired
    SampleService sampleService;
    @Autowired
    NotificationManager notificationManager;

    @Test
    public void 알림톡테스트(){
        sampleService.getMultiResultSet();
    }


    @Test
    public void NotificationTest() {
        // test slack notification
        notificationManager.sendNotification();
    }
}
