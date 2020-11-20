package com.dalbit.money.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_memberBoostHistListOutputVo extends PagingVo {
    private String mem_no;
    private String mem_userid;
    private String mem_id;
    private String mem_nick;
    private String mem_sex;
    private int mem_birth_year;
    private String mem_phone;
    private int mem_age;
    private int state;
    private int use_cnt;
    private int item_cnt;
    private String last_upd_date;
    private String op_name;
}