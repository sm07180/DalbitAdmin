package com.dalbit.payment.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.payment.vo.Pay_CancelVo;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface Pay_CancelDao {

    //old
//    int sendPayCancel(Pay_CancelVo payCancelVo);

    //결제 취소 등록(new)
    @Select("CALL rd_data.p_pay_cancel_proc(#{orderId}, #{cancelState}, #{payYn}, #{cancelDt}, #{failMsg}, #{opName})")
    Integer sendPayCancel(Pay_CancelVo payCancelVo);


    ProcedureVo dalCancel(ProcedureVo procedureVo);
}
