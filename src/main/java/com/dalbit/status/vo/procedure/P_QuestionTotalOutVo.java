package com.dalbit.status.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_QuestionTotalOutVo extends SearchVo {

    private int sum_regCnt;
    private int sum_opCnt;
    private int sum_nopCnt;
    private int sum_no_regCnt;
    private int sum_no_opCnt;
    private int sum_no_nopCnt;

}