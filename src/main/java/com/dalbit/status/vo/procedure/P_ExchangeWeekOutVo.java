package com.dalbit.status.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_ExchangeWeekOutVo extends SearchVo {

    private int tot_specialdj_succ_Cnt;
    private int tot_specialdj_succ_Amt;
    private int tot_specialdj_succ_byeol_Cnt;
    private int tot_pm_succ_Cnt;
    private int tot_pm_succ_Amt;
    private int tot_pm_succ_byeol_Cnt;
    private int tot_succ_Cnt;
    private int tot_succ_Amt;
    private int tot_succ_byeol_Cnt;

    private int tot_month_succ_Cnt;
    private int tot_month_succ_Amt;
    private int tot_month_succ_byeol_Cnt;
}