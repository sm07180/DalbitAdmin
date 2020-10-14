package com.dalbit.money.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_ResourceDetailByeolOutVo {

    // 하단 통계
    private String the_date;
    private String the_hr;
    private long byeolgift_Cnt;
    private long levelup_Cnt;
    private long eventauto_Cnt;
    private long eventdirect_Cnt;
    private long cancel_Cnt;
    private long recovery_Cnt;
    private long testin_Cnt;
    private long exchange_Cnt;
    private long change_Cnt;
    private long block_Cnt;
    private long withdrawal_Cnt;
    private long testout_Cnt;
    private long increaseCnt;
    private long decreaseCnt;
}
