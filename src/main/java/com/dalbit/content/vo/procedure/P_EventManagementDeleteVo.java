package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_EventManagementDeleteVo {

    private String eventIdx;
    private String eventIdxs;
    private String opName;
    public P_EventManagementDeleteVo(){}
    public P_EventManagementDeleteVo(String eventIdx, String opName)
    {
        this.eventIdx = eventIdx;
        this.opName = opName;
    }
}
