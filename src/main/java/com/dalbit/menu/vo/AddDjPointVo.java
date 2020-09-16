package com.dalbit.menu.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AddDjPointVo extends PagingVo {

    /* input */
    private String selectGubun;        // 검색구분(userID, user닉네임, 연락처, 이름)
    private String txt_search;
    private String sDate;
    private String eDate;
    private int liveCnt;
    private String liveDate;

    /* output */
    private int djRank;
    private String memNo;
    private String upDown;
    private String image_profile;
    private String mem_id;
    private int level;
    private String grade;
    private String mem_nick;
    private String mem_sex;
    private String mem_birth_year;
    private int rankPoint;
    private String addPointTotal;
    private String addPointRank1;
    private String addPointRank2;
    private String addPointRank3;
    private String addPoint1;
    private String addPoint2;
    private String addPoint3;
}