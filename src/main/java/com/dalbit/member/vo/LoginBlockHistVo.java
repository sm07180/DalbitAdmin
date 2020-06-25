package com.dalbit.member.vo;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class LoginBlockHistVo {

    public LoginBlockHistVo(){}
    public LoginBlockHistVo(String edit_contents, int edit_type, String op_name, int report_idx){
        this.edit_contents = edit_contents;
        this.edit_type = edit_type;
        this.op_name = op_name;
        this.report_idx = report_idx;
    }

    private int idx;
    private String edit_contents;
    private int edit_type;
    private Date last_upd_date;
    private String op_name;
    private int report_idx;
}
