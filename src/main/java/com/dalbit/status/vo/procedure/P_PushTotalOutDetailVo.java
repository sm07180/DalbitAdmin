package com.dalbit.status.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_PushTotalOutDetailVo{

    private String date;
    private String hour;
    private String daily;
    private String monthly;
    private String month;
    private String day;
    private String year;
    private String male_send_cnt;
    private String male_succ_cnt;
    private String male_fail_cnt;
    private String male_succ_rate;
    private String female_send_cnt;
    private String female_succ_cnt;
    private String female_succ_rate;
    private String none_send_cnt;
    private String none_succ_cnt;
    private String none_fail_cnt;
    private String none_succ_rate;
    private String total_send_cnt;
    private String total_succ_cnt;
    private String total_fail_cnt;
    private String total_succ_rate;
}



