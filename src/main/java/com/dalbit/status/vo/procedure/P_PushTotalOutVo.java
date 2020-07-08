package com.dalbit.status.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_PushTotalOutVo{

    private int sum_male_send_cnt;
    private int sum_male_succ_cnt;
    private int sum_male_fail_cnt;
    private int sum_female_send_cnt;
    private int sum_female_succ_cnt;
    private int sum_female_fail_cnt;
    private int sum_none_send_cnt;
    private int sum_none_succ_cnt;
    private int sum_none_fail_cnt;
    private int sum_total_send_cnt;
    private int sum_total_succ_cnt;
    private int sum_total_fail_cnt;

}