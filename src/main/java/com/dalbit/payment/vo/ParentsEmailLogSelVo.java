package com.dalbit.payment.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ParentsEmailLogSelVo {
    private String memNo; //  회원번호(신청자)
    private String tDate; //  검색일자
    private String mailSlct; //  메일발송구분[a:동의, p:결제, c:결제취소]

    private int pageNo = 1;
    private int pagePerCnt = 50;
}
