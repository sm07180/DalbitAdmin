package com.dalbit.member.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_MemberBlackListOutputVo extends SearchVo {

    private String mem_no;
    private String mem_userid;
    private String mem_nick;
    private String regDate;

}
