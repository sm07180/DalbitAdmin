package com.dalbit.member.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class P_MemberNoticeOutputVo extends SearchVo {

    //output
    private String idx;
    private String room_no;
    private String type;
    private String contents;
    private String image_path;
    private Date last_upd_date;
    private String lastUpdDateFormat;

    private String mem_no;
    private String mem_nick;
    private String mem_sex;
    private String mem_birth_year;
    private String title;
    private String status;
    private String op_name;
    private int inner;
    private int editCnt;

    private int maleCnt;      // 총합 남자
    private int femaleCnt;    // 총합 여자
    private int noneCnt;      // 총합 알수없음

    // 2020.11.10 댓글 수 추가 (강다인)
    private int replyCnt;

    public void setLast_upd_date(Date last_upd_date){
        this.last_upd_date = last_upd_date;
        this.lastUpdDateFormat = DalbitUtil.convertDateFormat(last_upd_date, "yyyy.MM.dd HH:mm:ss");
    }
}
