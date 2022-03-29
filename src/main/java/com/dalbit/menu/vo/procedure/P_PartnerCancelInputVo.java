package com.dalbit.menu.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_PartnerCancelInputVo {
    private String memNo;               // 회원번호
    private String cancelDetail;        // 취소 사유
    private String chrgrName;           // 승인 관리자
}
