package com.dalbit.enter.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_PaymentSearchInputVo {
    private String tDate;           // 0000-00-00
    private String memNo;           // 회원번호 , 0 없음
    private int payInner;           // 2:전체 ,0:회원, 1:직원
    private String payWaySlct;      // "" : 전체, MC : 휴대폰, CN : 신용카드, InApp : 인앱(IOS), VA:가상계좌, GM : 문화상품권, HM : 해피머니상품권, tmoney : 티머니, cashbee : 캐시비, payco : 페이코, kakaopay : 카카오페이(카드), kakaoMoney : 카카오페이(머니), simple : 간편결제(계좌), InAppAos : 안드인앱, InAppOneStore : 원스토어인앱
    private int payOs;              // 0:전체, 1:AOS, 2:IOS, 3:WEB
}
