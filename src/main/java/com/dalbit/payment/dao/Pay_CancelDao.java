package com.dalbit.payment.dao;

import com.dalbit.payment.vo.Pay_CancelCardVo;
import com.dalbit.payment.vo.Pay_CancelVo;
import com.dalbit.payment.vo.Pay_PayVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Pay_CancelDao {

    int sendPayCancel(Pay_CancelVo payCancelVo);
}
