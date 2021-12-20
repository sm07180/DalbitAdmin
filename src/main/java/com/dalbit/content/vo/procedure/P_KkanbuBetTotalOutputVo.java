package com.dalbit.content.vo.procedure;

import lombok.Data;

@Data
public class P_KkanbuBetTotalOutputVo {
    private int tot_betting_cnt;    // 총배팅 건수
    private int add_betting_cnt;    // 홀배팅수
    private int even_betting_cnt;   // 짝배팅수
    private int add_cnt;            // 홀나온수
    private int even_cnt;           // 짝나온수
}
