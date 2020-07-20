package com.dalbit.member.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class P_MemberMystarOutputVo extends SearchVo {

    //output
    private String mem_no_star;
    private String mem_no_start_id;
    private String mem_no_start_nick;
    private String mem_no_fan;
    private String mem_no_fan_id;
    private String mem_no_fan_nick;
    private String star_sex;
    private String fan_sex;
    private int accumCnt;
    private int totalItemCnt;
    private Date reg_date;
    private String regDateFormat;
    private String mem_birth_year;
    private String mem_birth_month;
    private String mem_birth_day;

    public void setReg_date(Date reg_date){
        this.reg_date = reg_date;
        this.regDateFormat = DalbitUtil.convertDateFormat(reg_date, "yyyy.MM.dd HH:mm:ss");
    }
}
