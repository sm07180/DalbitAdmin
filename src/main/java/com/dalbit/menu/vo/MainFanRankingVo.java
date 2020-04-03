package com.dalbit.menu.vo;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

@Getter @Setter
public class MainFanRankingVo {

    @NotNull
    @Min(1) @Max(3)
    private Integer rankType;
    @Min(1)
    private Integer page;
    @Min(1)
    private Integer records;


}
