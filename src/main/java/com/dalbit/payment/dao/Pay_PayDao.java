package com.dalbit.payment.dao;

import com.dalbit.enter.vo.procedure.P_StatVo;
import com.dalbit.payment.vo.Pay_PayInputVo;
import com.dalbit.payment.vo.Pay_PayOutputVo;
import com.dalbit.payment.vo.Pay_PaySumOutputVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Pay_PayDao {

    @Transactional(readOnly=true)
    ArrayList<Pay_PayOutputVo> getPayList(Pay_PayInputVo pay_PayInputVo);

    @Transactional(readOnly=true)
    int getPayListCnt(Pay_PayInputVo pay_PayInputVo);
    Pay_PayOutputVo getPaySummary(Pay_PayInputVo pay_PayInputVo);


    Pay_PaySumOutputVo getTotalPaySum(P_StatVo pStatVo);

}
