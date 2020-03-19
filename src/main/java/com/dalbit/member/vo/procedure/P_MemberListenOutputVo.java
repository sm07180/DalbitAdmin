package com.dalbit.member.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_MemberListenOutputVo extends SearchVo {

    //output
    private String dj_mem_no;
    private String dj_userId;
    private String dj_nickName;
    private String room_no;
    private String subject_type;
    private String title;
    private String start_date;
    private String end_date;
    private String listentime;
    private String forcedLeave;
    private int giftByeol;
    private int goodCnt;
    private int boosterCnt;

    //summary
    private int totalforcedCnt;
    private int totalByeol;
    private int totalGood;
    private int totalBooster;
}
