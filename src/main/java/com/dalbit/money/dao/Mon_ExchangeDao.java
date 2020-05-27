package com.dalbit.money.dao;

import com.dalbit.money.vo.Mon_ExchangeInputVo;
import com.dalbit.money.vo.Mon_ExchangeOutputVo;
import com.dalbit.payment.vo.Pay_CancelVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface Mon_ExchangeDao {

    int selectExchangeCnt(Mon_ExchangeInputVo monExchangeInputVo);
    ArrayList<Mon_ExchangeOutputVo> selectExchangeList(Mon_ExchangeInputVo monExchangeInputVo);

    ArrayList<Integer> selectSummaryInfo(Mon_ExchangeInputVo monExchangeInputVo);
}
