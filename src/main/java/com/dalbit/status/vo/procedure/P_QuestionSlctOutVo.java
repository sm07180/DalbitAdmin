package com.dalbit.status.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_QuestionSlctOutVo extends SearchVo {

    private int sum_totalCnt;
    private int sum_type01Cnt;
    private int sum_type02Cnt;
    private int sum_type03Cnt;
    private int sum_type04Cnt;
    private int sum_type05Cnt;
    private int sum_type06Cnt;
    private int sum_type07Cnt;
    private int sum_type99Cnt;

}