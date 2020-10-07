package com.dalbit.member.vo;

import com.dalbit.common.vo.SearchVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class MemberNoticeImgDeleteVo extends SearchVo {

    //output
    private String idx;
    private String image_path;
    private Date last_upd_date;
    private String lastUpdDateFormat;

    private String op_name;

    public void setLast_upd_date(Date last_upd_date){
        this.last_upd_date = last_upd_date;
        this.lastUpdDateFormat = DalbitUtil.convertDateFormat(last_upd_date, "yyyy.MM.dd HH:mm:ss");
    }
}
