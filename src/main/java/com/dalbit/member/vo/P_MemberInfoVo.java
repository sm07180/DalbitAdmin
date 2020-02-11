package com.dalbit.member.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_MemberInfoVo {
    private int memLogin;
    private String memNo;
    private String memId;
    private String memPhone;
    private String memPasswd;
    private String memNick;
    private String memSex;
    private String birthYear;
    private String birthMonth;
    private String birthDay;
    private String memSlct;
    private String memAdid;
    private String state;
    private String mem_join_date;
    private String last_upd_date;
    private String memName;
    private String memEmail;
    private String profileImage;
    private int level;
    private String grade;
    private int exp;
    private int broadcastingCnt;
    private int listeningCnt;
    private int starCnt;
    private int fanCnt;

}
