package com.dalbit.broadcast.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LikeVo {

    /*  intput  */
    private String roomNo;

    /* return result */
    private String memNo;
    private String memId;
    private String memNick;
    private String lastUpdDate;
    private int goodCnt;
    private int boostCnt;
    private int boostTime;

}