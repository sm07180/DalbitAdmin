package com.dalbit.member.vo;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberListVo extends BaseVo {

    private String memNo;
    private String memNick;
    private String memId;
    private String memPhone;
    private String memSlct;
    private String memState;

}
