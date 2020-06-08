package com.dalbit.menu.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DjRankingVo extends PagingVo {

    /* input */
    private int rankType;    // 일간/주간/월간
    private String selectGubun;        // 검색구분(userID, user닉네임, 연락처, 이름)
    private String txt_search;

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
    private int money;
    private int byeol;
    private String gifted_mem_no;
    private int airCount;
    private String start_date;
    private int airTime;

}
