package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_RebrandCollectSummaryOutputVo {
    private int ins_d_cnt;      // 이니셜 d(획득)
    private int ins_a_cnt;		// 이니셜 a(획득)
    private int ins_l_cnt;		// 이니셜 l(획득)
    private int use_d_cnt;	    // 이니셜 d(사용)
    private int use_a_cnt;		// 이니셜 a(사용)
    private int use_l_cnt;		// 이니셜 l(사용)
    private int tot_cnt;		// 총수
}
