package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_noticeUpdateVo {
    private int noticeIdx;
    private int slctType;
    private int platform;
    private int gender;
    private String title;
    private String contents;
    private int topFix;
    private int viewOn;
    private String opName;
}
