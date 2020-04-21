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
}
