package com.dalbit.menu.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RecommendVo extends PagingVo {
    private String mem_no;
    private String mem_id;
    private String mem_nick;
    private String mem_birth_year;
    private String mem_birth_month;
    private String mem_birth_day;
    private String mem_sex;
    private int inner;
    private String image_profile;
    private String level;
    private String grade;
    private String gold;
    private int broad_cnt;
    private int item_cnt;
    private double receive_average_cnt;
    private long first_broad_date;
    private long last_broad_date;
}
