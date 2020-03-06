package com.dalbit.customer.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DeclareVo extends PagingVo {

    /* input */
    private String search;
    private String searchType;
    private String stopType;

    /* output */
/*    private int type;
    private String reason;
    private String memNo;
    private String reportedMemNo;
    private String lastUpdDate;
    private String stateDate;
    private String state;
    private String stateUser;
    private String memId;
    private String memNick;
    private String memPhone;*/

    /* 임시 output*/
    private String memNo;
    private String memBirth;
    private String memId;
    private String memJoin;
    private String memState;
    private String memPhone;

}
