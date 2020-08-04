package com.dalbit.menu.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FanRankingVo extends PagingVo {

    /* input */
    private int rankType;    // 일간/주간/월간
    private String selectGubun;        // 검색구분(userID, user닉네임, 연락처, 이름)
    private String txt_search;
    private String sDate;
    private String eDate;
    private int liveCnt;
    private String liveDate;

    /* output */
    private int fanRank;
    private String upDown;
    private String image_profile;
    private String mem_no;
    private String mem_id;
    private int level;
    private String grade;
    private String mem_nick;
    private String mem_sex;
    private int money;
    private int byeol;
    private String gifted_mem_no;
    private int airCount;
    private String start_date;
    private int airTime;

    private String mem_birth_year;
    private String mem_birth_month;
    private String mem_birth_day;

    private String reward_rank;
    private String reward_dal;
    private String reward_byeol;
    private String reward_exp;
    private String reward_yn;

    private int broadCnt;
    private int listenCnt;
    private int goodCnt;
    private int rankPoint;
    private int itemCnt;

}
