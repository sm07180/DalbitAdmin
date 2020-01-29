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
    조회("1001", "read.success", "조회");

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
