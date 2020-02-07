package com.dalbit.member.vo;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_MemberInfoVo {


    private int memLogin;
    private String mem_no;
    private String target_mem_no;
    private String memId;
    private String phone;
    private String passwd;
    private String nickName;
    private String memSex;
    private String birthYear;
    private String birthMonth;
    private String birthDay;
    private String slct;
    private String adid;
    private String state;
    private String mem_join_date;
    private String last_upd_date;
    private String name;
    private String email;
    private String profileImage;
    private int level;
    private String grade;
    private int exp;
    private int broadcastingCnt;
    private int listeningCnt;
    private int starCnt;
    private int fanCnt;

}
