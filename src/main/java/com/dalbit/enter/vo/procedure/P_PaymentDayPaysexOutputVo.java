package com.dalbit.enter.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_PaymentDayPaysexOutputVo {
    private String the_date;        // 일자
    private int total_cnt;          // 총건
    private int total_cmt;          // 총수량
    private int total_amt;          // 총금액
    private int male_cnt;           // 남성결제건
    private int male_cmt;           // 남성결제수량
    private int male_amt;           // 남성결제금액
    private int female_cnt;         // 여성결제건
    private int female_cmt;         // 여성결제수량
    private int female_amt;         // 여성결제금액
    private int none_cnt;           // None결제건
    private int none_cmt;           // None결제수량
    private int none_amt;           // None결제금액
    private int age_00_cnt;         // 10대미만결제건
    private int age_00_cmt;         // 10대미만결제수량
    private int age_00_amt;         // 10대미만결제금액
    private int age_10_cnt;         // 10대결제건
    private int age_10_cmt;         // 10대결제수량
    private int age_10_amt;         // 10대결제금액
    private int age_20_cnt;         // 20대결제건
    private int age_20_cmt;         // 20대결제수량
    private int age_20_amt;         // 20대결제금액
    private int age_30_cnt;         // 30대결제건
    private int age_30_cmt;         // 30대결제수량
    private int age_30_amt;         // 30대결제금액
    private int age_40_cnt;         // 40대결제건
    private int age_40_cmt;         // 40대결제수량
    private int age_40_amt;         // 40대결제금액
    private int age_50_cnt;         // 50대결제건
    private int age_50_cmt;         // 50대결제수량
    private int age_50_amt;         // 50대결제금액
    private int age_60_cnt;         // 60대결제건
    private int age_60_cmt;         // 60대결제수량
    private int age_60_amt;         // 60대결제금액
}
