package com.dalbit.status.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_LevelSearchSummaryOutputVo {
    private int totalLevelCnt;      // 회원수
    private int level0;              // 0레벨수
    private int level1_10;           // 1~10레벨수
    private int level11_20;          // 11~20레벨수
    private int level21_30;          // 21~30레벨수
    private int level31_40;	        // 31~40레벨수
    private int level41_50;	        // 41~50레벨수
    private int level51_60;	        // 51~60레벨수
    private int level61_70;	        // 61~70레벨수
    private int level71_120;	        // 71~120레벨수
}
