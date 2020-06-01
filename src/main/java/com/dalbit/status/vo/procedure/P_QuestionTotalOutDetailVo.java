package com.dalbit.status.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_QuestionTotalOutDetailVo extends SearchVo {

    private String date;
    private String hour;
    private String daily;
    private String monthly;
    private int regCnt;
    private int opCnt;
    private int nopCnt;
}



