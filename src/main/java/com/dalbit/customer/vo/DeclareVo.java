package com.dalbit.customer.vo;

import com.dalbit.member.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DeclareVo extends PagingVo {

    /* input */
    private String search;
    private String searchType;

    /* output */
    private int type;
    private String reason;
    private String memNo;
    private String reportMemNo;
    private String updDate;
    private String stateDate;
    private String state;
    private String stateUser;

}
