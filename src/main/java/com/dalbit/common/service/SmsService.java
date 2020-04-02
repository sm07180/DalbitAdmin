package com.dalbit.common.service;

import com.dalbit.common.code.ErrorStatus;
import com.dalbit.common.dao.SmsDao;
import com.dalbit.common.vo.SmsVo;
import com.dalbit.exception.GlobalException;
import com.dalbit.util.DalbitUtil;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class SmsService {

    @Autowired
    SmsDao smsDao;

    public void sendSms(SmsVo smsVo)throws GlobalException{

        smsVo.setPhoneNo(smsVo.getPhoneNo().replaceAll("-", ""));

        if(!DalbitUtil.isSmsPhoneNoChk(smsVo.getPhoneNo())){
            throw new GlobalException(ErrorStatus.휴대폰번호검증오류);
        }
        smsVo.setSendPhoneNo(DalbitUtil.getProperty("sms.send.phone.no"));
        smsVo.setUmId(DalbitUtil.getProperty("sms.umid"));
        smsVo.setMsgType("0");

        smsDao.sendSms(smsVo);
    }
}
