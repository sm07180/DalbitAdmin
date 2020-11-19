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
    private int type;
    private int auto;

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
    private int totalAutoCnt;
    private int totalByeolCnt;
    private int totalDalCnt;
    private int maleCnt;
    private int maleAutoCnt;
    private int maleByeolCnt;
    private int maleDalCnt;
    private int femaleCnt;
    private int femaleAutoCnt;
    private int femaleByeolCnt;
    private int femaleDalCnt;
    private int noneAutoCnt;
    private int noneCnt;
    private int noneByeolCnt;
    private int noneDalCnt;
    private int testCnt;
    private int testAutoCnt;
    private int testByeolCnt;
    private int testDalCnt;

    private long totalExchangeAmt;
    private long maleExchangeAmt;
    private long femaleExchangeAmt;
    private long noneExchangeAmt;
    private long testExchangeAmt;

    private int changeAutoCnt;

    private int changemCnt;
    private int changefCnt;
    private int changenCnt;
    private int changetCnt;
    private int auto_changeCnt;
    private int auto_changemCnt;
    private int auto_changefCnt;
    private int auto_changenCnt;
    private int auto_changetCnt;

}
