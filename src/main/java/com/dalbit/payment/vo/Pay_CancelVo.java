package com.dalbit.payment.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Pay_CancelVo{

    private String order_id;
    private String cancel_dt;
    private String cancel_state;
    private String fail_msg;
    private String op_name;


}
