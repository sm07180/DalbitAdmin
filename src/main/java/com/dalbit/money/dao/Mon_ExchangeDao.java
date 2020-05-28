package com.dalbit.money.dao;

import com.dalbit.money.vo.Mon_ExchangeInputVo;
import com.dalbit.money.vo.Mon_ExchangeOutputVo;
import com.dalbit.payment.vo.Pay_CancelVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Mon_ExchangeDao {

    @Transactional(readOnly = true)
    ArrayList<Integer> selectSummaryInfo(Mon_ExchangeInputVo monExchangeInputVo);

    @Transactional(readOnly = true)
    int selectExchangeCnt(Mon_ExchangeInputVo monExchangeInputVo);

    @Transactional(readOnly = true)
    ArrayList<Mon_ExchangeOutputVo> selectExchangeList(Mon_ExchangeInputVo monExchangeInputVo);

    @Transactional(readOnly = true)
    Mon_ExchangeOutputVo selectExchangeDetail(Mon_ExchangeInputVo monExchangeInputVo);

    int updateExchangeDetail(Mon_ExchangeOutputVo monExchangeOutputVo);

    int updateExchangeComplete(Mon_ExchangeOutputVo monExchangeOutputVo);

    int updateExchangeMultiComplete(Mon_ExchangeInputVo monExchangeInputVo);

}
