package com.dalbit.menu.vo;

import com.dalbit.member.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class RecommendVo extends PagingVo {
    private String mem_no;
    private String mem_id;
    private String mem_nick;
    private String image_profile;
    private String level;
    private String grade;
    private String gold;
    private int broad_cnt;
    private int item_cnt;
    private double receive_average_cnt;
    private Date first_broad_date;
    private Date last_broad_date;
}
