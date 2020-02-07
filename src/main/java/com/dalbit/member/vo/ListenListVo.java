package com.dalbit.member.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ListenListVo {

    /* member/listen/list 를 위한 Vo */
    private int subjectType;
    private String title;
    private String startDate;
    private String endDate;
    private String listenTime;
    private int giftRuby;
    private String memNick;

}
