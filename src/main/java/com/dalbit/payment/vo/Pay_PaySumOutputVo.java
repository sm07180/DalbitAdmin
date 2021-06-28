package com.dalbit.payment.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Pay_PaySumOutputVo extends PagingVo {

    /* Pay_PayVo output */
    private int totalSuccCnt;       // 총 성공수
    private double totalSuccAmt;       // 총 성공 금액
    private int totalTryCnt;        // 총 시도수
    private int totalSuccRate;      // 총 시도 금액
    private int totalFirstCnt;      // 총 첫 결제 수
    private int totalFirstAmt;      // 총 첫 결제 금액
    private int totalReCnt;         // 총 재 결제 수
    private int totalReAmt;         // 총 재 결제 금액
    private int totalCancCnt;       // 총 취소 수
    private int totalCancAmt;       // 총 취소 금액
}
