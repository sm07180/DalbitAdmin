package com.dalbit.enter.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_PaymentDayPaysexOutputVo {
    private int male_cnt;           // 남성결제건
    private int male_cmt;           // 남성결제수량
    private int male_amt;           // 남성결제금액
    private int female_cnt;         // 여성결제건
    private int female_cmt;         // 여성결제수량
    private int female_amt;         // 여성결제금액
    private int none_cnt;           // None결제건
    private int none_cmt;           // None결제수량
    private int none_amt;           // None결제금액
    private int age00_cnt;         // 10대미만결제건
    private int age00_cmt;         // 10대미만결제수량
    private int age00_amt;         // 10대미만결제금액
    private int age10_cnt;         // 10대결제건
    private int age10_cmt;         // 10대결제수량
    private int age10_amt;         // 10대결제금액
    private int age20_cnt;         // 20대결제건
    private int age20_cmt;         // 20대결제수량
    private int age20_amt;         // 20대결제금액
    private int age30_cnt;         // 30대결제건
    private int age30_cmt;         // 30대결제수량
    private int age30_amt;         // 30대결제금액
    private int age40_cnt;         // 40대결제건
    private int age40_cmt;         // 40대결제수량
    private int age40_amt;         // 40대결제금액
    private int age50_cnt;         // 50대결제건
    private int age50_cmt;         // 50대결제수량
    private int age50_amt;         // 50대결제금액
    private int age60_cnt;         // 60대결제건
    private int age60_cmt;         // 60대결제수량
    private int age60_amt;         // 60대결제금액
}
