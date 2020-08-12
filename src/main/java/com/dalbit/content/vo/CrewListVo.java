package com.dalbit.content.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CrewListVo extends PagingVo {
    private int crewIdx;
    private String crewName;
    private String crewLeader;
    private int crewCnt;
}
