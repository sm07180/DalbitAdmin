package com.dalbit.payment.dao;

import com.dalbit.enter.vo.procedure.P_StatVo;
import com.dalbit.payment.vo.*;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface Pay_PayDao {

    @Transactional(readOnly=true)
    ArrayList<Pay_PayOutputVo> getPayList(Pay_PayInputVo pay_PayInputVo);

    @Transactional(readOnly=true)
    int getPayListCnt(Pay_PayInputVo pay_PayInputVo);

    @Transactional(readOnly=true)
    Pay_PayOutputVo getPaySummary(Pay_PayInputVo pay_PayInputVo);

    @Transactional(readOnly=true)
    Pay_PaySumOutputVo getTotalPaySum(P_StatVo pStatVo);

    @Transactional(readOnly=true)
    int selectIosAttempCnt(Pay_IosAttempInputVo payIosAttempInputVo);

    @Transactional(readOnly=true)
    List<Pay_IosAttempOutputVo> selectIosAttempList(Pay_IosAttempInputVo payIosAttempInputVo);

    @Transactional(readOnly=true)
    int selectCooconReceiptCnt(Pay_CooconReceiptInputVo payCooconReceiptInputVo);

    @Transactional(readOnly=true)
    List<Pay_CooconReceiptOutputVo> selectCooconReceiptList(Pay_CooconReceiptInputVo payCooconReceiptInputVo);

}
