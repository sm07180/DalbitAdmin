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
    private Date last_upd_date;
    private String lastUpdDateFormat;

    public void setLast_upd_date(Date last_upd_date){
        this.last_upd_date = last_upd_date;
        this.lastUpdDateFormat = DalbitUtil.convertDateFormat(last_upd_date, "yyyy.MM.dd HH.mm.ss");
    }
}
