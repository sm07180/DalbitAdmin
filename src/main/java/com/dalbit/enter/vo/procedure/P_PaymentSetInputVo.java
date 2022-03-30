package com.dalbit.enter.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_PaymentSetInputVo {
    private String setSlct;         // [y:오픈,n:숨김]
    private int paySlct;            // [1:ios, 2:aos]
    private String chrgrName;       // 관리자명
}