package com.dalbit.clip.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_DeclarationOperateVo extends BaseVo{
    private int reportIdx;
    private int opCode;
    private int sendNoti;
    private String notiContents;
    private String notiMemo;
}
