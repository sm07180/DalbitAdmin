package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_DjFanPrizeFanListInputVo {
    private String memNo;
    private int evtNo;
    private int couponUseCnt;
    private int pageNo = 1;
    private int pagePerCnt = 50;
}
