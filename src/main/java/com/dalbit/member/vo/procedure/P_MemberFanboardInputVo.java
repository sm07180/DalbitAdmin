package com.dalbit.member.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_MemberFanboardInputVo extends SearchVo {
    private int pageNo;
    private String mem_no;
    private String board_no;
    private String depth;
    private String idx;
    private String writer_mem_no;
    private String withdrawal;

}
