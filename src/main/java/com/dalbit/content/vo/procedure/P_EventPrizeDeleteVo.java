package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_EventPrizeDeleteVo {

    private int eventIdx;
    private int prizeIdx;
    private String prizeIdxs;
    private String opName;
    public P_EventPrizeDeleteVo() {}
    public P_EventPrizeDeleteVo(String prizeIdx, int eventIdx, String opName) {
        this.prizeIdx = Integer.valueOf(prizeIdx);
        this.eventIdx = eventIdx;
        this.opName = opName;
    }
}
