package com.dalbit.payment.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ParentsEmailLogInsVo {
    private String memNo = "";  // 회원번호(신청자)
    private String pMemEmail = ""; // 대리인 이메일 주소
    private String mailSlct = ""; // 메일발송구분[a:동의, p:결제, c:결제취소]
    private String mailEtc; // 메일발송정보
}
