package com.dalbit.member.vo;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberListVo extends BaseVo {

    /* member/member/list 를 위한 Vo */

    private String memId;
    private String memNo;
    private String memNick;
    private String memName;
    private String memPhone;
    private String memSlct;

    private String search;
    private String date;
    private String gubun;
    private String stDate;
    private String edDate;

}
