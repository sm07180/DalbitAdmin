package com.dalbit.member.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_MemberListOutputVo extends SearchVo {

    private String mem_userid;
    private String mem_no;
    private String mem_nick;
    private String memName;
    private String mem_phone;
    private String mem_slct;
    private String joinDate;
    private String last_connect_date;
    private int connectCnt;
    private String payCntAmount;
    private int mem_state;
    private String connectState;
    private String liveBroad;
}
