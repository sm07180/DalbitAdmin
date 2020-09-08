package com.dalbit.status.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_NewBroadcastTimeOutVo {

    private String the_date;
    private String the_hr;
    private int create_mCnt;
    private int create_fCnt;
    private int create_nCnt;
    private int create_max_Cnt;
    private int listener_mCnt;
    private int listener_fCnt;
    private int listener_nCnt;
    private int listener_max_Cnt;
    private int airtime;
    private int gift_Cnt;
    private int gift_Amt;


    private int total_create_mCnt;
    private int total_create_fCnt;
    private int total_create_nCnt;
    private int total_create_max_Cnt;
    private int total_listener_mCnt;
    private int total_listener_fCnt;
    private int total_listener_nCnt;
    private int total_listener_max_Cnt;
    private int total_airtime;
    private int total_gift_Cnt;
    private int total_gift_Amt;
}


