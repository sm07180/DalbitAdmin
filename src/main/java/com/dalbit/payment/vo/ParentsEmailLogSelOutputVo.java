package com.dalbit.payment.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ParentsEmailLogSelOutputVo {
    private String auto_no; // 고유번호
    private String mem_no; // 회원번호
    private String parents_mem_email; // 발송메일주소
    private String mail_slct; // 메일발송 구분 [a:동의, p:결제, c:결제취소]
    private String mail_etc; // 메일 발송정보
    private String ins_date; // 메일 발송일자

    private String mail_slct_name; // 메일발송 구분 이름 [a:동의, p:결제, c:결제취소]
}
