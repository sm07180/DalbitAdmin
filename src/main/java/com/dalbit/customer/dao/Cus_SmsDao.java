package com.dalbit.customer.dao;

import com.dalbit.customer.vo.SmsVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface Cus_SmsDao {

    @Transactional(readOnly = true)
    List<SmsVo> getSmsList(SmsVo smsVo);

    @Transactional(readOnly = true)
    int getSmsListCnt(SmsVo smsVo);
}
