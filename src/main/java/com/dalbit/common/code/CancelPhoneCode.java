package com.dalbit.common.code;

import lombok.Getter;

@Getter
public enum CancelPhoneCode {

    /* 휴대폰 취소 응답코드 */
    통신사미등록폰("0011", "통신사 미등록 폰입니다."),
    해지된폰("0014", "해지된 폰입니다."),
    SKT_LGT휴대폰정보변경인한취소실패("0020", "SKT,LGT 휴대폰 정보변경으로 인한 취소 실패입니다."),
    거래내역없음("0041","거래내역이 없습니다."),
    취소기간경과("0042", "취소기간이 경과되었습니다."),
    이미취소된자료("0044", "이미 취소된 자료입니다."),
    취소자료정보불일치("0045", "취소자료 정보가 일치하지 않습니다."),
    요청자료오류("0097", "요청자료 오류입니다."),
    통신사통신오류("0098", "통산사 통신오류입니다."),
    기타("0099", "기타"),
    통신오류("101", "통신오류 모빌리언스 문의")

    ;

    final private String code;
    final private String desc;

    CancelPhoneCode(String code, String desc){
        this.code = code;
        this.desc = desc;
    }
}
