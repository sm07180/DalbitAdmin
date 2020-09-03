package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_EventPrizeDetailOutputVo extends BaseVo {
    private int eventIdx;
    private int prizeRank;
    private int prizeCnt;
    private String prizeName;
    private int prizeSlct;
    private String prizeUrl;
    private Integer giveCnt;
    private Integer giveAmt;
    private Integer taxAmt;
    private Integer dalByeol;
    private Integer receiveDal;
}
