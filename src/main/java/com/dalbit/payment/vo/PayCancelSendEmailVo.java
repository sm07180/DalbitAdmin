package com.dalbit.payment.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PayCancelSendEmailVo {
    public PayCancelSendEmailVo () {}
    public PayCancelSendEmailVo(String memNo, String paycd, String okdt, String oktime, String paycode, String itemamt,
                                String cardno, String cardnm, String memBirth, String itemPrice, String hideCardNo) {
        this.memNo = memNo;
        this.paycd = paycd;
        this.okdt = okdt;
        this.oktime = oktime;
        this.paycode = paycode;
        this.itemamt = itemamt;
        this.cardno = cardno;
        this.cardnm = cardnm;
        this.paycdName = getCardName(paycd);
        this.memBirth = memBirth;
        this.itemPrice = itemPrice;
        this.hideCardNo = hideCardNo;
    }

    private String getCardName(String cardnm) {
        switch (cardnm) {
            case "simple": return "간편결제(계좌)";
//            case "VA": return "가상계좌";
            case "CN": return "신용카드";
            case "MC": return "휴대폰";
            case "kakaoMoney": return "카카오페이(머니)";
            case "kakaopay": return "카카오페이(카드)";
            case "payco": return "페이코";
            case "GM": return "문화상품권";
            case "tmoney": return "티머니";
            case "cashbee": return "캐시비";
            case "HM": return "해피머니상품권";
//            case "InApp": return "인앱(IOS)";

            case "GG": return "게임문화상품권"; // 결제 수단이 없음
            case "GC": return "도서문화상품권"; // 결제 수단이 없음
            default: return "";
        }
    }

    /* 미성년자 법정대리인 메일 발송 */
    private String memNo = "";
    private String paycd = ""; // 결제수단(코드)
    private String okdt = ""; // 결제 날짜 yyyy-MM-DD
    private String oktime = ""; // 결제 시간 hh:mm:ss
    private String paycode = ""; // 결제 아이템
    private String itemamt = ""; // 아이템 수량
    private String cardno = ""; // 카드번호 (카드결제)
    private String cardnm = ""; // 은행이름 (카드결제)
    private String paycdName = ""; // 결제수단(이름)
    private String memBirth = ""; // 생년월일
    private String itemPrice = ""; // 구매 아이템 가격
    private String hideCardNo; // 카드번호 * 처리
}
