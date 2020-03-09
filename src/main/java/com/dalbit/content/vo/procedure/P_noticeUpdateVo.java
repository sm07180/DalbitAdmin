package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_noticeUpdateVo extends BaseVo {
    private int noticeIdx;
    private int slctType;
    private int platform;
    private int gender;
    private String title;
    private String contents;
    private int topFix;
    private int viewOn;
}
