package com.dalbit.broadcast.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_GuestListOutputVo extends PagingVo {

    /* return result */
    private int auth;
    private int state;
    private String mem_no;
    private String mem_nick;
    private String mem_sex;
    private String mem_birth_year;
    private String level;
    private String grade;
    private int giftCnt;
    private int giftGold;
    private String start_date;
    private String end_date;
    private int air_time;

    /* summary */
    private String totalAirTime;
    private int totalGiftCnt;
    private int totalGiftGold;
    private int totalSexM;
    private int totalSexF;
    private int totalSexN;

}


