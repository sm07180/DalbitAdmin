package com.dalbit.member.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ListenListVo {

    //input
    private String tmp;                 // 상세보기 구분
    private String memNo;

    //output
    /* member/listen/list 를 위한 Vo */
    private String subjectType;
    private String title;
    private String startDate;
    private String endDate;
    private String listenTime;
    private int giftRuby;
    private String memNick;

}
