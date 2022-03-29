package com.dalbit.menu.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_PartnerBenefitInputVo {
    private String memNo;               // 회원번호
    private String partnerBenefit;      // 혜택
    private String chrgrName;           // 승인 관리자
}
