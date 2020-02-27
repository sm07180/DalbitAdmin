package com.dalbit.member.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MyStarListVo extends PagingVo{

    /* member/MyStar/list 를 위한 Vo */
    /*input*/
    private String memNo;

    /*output*/
    private String memId;
    private String memNick;
    private String regDate;
    private String tmp1;        /*보낸건수*/
    private String tmp2;        /*보낸개수*/
    private String tmp3;        /*해제일시*/

}
