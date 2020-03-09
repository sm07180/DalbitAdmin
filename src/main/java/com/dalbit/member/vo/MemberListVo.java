package com.dalbit.member.vo;

import com.dalbit.common.vo.BaseVo;
import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberListVo extends PagingVo {

    /* member/member/list 를 위한 Vo */

    /* input */
    private String search;
    private String date;
    private String gubun;
    private String checkDate;
    private String stDate;
    private String edDate;

    /* output */
    private String memId;
    private String memNo;
    private String memNick;
    private String memName;
    private String memPhone;
    private String memSlct;

}
