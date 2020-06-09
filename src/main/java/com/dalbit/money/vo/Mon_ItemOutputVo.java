package com.dalbit.money.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Mon_ItemOutputVo {

    private int rowNum;
    private String mem_no;
    private String mem_name;
    private String mem_userid;
    private String mem_nick;
    private String mem_sex;
    private int inner;
    private int currentGold;
    private int currentRuby;
    private String last_upd_date;
    private int ruby;
    private int gold;
    private String item_name;
    private int item_cnt;
    private String item_code;
    private String mem_grade;
    private int mem_level;
    private int changeCnt;
    private int sumRuby;
    private int sumGold;
}
