package com.dalbit.member.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeListVo extends PagingVo{

    /* member/notice/list 를 위한 Vo */
    /*input*/
    private String memNo;

    /*output*/
    private String roomNo;
    private String type;
    private String title;
    private String notice;
    private String lastUpdDate;

}
