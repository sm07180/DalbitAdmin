package com.dalbit.common.dao;

import com.dalbit.common.vo.SmsVo;
import org.springframework.stereotype.Repository;

@Repository
public interface SmsDao {
    int sendSms(SmsVo smsVo);

    int sendSmsTargetTest(SmsVo smsVo);

    int sendSmsTargetMemberAll(SmsVo smsVo);
}
