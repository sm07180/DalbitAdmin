package com.dalbit.payment.dao;

import com.dalbit.payment.vo.Pay_PayVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Pay_PayDao {

    @Transactional(readOnly=true)
    ArrayList<Pay_PayVo> getPayList(Pay_PayVo payPayVo);

    @Transactional(readOnly=true)
    int getPayListCnt(Pay_PayVo payPayVo);

}
