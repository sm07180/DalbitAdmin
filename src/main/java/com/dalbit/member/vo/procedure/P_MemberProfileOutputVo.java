package com.dalbit.member.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_MemberProfileOutputVo extends SearchVo {
    private String mem_no;
    private String sDate;
    private String eDate;

    private String last_upd_date;
    private String image_profile;
    private String msg_profile;
    private String mem_nick;
    private String mem_userid;
    private String mem_sex;
    private String mem_join_date;
    private String mem_phone;

    private int maleCnt;
    private int femaleCnt;
    private int noneCnt;
}
