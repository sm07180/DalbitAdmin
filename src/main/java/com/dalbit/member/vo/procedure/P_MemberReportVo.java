package com.dalbit.member.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_MemberReportVo {

    private String opName;
    private String mem_no;
    private String mem_userid;
    private String mem_nick;
    private String ip;
    private String browser;
    private String flatform;
    private String reported_mem_no;
    private String reported_userid;
    private String reported_nick;
    private String reported_phone;
    private int reported_level;
    private String reported_grade;
    private String slctReason;
    private int slctType;
    private String notiContents;
    private String memo;
    private String notimemo;
    private int blockDay;

}