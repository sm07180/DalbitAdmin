package com.dalbit.status.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_QuestionInfoOutVo {
    private int now_reg_cnt;
    private int yes_reg_cnt;
    private int now_inc_cnt;
    private int week_reg_cnt;
    private int bweek_reg_cnt;
    private int week_inc_cnt;
    private int month_reg_cnt;
    private int bmonth_reg_cnt;
    private int month_inc_cnt;
    private int now_nop_cnt;
    private int yes_nop_cnt;
    private int now_inc_amt;
    private int week_nop_cnt;
    private int bweek_nop_cnt;
    private int week_inc_amt;
    private int month_nop_cnt;
    private int bmonth_nop_cnt;
    private int month_inc_amt;
}