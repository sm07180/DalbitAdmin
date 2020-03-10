package com.dalbit.administrate.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_FaqInsertVo extends BaseVo {
    private int slctType;
    private String question;
    private String answer;
    private int viewOn;
}

