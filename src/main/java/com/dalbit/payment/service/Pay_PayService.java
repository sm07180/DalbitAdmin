package com.dalbit.payment.service;

import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.payment.dao.Pay_PayDao;
import com.dalbit.payment.vo.Pay_PayVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dalbit.common.code.*;

import java.util.List;

@Slf4j
@Service
public class Pay_PayService {

    @Autowired
    Pay_PayDao payPayDao;

    @Autowired
    GsonUtil gsonUtil;

    /**
     *  결제 목록 조회
     */
    public String getPayList(Pay_PayVo payPayVo) {
        int getPayListCnt = payPayDao.getPayListCnt(payPayVo);
        payPayVo.setTotalCnt(getPayListCnt);
        List<Pay_PayVo> list = payPayDao.getPayList(payPayVo);
        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(payPayVo.getTotalCnt(), payPayVo.getPageStart(), payPayVo.getPageCnt())));

        return result;
    }

}
