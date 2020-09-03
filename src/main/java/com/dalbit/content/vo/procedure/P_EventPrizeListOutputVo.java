package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_EventPrizeListOutputVo extends BaseVo {
    private int eventIdx;
    private int prizeIdx;
    private int prizeRank;
    private int prizeCnt;
    private String prizeName;
    private int prizeSlct;
    private int giveAmt;
    private int taxAmt;
    private int dalByeol;
    private int receiveDal;
    private String lastUpdDate;
    private String lastOpName;
}
