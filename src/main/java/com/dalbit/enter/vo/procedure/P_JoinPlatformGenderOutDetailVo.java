package com.dalbit.enter.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_JoinPlatformGenderOutDetailVo {
    private String date;
    private String daily;
    private String monthly;
    private int hour;
    private int totalCnt;
    private int androidMCnt;
    private int androidFCnt;
    private int androidNCnt;
    private int iosMCnt;
    private int iosFCnt;
    private int iosNCnt;
    private int pcMCnt;
    private int pcFCnt;
    private int pcNCnt;

    // newJoin --------------------
    private String the_date;
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
