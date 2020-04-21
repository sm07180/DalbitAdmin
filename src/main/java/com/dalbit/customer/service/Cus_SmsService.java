package com.dalbit.customer.service;

import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.customer.dao.Cus_SmsDao;
import com.dalbit.customer.vo.SmsVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dalbit.common.code.*;

import java.util.List;

@Slf4j
@Service
public class Cus_SmsService {

    @Autowired
    Cus_SmsDao cusSmsDao;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * sms 리스트 조회
     */
    public String getSmsList(SmsVo smsVo) {
        int count = cusSmsDao.getSmsListCnt(smsVo);
        smsVo.setTotalCnt(count);

        List<SmsVo> list = cusSmsDao.getSmsList(smsVo);

        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(smsVo.getTotalCnt(), smsVo.getPageStart(), smsVo.getPageCnt())));
        return result;
    }
}
