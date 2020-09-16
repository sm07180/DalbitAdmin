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
    private int specialdj_succ_Cnt;
    private int specialdj_succ_Amt;
    private int specialdj_succ_byeol_Cnt;
    private int succ_Cnt;
    private int succ_Amt;
    private int succ_byeol_Cnt;

    private int nSpecialdj_succ_Cnt;
    private int nSpecialdj_succ_Amt;
    private int nSpecialdj_succ_byeol_Cnt;
    private int nSucc_Cnt;
    private int nSucc_Amt;
    private int nSucc_byeol_Cnt;

}



