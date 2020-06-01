package com.dalbit.status.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_QuestionPlatformOutVo extends SearchVo {

    private int sum_totalCnt;
    private int sum_androidCnt;
    private int sum_iosCnt;
    private int sum_pcCnt;

}