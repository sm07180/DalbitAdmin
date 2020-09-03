package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_EventWinnerApplicantOutputVo extends BaseVo {
    private int applyIdx;
    private String mem_no;
    private String nickName;
    private int applyCnt;
    private int payAmt;
    private String airTime;
    private int goodCnt;
    private int expCnt;
    private int giftedCnt;
    private int giftCnt;
    private int fanCnt;
    private int prizeWin;
    private int prizeRank;
    private int add_idx;
    private String applyDate;
}