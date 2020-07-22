package com.dalbit.payment.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Pay_CooconReceiptOutputVo {

    private int rowNum;

    private String pay_ok_date;
    private String rcpt_nm;
    private String order_id;
    private String mem_name;
    private String mem_state;
    private String image_profile;
}
