package com.dalbit.status.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_ExchangeWeekOutDetailVo extends SearchVo {

    private String weekNo;
    private String week_startDate;
    private String week_endDate;
    private int specialdj_succ_Cnt;
    private int specialdj_succ_Amt;
    private int specialdj_succ_byeol_Cnt;
    private int succ_Cnt;
    private int succ_Amt;
    private int succ_byeol_Cnt;

}


