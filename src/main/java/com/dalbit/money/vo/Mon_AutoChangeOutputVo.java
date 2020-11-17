package com.dalbit.money.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Mon_AutoChangeOutputVo {

    // summary
    private int totalCnt;
    private int pageNo;
    private int pageCnt;
    private int totalMemberCnt;
    private int totalAutoCnt;
    private int totalAutoByeol;
    private int maleCnt;
    private int maleAutoCnt;
    private int maleAutoByeol;
    private int femaleCnt;
    private int femaleAutoCnt;
    private int femaleAutoByeol;
    private int noneCnt;
    private int noneAutoCnt;
    private int noneAutoByeol;
    private int testCnt;
    private int testAutoCnt;
    private int testAutoByeol;
    private int totalExchangeAmt;
    private int maleExchangeAmt;
    private int femaleExchangeAmt;
    private int noneExchangeAmt;
    private int testExchangeAmt;
    private int dateDiff;

    // output
    private int rowNum;
    private String change_date;
    private String last_upd_date;
    private String mem_no;
    private String mem_nick;
    private String mem_userid;
    private String mem_phone;
    private String mem_sex;
    private String mem_birth_year;
    private String inner;
    private String mem_age;
    private String change_cnt;
    private String auto_cnt;
    private String last_byeol;
    private String total_changebyeol;
    private String total_byeol;
    private int dal;

}
