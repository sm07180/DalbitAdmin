package com.dalbit.status.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_ExchangeTotalOutVo extends SearchVo {

    private long sum_tryCnt;
    private long sum_tryAmt;
    private long sum_succCnt;
    private long sum_succAmt;
    private long sum_cancCnt;
    private long sum_cancAmt;

    private long inc_sum_tryCnt;
    private long inc_sum_tryAmt;
    private long inc_sum_succCnt;
    private long inc_sum_succAmt;
    private long inc_sum_cancCnt;
    private long inc_sum_cancAmt;

    private long tot_specialdj_succ_Cnt;
    private long tot_specialdj_succ_Amt;
    private long tot_specialdj_succ_byeol_Cnt;
    private long tot_pm_succ_Cnt;
    private long tot_pm_succ_Amt;
    private long tot_pm_succ_byeol_Cnt;
    private long tot_succ_Cnt;
    private long tot_succ_Amt;
    private long tot_succ_byeol_Cnt;
    private long tot_pay_amt;

    private long nTot_specialdj_succ_Cnt;
    private long nTot_specialdj_succ_Amt;
    private long nTot_specialdj_succ_byeol_Cnt;
    private long nTot_pm_succ_Cnt;
    private long nTot_pm_succ_Amt;
    private long nTot_pm_succ_byeol_Cnt;
    private long nTot_succ_Cnt;
    private long nTot_succ_Amt;
    private long nTot_succ_byeol_Cnt;
    private long nTot_pay_amt;
}