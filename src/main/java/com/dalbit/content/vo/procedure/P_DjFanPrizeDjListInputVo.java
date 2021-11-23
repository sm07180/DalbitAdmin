package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_DjFanPrizeDjListInputVo {
    private String memNo;
    private int rcvDalSlct;
    private int pageNo = 1;
    private int pagePerCnt = 50;
}
