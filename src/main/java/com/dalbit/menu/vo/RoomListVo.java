package com.dalbit.menu.vo;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

@Getter @Setter
public class RoomListVo {

    @Size(max = 2)
    private String subjectType;

    @Min(1)
    private Integer page;
    @Min(1)
    private Integer records;

    private Integer slctType;

}
