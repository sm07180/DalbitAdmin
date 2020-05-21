package com.dalbit.payment.dao;

import com.dalbit.payment.vo.Pay_CancelVo;
import org.springframework.stereotype.Repository;

@Repository
public interface Pay_CancelDao {

    int sendPayCancel(Pay_CancelVo payCancelVo);
}
