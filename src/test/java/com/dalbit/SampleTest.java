package com.dalbit;

import com.dalbit.common.service.CommonService;
import com.dalbit.common.service.SmsService;
import com.dalbit.socket.service.SocketService;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.JwtUtil;
import com.dalbit.util.RestApiUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.scheduling.annotation.Async;
import org.springframework.test.context.ActiveProfiles;

import java.util.HashMap;

@Slf4j
@SpringBootTest
@ActiveProfiles({"local"})
public class SampleTest {

    @Autowired
    CommonService commonService;
    @Autowired
    RestApiUtil restApiUtil;
    @Autowired
    SocketService socketService;
    @Autowired
    JwtUtil jwtUtil;
    @Autowired
    SmsService smsService;


    @Test
    public void 테스트(){
        String phone = "01055606434";

        log.debug(DalbitUtil.convertPhoneNo(phone));

    }
}
