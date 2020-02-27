package com.dalbit.member.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReportListVo extends PagingVo{

    /* member/notice/list 를 위한 Vo */
    /*input*/
    private String memNo;

    /*output*/
    private String idx;
    private String platform;
    private String type;
    private String reportMemNo;
    private String reportId;
    private String reportMemId;
    private String status;
    private String lastUpdDate;
    private String etc;
    private String deployDate;
    private String deployUser;
}
