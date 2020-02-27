package com.dalbit.customer.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DeclareVo {

    /* input */
    private String search;
    private String searchType;

    /* output */
    private int type;
    private String reason;
    private String memNo;
    private String reportMemNo;
    private String updDate;

}
