package com.dalbit.content.vo;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CrewMemberDeleteVo extends BaseVo {

    private int crewMemberIdx;
    private String crewMemberIdxs;
    private String lastOpName;
    public CrewMemberDeleteVo() {}
    public CrewMemberDeleteVo(String crewMemberIdx) {this.crewMemberIdx = Integer.valueOf(crewMemberIdx);}
}
