package com.dalbit.money.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_memberBoostStatOutputVo {
    
    private int sum_userInCnt;
    private int sum_testInCnt;
    private int sum_userOutCnt;
    private int sum_testOutCnt;
    private int sum_userUseCnt;
    private int sum_testUseCnt;

    private String date;
    private String month;
    private int hour;
    private int userInCnt;
    private int testInCnt;
    private int userOutCnt;
    private int testOutCnt;
    private int userUseCnt;
    private int testUseCnt;

}
