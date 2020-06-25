package com.dalbit.member.vo;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class LoginBlockVo {

    public LoginBlockVo(){}
    public LoginBlockVo(int block_type, String block_text, int block_day, String op_name, int report_idx){
        this.block_type = block_type;
        this.block_text = block_text;
        this.block_day = block_day;
        this.op_name = op_name;
        this.report_idx = report_idx;
    }

    private int idx;
    private int block_type;
    private String block_text;
    private int block_day;
    private Date block_end_date;
    private Date last_upd_date;
    private String op_name;
    private int report_idx;
}
