package com.dalbit.menu.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LiveVo extends PagingVo {

    /* input */
    private int slctType;           // 검색구분(1.추천 2.인기 3.신입)
    private String subject_type;        // 방주제 구분
    private String selectGubun;        // 검색구분(userID, user닉네임, 연락처, 이름)
    private String txt_search;

    /* output */
    private String image_profile;
    private int badge_recomm;
    private int badge_popular;
    private int badge_newdj;
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
