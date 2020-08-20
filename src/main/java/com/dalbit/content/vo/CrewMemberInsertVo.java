package com.dalbit.content.vo;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CrewMemberInsertVo extends BaseVo {
    private int leader_yn;
    private int searchType;
    private int crewIdx;
    private String memInfo;
    private String memNo;
    private int idx;
    private String lastOpName;
}
