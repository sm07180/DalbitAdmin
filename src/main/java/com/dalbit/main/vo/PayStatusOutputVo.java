package com.dalbit.main.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PayStatusOutputVo {

    private String pay_way;
    private int pay_cnt;
    private int pay_amt;
}
