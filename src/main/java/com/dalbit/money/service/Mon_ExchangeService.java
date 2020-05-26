package com.dalbit.money.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.exception.GlobalException;
import com.dalbit.money.dao.Mon_ExchangeDao;
import com.dalbit.money.vo.Mon_ExchangeInputVo;
import com.dalbit.money.vo.Mon_ExchangeOutputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import lombok.var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;

@Slf4j
@Service
public class Mon_ExchangeService {

    @Autowired
    Mon_ExchangeDao monExchangeDao;

    @Autowired
    GsonUtil gsonUtil;

    public String selectExchangeList(Mon_ExchangeInputVo monExchangeInputVo) throws GlobalException{

        int exchangeCnt = monExchangeDao.selectExchangeCnt(monExchangeInputVo);
        ArrayList<Mon_ExchangeOutputVo> exchangeList = monExchangeDao.selectExchangeList(monExchangeInputVo);

        var resultMap = new HashMap<>();
        resultMap.put("exchangeCnt", exchangeCnt);
        resultMap.put("exchangeList", exchangeList);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, resultMap));
    }


}
