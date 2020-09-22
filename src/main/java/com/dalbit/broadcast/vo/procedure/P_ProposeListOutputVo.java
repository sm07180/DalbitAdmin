package com.dalbit.broadcast.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_ProposeListOutputVo extends PagingVo {

    /* return result */
    private String room_no;
    private String mem_no;
    private String mem_nick;
    private String mem_sex;
    private String mem_birth_year;
    private String level;
    private String grade;
    private int state;
    private String lastUpdDate;


    /* summary */
    private int pageNo;
    private int proCancelCnt;
    private int proCnt;
    private int inviteCnt;
    private int inviteCencleCnt;
    private int inviteOk;
    private int inviteNo;

}


