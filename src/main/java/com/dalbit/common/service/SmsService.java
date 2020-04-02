package com.dalbit.common.service;

import com.dalbit.common.dao.SmsDao;
import com.dalbit.common.vo.SmsVo;
import com.dalbit.util.DalbitUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class SmsService {

    @Autowired
    SmsDao smsDao;

    public void sendSms(SmsVo smsVo){

        smsVo.setSendPhoneNo(DalbitUtil.getProperty("sms.send.phone.no"));
        smsVo.setUmId(DalbitUtil.getProperty("sms.umid"));
        smsVo.setMsgType("0");

        smsDao.sendSms(smsVo);
    }
}
