package com.dalbit.customer.vo.procedure;

import lombok.Data;

import java.util.Date;

@Data
public class P_AgeLimitListOutputVo {
    private String mem_no;
    private String mem_id;
    private String mem_nick;
    private String mem_join_date;
    private String cert_yn;
    private Date stopDate;
}
