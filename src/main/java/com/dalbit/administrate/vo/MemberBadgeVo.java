package com.dalbit.administrate.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@Getter
@Setter
@ToString
public class MemberBadgeVo {

    private String mem_no;
    private int slct_type;
    private int badge_value;
    private Date start_date;
    private Date end_date;
}
