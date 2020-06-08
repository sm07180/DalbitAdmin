package com.dalbit.status.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_ExchangeTotalOutVo extends SearchVo {

    private int sum_tryCnt;
    private int sum_tryAmt;
    private int sum_succCnt;
    private int sum_succAmt;
    private int sum_cancCnt;
    private int sum_cancAmt;
}