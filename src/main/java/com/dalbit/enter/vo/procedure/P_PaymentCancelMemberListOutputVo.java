package com.dalbit.enter.vo.procedure;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
public class P_PaymentCancelMemberListOutputVo {
    private String order_id;            // 주문번호
    private String mem_no;		        // 회원번호
    private String pay_way;		        // 결제수단(코드표참고)
    private Date pay_dt_comein;	        // 결제시도일
    private String pay_yn;		        // 결제완료여부
    private String pay_ok_date;	        // 결제완료일자
    private String pay_ok_time;	        // 결제완료시간
    private String pay_slct;		    // 결제구분[국제원화코드][krw, usd 등]
    private int pay_amt;		        // 결제금액_부가세포함
    private int item_amt;		        // 아이템수량
    private String pay_code;		    // 결제아이템정보
    private String app_ver;		        // 어플버젼
    private String first_pay_yn;	    // 최초결제여부
    private String card_no;		        // 카드번호  ex) "12341234****1234"
    private String card_nm;		        // 카드사 명 ex) 국민카드
    private String phone_no;	        // 휴대폰 번호
    private String bank_code;	        // 은행코드  ex) 003 : 기업은행, 004 : 국민은행, 020 : 우리은행, 026 : 신한은행
    private String account_no;	        // 가상계좌번호
    private String rcpt_dt;		        // 결제완료일자(가상계좌이체) ex) 20140101001628
    private String rcpt_nm;		        // 결제자명(가상계좌 계좌이체자명)
    private String store_id;		    // 상점아이디
    private String cancel_dt;		    // 결제취소일자
    private String cancel_state;	    // 취소처리상태
    private String fail_msg;		    // 취소실패사유
    private String op_name;		        // 처리자명
    private String bill_id;		        // 거래번호(모빌리언스거래번호, InApp결제 트랜잭션id)
    private int os;		                // 기기정보
    private int dal_cnt;		        // 달 구매수량
    private String pay_info;		    // 추가기록정보
    private String pay_info_no;	        // 결제수단(코드표참고) 또는 bill_id
    private String pay_info_nm;	        // 결제수단(코드표참고) 또는 bank_code
    private int tot_pay_cnt;	        // 결제수
    private int tot_pay_amt;	        // 결제금액
    private int tot_dal_cnt;	        // 보유달수
    private String mem_nick;	        // 회원 닉네임
    private String mem_userid;	        // 회원 유저아이디
    private String mem_id;		        // 회원 아이디
    private String mem_phone;	        // 회원 전화번호
    private String mem_sex;		        // 회원 성별
    private String mem_birth_year;	    // 생일 년도
    private String mem_birth_month;	    // 생일 월
    private String mem_birth_day;	    // 생일 일
    private int inner;		            // 내부직원여부(0:일반,1:내부)
}
