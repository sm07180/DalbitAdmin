package com.dalbit.member.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class P_MemberFanboardOutputVo extends SearchVo {

    //output
    private String idx;
    private String board_no;
    private String depth;
    private String writer_no;
    private String image_profile;
    private String mem_no;
    private String mem_userid;
    private String mem_nick;
    private Date last_upd_date;
    private String lastUpdDateFormat;
    private String contents;
    private String status;
    private String mem_sex;
    private int replyCnt;   // 팬보드 댓글수

    //summary

    public void setLast_upd_date(Date last_upd_date){
        this.last_upd_date = last_upd_date;
        this.lastUpdDateFormat = DalbitUtil.convertDateFormat(last_upd_date, "yyyy.MM.dd HH.mm.ss");
    }
}
