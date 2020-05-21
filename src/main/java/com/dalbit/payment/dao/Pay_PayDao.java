package com.dalbit.payment.dao;

import com.dalbit.payment.vo.Pay_PayInputVo;
import com.dalbit.payment.vo.Pay_PayOutputVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Pay_PayDao {

    @Transactional(readOnly=true)
    ArrayList<Pay_PayOutputVo> getPayList(Pay_PayInputVo pay_PayInputVo);

    @Transactional(readOnly=true)
    int getPayListCnt(Pay_PayInputVo pay_PayInputVo);

}
