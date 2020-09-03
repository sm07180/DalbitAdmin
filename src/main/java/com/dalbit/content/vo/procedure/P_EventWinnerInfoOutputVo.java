package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_EventWinnerInfoOutputVo extends BaseVo {
    private int prizeIdx;
    private String prizeName;
    private int prizeRank;
    private String prizeCnt;
    private String winCnt;
}
