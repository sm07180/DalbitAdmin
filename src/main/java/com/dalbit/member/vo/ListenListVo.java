package com.dalbit.member.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ListenListVo extends PagingVo {

    //input
    private String tmp;                 // 상세보기 구분
    private String memNo;

    //output
    /* member/listen/list 를 위한 Vo */
    private String roomNo;
    private String subjectType;
    private String title;
    private String startDate;
    private String endDate;
    private String listenTime;
    private String memId;
    private String memNick;
    private int ruby;
    private int like;

}
