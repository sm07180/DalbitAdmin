package com.dalbit.content.vo;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CrewUpdateDelStateVo extends BaseVo {

    public CrewUpdateDelStateVo() {}
    public CrewUpdateDelStateVo(String crewIdx, String lastOpName)
    {
        this.crewIdx = Integer.valueOf(crewIdx);
        this.lastOpName = lastOpName;
    }

    private int crewIdx;
    private String crewIdxs;
    private String lastOpName;

}
