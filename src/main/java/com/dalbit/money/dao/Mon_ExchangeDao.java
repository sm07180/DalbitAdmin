package com.dalbit.money.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.money.vo.Mon_EnableOutputVo;
import com.dalbit.money.vo.Mon_ExchangeInputVo;
import com.dalbit.money.vo.Mon_ExchangeOutputVo;
import com.dalbit.money.vo.Mon_ExchangeSummaryOutputVo;
import com.dalbit.payment.vo.Pay_CancelVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Mon_ExchangeDao {

    @Transactional(readOnly = true)
    ArrayList<Integer> selectSummaryInfo(Mon_ExchangeInputVo monExchangeInputVo);

    @Transactional(readOnly = true)
    ArrayList<Mon_ExchangeSummaryOutputVo> selectStatSummaryInfo(Mon_ExchangeInputVo monExchangeInputVo);

    @Transactional(readOnly = true)
    int selectExchangeCnt(Mon_ExchangeInputVo monExchangeInputVo);

    @Transactional(readOnly = true)
    ArrayList<Mon_ExchangeOutputVo> selectExchangeList(Mon_ExchangeInputVo monExchangeInputVo);

    @Transactional(readOnly = true)
    ArrayList<Mon_ExchangeOutputVo> selectCompleteExchangeList(Mon_ExchangeInputVo monExchangeInputVo);

    @Transactional(readOnly = true)
    Mon_EnableOutputVo selectEnableCnt(Mon_ExchangeInputVo monExchangeInputVo);

    @Transactional(readOnly = true)
    Mon_EnableOutputVo selectExchangeCash(Mon_ExchangeInputVo monExchangeInputVo);

    @Transactional(readOnly = true)
    Mon_EnableOutputVo totalExchangeCash(Mon_ExchangeInputVo monExchangeInputVo);

    @Transactional(readOnly = true)
    ArrayList<Mon_EnableOutputVo> selectEnableList(Mon_ExchangeInputVo monExchangeInputVo);

    @Transactional(readOnly = true)
    Mon_ExchangeOutputVo selectExchangeDetail(Mon_ExchangeInputVo monExchangeInputVo);

    int updateExchangeDetail(Mon_ExchangeOutputVo monExchangeOutputVo);

    int updateLastReject(Mon_ExchangeOutputVo monExchangeOutputVo);

    int updateExchangeComplete(Mon_ExchangeOutputVo monExchangeOutputVo);

    int updateExchangeMultiComplete(Mon_ExchangeInputVo monExchangeInputVo);

    ProcedureVo callExchangeCancel(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    int testid_historyCnt(String mem_no);

}
