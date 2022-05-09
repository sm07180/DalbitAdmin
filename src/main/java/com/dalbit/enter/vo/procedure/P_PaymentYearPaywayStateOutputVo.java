package com.dalbit.enter.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_PaymentYearPaywayStateOutputVo {
    private String the_date;            // 일자
    private int total_cnt;              // 총건
    private int total_cmt;              // 총수량
    private int total_amt;              // 총금액
    private int mc_cnt;                 // 휴대폰결제건
    private int mc_cmt;                 // 휴대폰결제수량
    private int mc_amt;                 // 휴대폰결제금액
    private int cn_cnt;                 // 신용카드결제건
    private int cn_cmt;                 // 신용카드결제수량
    private int cn_amt;                 // 신용카드결제금액
    private int inapp_cnt;              // apple결제건
    private int inapp_cmt;                // apple결제수량
    private int inapp_amt;                // apple결제금액
    private int ra_cnt;                 // 계좌이체결제건
    private int ra_cmt;                 // 계좌이체결제수량
    private int ra_amt;                 // 계좌이체결제금액
    private int va_cnt;                 // 가상계좌결제건
    private int va_cmt;                 // 가상계좌결제수량
    private int va_amt;                 // 가상계대결제금액
    private int tmoney_cnt;             // 티머니결제건
    private int tmoney_cmt;             // 티머니결제수량
    private int tmoney_amt;             // 티머니결제금액
    private int cashbee_cnt;            // 캐시비결제건
    private int cashbee_cmt;            // 캐시비결제수량
    private int cashbee_amt;            // 캐시비결제금액
    private int kakaopay_cnt;           // 카카오페이결제건
    private int kakaopay_cmt;           // 카카오페이결제수량
    private int kakaopay_amt;           // 카카오페이결제금액
    private int payco_cnt;              // 페이코결제건
    private int payco_cmt;              // 페이코결제수량
    private int payco_amt;              // 페이코결제금액
    private int toss_cnt;               // 토스결제건
    private int toss_cmt;               // 토스결제수량
    private int toss_amt;               // 토스결제금액
    private int gm_cnt;                 // 문화상품권결제건
    private int gm_cmt;                 // 문화상품권결제수량
    private int gm_amt;                 // 문화상품권결제금액
    private int gg_cnt;                 // 게임문화상품권결제건
    private int gg_cmt;                 // 게임문화상품권결제수량
    private int gg_amt;                 // 게임문화상품권결제금액
    private int gc_cnt;                 // 도서문화상품권결제건
    private int gc_cmt;                 // 도서문화상품권결제수량
    private int gc_amt;                 // 도서문화상품권결제금액
    private int hm_cnt;                 // 해피머니상품권결제건
    private int hm_cmt;                 // 해피머니상품권결제수량
    private int hm_amt;                 // 해피머니상품권결제금액
    private int kakaomoney_cnt;         // 카카오페이결제건
    private int kakaomoney_cmt;         // 카카오페이결제수량
    private int kakaomoney_amt;         // 카카오페이결제금액
    private int simple_cnt;             // 간편결제건
    private int simple_cmt;             // 간편결제수량
    private int simple_amt;             // 간편결제금액
    private int inapp_aos_cnt;          // AOS인앱결제건
    private int inapp_aos_cmt;          // AOS인앱결제수량
    private int inapp_aos_amt;          // AOS인앱결제금액
    private int inapp_onestore_cnt;     // 원스토어 결제건
    private int inapp_onestore_cmt;     // 원스토어 간편결제수량
    private int inapp_onestore_amt;     // 원스토어 간편결제금액
}
