package com.dalbit.payment.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Pay_CooconReceiptOutputVo extends PagingVo {

    private String pay_ok_date;
    private String rcpt_nm;
    private String order_id;
    private String mem_name;
    private String receipt_ok_number;
    private String receipt_code;
    private int pay_amt;
}
