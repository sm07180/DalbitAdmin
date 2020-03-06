package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_noticeInsertVo extends BaseVo {
    private String slctType;
    private String title;
    private String contents;
    private int topFix;
    private int viewOn;
}

