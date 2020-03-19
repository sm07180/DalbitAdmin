package com.dalbit.member.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_MemberBroadcastOutputVo extends SearchVo {

    //output
    private String room_no;
    private String subject_type;
    private String title;
    private String start_date;
    private String end_date;
    private String airtime;
    private int listenerCnt;
    private int managerCnt;
    private int giftCnt;
    private int byeolCnt;
    private int goodCnt;
    private int boosterCnt;

    //summary
    private int totalListenerCnt;
    private int totalGiftCnt;
    private int totalByeol;
    private int totalGood;
    private int totalBooster;
}
