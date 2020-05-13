package com.dalbit.payment.dao;

import com.dalbit.payment.vo.Pay_PayVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface Pay_PayDao {

    ArrayList<Pay_PayVo> getPayList(Pay_PayVo payPayVo);
    int getPayListCnt(Pay_PayVo payPayVo);

}
