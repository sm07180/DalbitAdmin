package com.dalbit.status.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_ExchangeTotalOutDetailVo extends SearchVo {

    private String date;
    private String hour;
    private String daily;
    private String monthly;
    private String day;
    private int tryCnt;
    private int tryAmt;
    private int succCnt;
    private int succAmt;
    private int cancCnt;
    private int cancAmt;

    private int inc_succCnt;
    private int inc_succAmt;

    private String the_date;
    private int specialdj_succ_Cnt = 0;
    private int specialdj_succ_Amt = 0;
    private int specialdj_succ_byeol_Cnt = 0;
    private int pm_succ_Cnt = 0;
    private int pm_succ_Amt = 0;
    private int pm_succ_byeol_Cnt = 0;
    private int succ_Cnt = 0;
    private int succ_Amt = 0;
    private int succ_byeol_Cnt = 0;
    private int sum_succ_cnt = 0;
    private int sum_succ_amt = 0;
    private int sum_pay_amt = 0;
    private String sum_exchange_per = "-";

    private int nSpecialdj_succ_Cnt = 0;
    private int nSpecialdj_succ_Amt = 0;
    private int nSpecialdj_succ_byeol_Cnt = 0;
    private int nPm_succ_Cnt = 0;
    private int nPm_succ_Amt = 0;
    private int nPm_succ_byeol_Cnt = 0;
    private int nSucc_Cnt = 0;
    private int nSucc_Amt = 0;
    private int nSucc_byeol_Cnt = 0;
    private int nSum_succ_cnt = 0;
    private int nSum_succ_amt = 0;
    private int nSum_pay_amt = 0;
    private String nSum_exchange_per = "-";

}



