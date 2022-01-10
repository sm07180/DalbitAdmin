package com.dalbit.payment.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Pay_CancelPhoneVo {

    /* Pay_CancelVo Input */
    private String mrchid;          // 상점아이디 8자리
    private String tradeid;         // 주문번호
    private String prdtprice;       // 결제금액
    private String mobilid;         // 거래번호
    private String memno;
    private int dalcnt;

    /* 미성년자 법정대리인 메일 발송 */
    private String paycd; // 결제수단(코드)
    private String okdt; // 결제 날짜 yyyy-MM-DD
    private String oktime; // 결제 시간 hh:mm:ss
    private String paycode; // 결제 아이템
    private String itemamt; // 아이템 수량
    private String cardno; // 카드번호 (카드결제)
    private String cardnm; // 은행이름 (카드결제)
    private String paycdName; // 결제수단(이름)
    private String memBirth; // 생년월일
    private String hideCardNo; // 카드번호 * 처리
}
