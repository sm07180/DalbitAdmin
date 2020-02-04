package com.dalbit.common.code;

import lombok.Getter;

@Getter
public enum Status {

    //로그인
    로그인성공("0", "login.success", "로그인 성공 시"),
    로그인실패_회원가입필요("1", "login.join.need", "회원가입 필요 시"),
    로그인실패_패스워드틀림("-1", "login.fail", "로그인 실패 시 - 아이디/비밀번호가 틀릴 시"),
    로그인실패_파라메터이상("-2", "login.param.error", "로그인 실패 시 - 파라메터이상"),

    //CRUD
    조회("1001", "read.success", "조회"),

    //엑셀 다운로드
    엑셀다운로드성공("1", "excel.download.success", "엑셀 다운로드 성공 시"),
    엑셀다운로드실패("0", "excel.download.fail", "엑셀 다운로드 실패 시"),

    //회원정보보기 (프로필, 마이페이지 통합)
    회원정보보기_성공("0", "member.info.view.success", "회원 팬 등록 성공 시"),
    회원정보보기_회원아님("-1", "member.no", "회원이 아닐 시"),
    회원정보보기_대상아님("-2", "member.this.no", "회원 팬 등록 실패 시 "),
    회원정보보기_실패("C006", "member.info.view.fail", "회원정보보기 실패 시"),
    ;

    final private String SUCCESS_RESULT = "success";

    final private String result;
    final private String messageCode;
    final private String messageKey;
    final private String desc;

    Status(String messageCode, String messageKey, String desc){
        this.result = SUCCESS_RESULT;
        this.messageCode = messageCode;
        this.messageKey = messageKey;
        this.desc = desc;
    }
}
