package com.dalbit.status.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_LevelOutputVo extends PagingVo {

    // output
    private int ranking;
    private String level;
    private String exp;
    private String grade;
    private String mem_no;
    private String mem_userid;
    private String mem_nick;
    private String mem_join_date;
    private int dal;
    private int byeol;
    private String mem_sex;
    private String age;
    private String broadDate;
    private String listenDate;
    private String newdj_badge;
    private String specialdj_badge;
    private String badge_value;
    private String expPro;
    private String nextLevelExp;
    private String memExp;
    private String levelUpDate;
    private String levelUpDay;
    private String present;
    private String receive;
    private int totRcvRubyCnt;
    private String fanNickName;
    private String lastLoginDate;
    private String loginDay;

    private int inner;
    private String ruby;
    private String gold;
    private String top1Fan;


    //summary
    private int totalLevelCnt;
    private int level0;
    private int level10;
    private int level20;
    private int level30;
    private int level40;
    private int level50;
    private int level60;
    private int level70;
    private int level80;
    private int level90;
    private int level100;

}
