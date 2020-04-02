package com.dalbit.common.dao;

import com.dalbit.common.vo.SmsVo;
import org.springframework.stereotype.Repository;

@Repository
public interface SmsDao {
    void sendSms(SmsVo smsVo);
}
