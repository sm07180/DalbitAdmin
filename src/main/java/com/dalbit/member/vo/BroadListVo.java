package com.dalbit.member.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BroadListVo {

    /* member/broadcast/list 를 위한 Vo */

    private int subjectType;
    private String title;
    private String startDate;
    private String endDate;
    private int airtime;
    private int listener;
    private int good;
    private int gold;


}
