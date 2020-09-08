package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_EventWinnerUpdateVo{
    private int eventIdx;
    private String winnerIdxs;
    private String winnerIdx;
    private int updateSlct;
    private String opName;

    public P_EventWinnerUpdateVo(int eventIdx, int updateSlct, String winnerIdx, String opName) {
        this.eventIdx = eventIdx;
        this.updateSlct = updateSlct;
        this.winnerIdx = winnerIdx;
        this.opName = opName;
    }
}
