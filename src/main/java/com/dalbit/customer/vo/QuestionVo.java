package com.dalbit.customer.vo;

import com.dalbit.member.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class QuestionVo extends PagingVo {

    /* input */
    private String search;
    private String questionType;
    private String platformType;
    private String browserType;

    /* 임시 output */
    private String memNo;
    private String memBirth;
    private String memId;
    private String memJoin;
    private String memState;
    private String memPhone;

}
