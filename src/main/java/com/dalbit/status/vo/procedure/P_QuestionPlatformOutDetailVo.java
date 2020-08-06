package com.dalbit.status.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_QuestionPlatformOutDetailVo extends SearchVo {

    private String date;
    private String hour;
    private String daily;
    private String monthly;
    private int pcCnt;
    private int androidCnt;
    private int iosCnt;
    private int no_pcCnt;
    private int no_androidCnt;
    private int no_iosCnt;
}



