package com.dalbit.enter.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_PaymentCancelOutputVo {
    private int canc_cnt;           // 취소 총건
    private int canc_cmt;           // 취소 총수량
    private int canc_amt;           // 취소 총금액
}
