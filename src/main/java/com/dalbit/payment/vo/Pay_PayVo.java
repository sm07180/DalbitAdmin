package com.dalbit.payment.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Pay_PayVo extends PagingVo {

    /* Pay_PayVo output */
    private String order_id;        // 주문번호
    private String mem_no;          // 회원번호
    private String pay_way;         // 결제수단
    private String pay_dt_comein;   // 결제시도일
    private String pay_yn;          // 결제완료여부
    private String pay_ok_date;     // 결제완료일자
    private String pay_ok_time;     // 결제완료시간
    private String pay_slct;        // 결제구분
    private String pay_amt;         // 결제금액
    private String pay_code;        // 결제아이템정보
    private int count;              // 구매 횟수
    private int amount;             // 총 구매 금액
    private String chrgr_yn;        // 직원여부
    private String app_ver;         // 어플버전
    private String first_pay_yn;    // 최초결제여부
    private String card_no;         // 카드번호
    private String card_nm;         // 카드사명
    private String phone_no;        // 휴대폰번호
    private String bank_code;       // 은행코드
    private String account_no;      // 가상계좌번호
    private String rcpt_dt;         // 결제완료일자
    private String rcpt_nm;         // 결제자명
    private String cancel_state;
    private String cancel_dt;
    private String bill_id;
    private String fail_msg;
    private String op_name;
    private String store_id;
    private int os;
    private int dal_cnt;
    private String pay_info_no;
    private String pay_info_nm;

}
