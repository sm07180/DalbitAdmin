package com.dalbit.clip.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_ClipStatusAgeOutputVo extends BaseVo {
    private String date;	// 날짜
    private String year;	// 날짜
    private String month;	// 월
    private String hour;	// 시간
    private int reg_12_16_cnt;	// 12-16세 등록수
    private int del_12_16_cnt;	// 12-16세 삭제수
    private int reg_17_19_cnt;	// 17-19세 등록수
    private int del_17_19_cnt;	// 17-19세 삭제수
    private int reg_20_25_cnt;	// 20-25세 등록수
    private int del_20_25_cnt;	// 20-25세 삭제수
    private int reg_26_30_cnt;	// 26-30세 등록수
    private int del_26_30_cnt;	// 26-30세 삭제수
    private int reg_31_35_cnt;	// 31-35세 등록수
    private int del_31_35_cnt;	// 31-35세 삭제수
    private int reg_36_40_cnt;	// 36-40세 등록수
    private int del_36_40_cnt;	// 36-40세 삭제수
    private int reg_41_00_cnt;	// 41세 이상 등록수
    private int del_41_00_cnt;	// 41세 이상 삭제수
    private int reg_total_cnt;	// 전체 등록수
    private int del_total_cnt;	// 전체 삭제수
}
