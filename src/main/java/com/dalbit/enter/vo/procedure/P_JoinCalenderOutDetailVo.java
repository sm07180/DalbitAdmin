package com.dalbit.enter.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_JoinCalenderOutDetailVo {
    private String the_date;
    private int total_join_mCnt;
    private int total_out_mCnt;
    private int total_join_fCnt;
    private int total_out_fCnt;
    private int total_join_nCnt;
    private int total_out_nCnt;
    private int total_join_Cnt;
    private int total_out_Cnt;
}