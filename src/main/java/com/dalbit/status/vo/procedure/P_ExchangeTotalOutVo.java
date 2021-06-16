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

    private int inc_sum_tryCnt;
    private int inc_sum_tryAmt;
    private int inc_sum_succCnt;
    private int inc_sum_succAmt;
    private int inc_sum_cancCnt;
    private int inc_sum_cancAmt;

    private int tot_specialdj_succ_Cnt;
    private int tot_specialdj_succ_Amt;
    private int tot_specialdj_succ_byeol_Cnt;
    private int tot_succ_Cnt;
    private int tot_succ_Amt;
    private int tot_succ_byeol_Cnt;
    private int tot_pay_amt;

    private int nTot_specialdj_succ_Cnt;
    private int nTot_specialdj_succ_Amt;
    private int nTot_specialdj_succ_byeol_Cnt;
    private int nTot_succ_Cnt;
    private int nTot_succ_Amt;
    private int nTot_succ_byeol_Cnt;
    private int nTot_pay_amt;
}