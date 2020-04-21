package com.dalbit.customer.dao;

import com.dalbit.customer.vo.SmsVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Cus_SmsDao {
    List<SmsVo> getSmsList(SmsVo smsVo);
    int getSmsListCnt(SmsVo smsVo);
}
