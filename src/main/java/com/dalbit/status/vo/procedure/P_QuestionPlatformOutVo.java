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
    private int sum_no_androidCnt;
    private int sum_no_iosCnt;
    private int sum_no_pcCnt;

}