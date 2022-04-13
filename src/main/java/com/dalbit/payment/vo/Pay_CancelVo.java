package com.dalbit.payment.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Pay_CancelVo{

    //old
    private String order_id;
    private String cancel_dt;
    private String cancel_state;
    private String fail_msg;
    private String op_name;

    //new
    private String orderId ;      //VARCHAR(100) 주문번호(STRING)
    private String cancelState;   //ENUM('y','n','f') 취소처리상태
    private String payYn = "f";   //ENUM('y','n','f') 결제완료여부
    private String cancelDt;      //VARCHAR(30) 결제취소일자
    private String failMsg;       //TEXT 취소실패사유
    private String opName;        //VARCHAR(50) 처리자명


}
