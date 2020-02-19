package com.dalbit.broadcast.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ListenerVo {

    /*  intput  */
    private String roomNo;

    /* return result */
    private String memNo;
    private String memId;
    private String memNick;
    private String listenStDate;
    private String listenEdDate;
    private String listenTime;
    private String giftRuby;
    private String likeCnt;
    private String itemCnt;
}