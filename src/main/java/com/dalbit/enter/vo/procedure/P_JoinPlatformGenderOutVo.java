package com.dalbit.enter.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_JoinPlatformGenderOutVo {
    private int sum_totalCnt;
    private int sum_androidMCnt;
    private int sum_androidFCnt;
    private int sum_androidNCnt;
    private int sum_iosMCnt;
    private int sum_iosFCnt;
    private int sum_iosNCnt;
    private int sum_pcMCnt;
    private int sum_pcFCnt;
    private int sum_pcNCnt;

    // newJoin --------------------
    private int aos_total_join_mCnt;
    private int aos_total_out_mCnt;
    private int aos_total_join_fCnt;
    private int aos_total_out_fCnt;
    private int aos_total_join_nCnt;
    private int aos_total_out_nCnt;
    private int ios_total_join_mCnt;
    private int ios_total_out_mCnt;
    private int ios_total_join_fCnt;
    private int ios_total_out_fCnt;
    private int ios_total_join_nCnt;
    private int ios_total_out_nCnt;
    private int pc_total_join_mCnt;
    private int pc_total_out_mCnt;
    private int pc_total_join_fCnt;
    private int pc_total_out_fCnt;
    private int pc_total_join_nCnt;
    private int pc_total_out_nCnt;
}
