package com.dalbit.content.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AttendanceBonusVo extends PagingVo {

    /* input */
    private String search_startDate;
    private String search_endDate;

    /* output */
    private int target_cnt;
    private int join_cnt;
    private int sex_man;
    private int sex_female;
    private int sex_unkwown;
    private int exp50;
    private int exp70;
    private int exp100;
    private int exp200;
    private int exp300;
    private int exp500;
    private int dal1;
    private int dal2;
    private int dal3;
    private int dal4;
    private int dal5;
    private int dal6;
    private int dal7;
    private int dal8;
    private int dal9;
    private int dal10;
    private int expSum;
    private int dalSum;
}
