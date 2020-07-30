package com.dalbit.money.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_ResourceDetailByeolOutVo {

    private String date;
    private String hour;
    private String daily;
    private String day;
    private String monthly;
    private long changeCnt;
    private long giftCnt;
    private long levelupCnt;
    private long exchangeCnt;
    private long cancelCnt;
    private long eventCnt;
    private long blockCnt;
    private long withdrawalCnt;
    private long memTotalCnt;
    private long opChangeCnt;
    private long opGiftCnt;
    private long opExchangeCnt;
    private long opCancelCnt;
    private long opAdminCnt;
    private long opTestInCnt;
    private long opTestOutCnt;
    private long opEventCnt;
    private long opTotalCnt;

}
