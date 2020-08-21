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
    private String board_idx;
    private String board_no;
    private String depth;
    private String writer_mem_no;
    private String profileImage;
    private String userId;
    private String nickName;
    private Date writeDate;
    private String writeDateFormat;
    private String contents;
    private String STATUS;
    private String memSex;
    private int replyCnt;   // 팬보드 댓글수
    private String mem_birth_year;
    private String mem_birth_month;
    private String mem_birth_day;
    private String view_yn;

    //summary

    public void setWriteDate(Date writeDate){
        this.writeDate = writeDate;
        this.writeDateFormat = DalbitUtil.convertDateFormat(writeDate, "yyyy.MM.dd HH:mm:ss");
    }
}
