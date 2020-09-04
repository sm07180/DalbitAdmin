package com.dalbit.broadcast.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_LiveListenerListOutputVo extends PagingVo {

    /* return result */
    private String roomNo;
    private String title;
    private String djMemNo;
    private String djNickNm;
    private int auth;
    private int os_type;
    private String gender;
    private String profImg;
    private String memNo;
    private String nickNm;
    private int age;
    private String joinDt;
    private String listenTime;
    private int listenCnt;
    private int goodCnt;
    private int giftCnt;
    private int boosterCnt;
    private String inner;

    /* summary */
    private int aosCnt;
    private int iosCnt;
    private int pcCnt;
    private int maleCnt;
    private int femaleCnt;
    private int noneCnt;
    private int noneMemberCnt;
}


