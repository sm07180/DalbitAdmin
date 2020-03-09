package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class P_noticeListDetailOutputVo {
    private int noticeIdx;
    private String slctType;
    private int platform;
    private String gender;
    private String title;
    private String contents;
    private int topFix;
    private int viewOn;
    private int viewCnt;
    private String opName;
    private Date offDate;
    private Date writeDate;

}
