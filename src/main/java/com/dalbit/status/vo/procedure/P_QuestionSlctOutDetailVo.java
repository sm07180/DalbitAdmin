package com.dalbit.status.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_QuestionSlctOutDetailVo extends SearchVo {

    private String date;
    private String hour;
    private String daily;
    private String monthly;
    private int type01Cnt;
    private int type02Cnt;
    private int type03Cnt;
    private int type04Cnt;
    private int type05Cnt;
    private int type06Cnt;
    private int type07Cnt;
    private int type99Cnt;
    private int no_type01Cnt;
    private int no_type02Cnt;
    private int no_type03Cnt;
    private int no_type04Cnt;
    private int no_type05Cnt;
    private int no_type06Cnt;
    private int no_type07Cnt;
    private int no_type99Cnt;
}



