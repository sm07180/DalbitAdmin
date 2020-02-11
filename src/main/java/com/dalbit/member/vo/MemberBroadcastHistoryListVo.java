package com.dalbit.member.vo;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberBroadcastHistoryListVo extends BaseVo {

    private String subject_type;
    private String title;
    private String start_date;
    private String end_date;
    private String airtime;
    private String listener;
    private String good;
    private String gold;

    /* member/member/list 를 위한 Vo */
    private String tmp;                 // 상세보기 구분
    private String memId;
    private String memNo;
    private String memNick;
    private String memName;
    private String memPhone;
    private String memSlct;




}
