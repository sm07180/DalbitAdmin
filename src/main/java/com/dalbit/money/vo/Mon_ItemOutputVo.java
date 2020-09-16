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
    private String mem_birth_year;
    private String mem_birth_month;
    private String mem_birth_day;
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
    private int totalDal;
    private int totalByeol;

    private int ruby_old;
    private int gold_old;
    private int ruby_new;
    private int gold_new;


    // summary
    private int changeMale;
    private int changeFemale;
    private int modByeol;
    private int modDal;
    private int totalCnt;
    private int sumTotalByeol;
    private int sumTotalDal;
    private int maleCnt;
    private int maleByeolCnt;
    private int maleDalCnt;
    private int femaleCnt;
    private int femaleByeolCnt;
    private int femaleDalCnt;
    private int noneCnt;
    private int noneByeolCnt;
    private int noneDalCnt;
    private int testCnt;
    private int testByeolCnt;
    private int testDalCnt;

    private int totalExchangeAmt;
    private int maleExchangeAmt;
    private int femaleExchangeAmt;
    private int noneExchangeAmt;
    private int testExchangeAmt;


}
