package com.dalbit.payment.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Pay_JsonCancelVo {

    private String pgcode;
    private String client_id;
    private String user_id;
    private String tid;
    private int amount;
    private String ip_addr;

}
