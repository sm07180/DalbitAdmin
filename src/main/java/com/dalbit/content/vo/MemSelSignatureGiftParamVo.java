package com.dalbit.content.vo;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotNull;

@Getter
@Setter
public class MemSelSignatureGiftParamVo {
    @NotNull
    private Long memNo;
    @NotNull
    private Integer pageNo;
    @NotNull
    private Integer pagePerCnt;

}
