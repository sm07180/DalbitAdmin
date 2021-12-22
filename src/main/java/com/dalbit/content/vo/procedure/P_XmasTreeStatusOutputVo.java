package com.dalbit.content.vo.procedure;

import lombok.Data;

import java.util.Date;

@Data
public class P_XmasTreeStatusOutputVo {
    private int send_like_cnt;
    private int send_like_score_cnt;
    private int send_booster_cnt;
    private int send_booster_score_cnt;
    private int tot_score_cnt;
}
