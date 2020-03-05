package com.dalbit.member.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BroadListVo extends PagingVo{

    /* member/broadcast/list 를 위한 Vo */

    private String subjectType;
    private String title;
    private String startDate;
    private String endDate;
    private String airtime;
    private int listener;
    private int good;
    private int gold;

    /* member/member/list 를 위한 Vo */
    private String roomNo;
    private String memId;
    private String memNo;
    private String memNick;
    private String memName;
    private String memPhone;
    private String memSlct;
    private String status;
    private String statusNm;


}
