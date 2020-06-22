package com.dalbit.status.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_LevelOutputVo extends PagingVo {

    // output
    private String level;
    private String exp;
    private String grade;
    private String mem_no;
    private String mem_userid;
    private String mem_nick;
    private String mem_join_date;
    private int dal;
    private int byeol;

    //summary
    private int totalLevelCnt;
    private int level10;
    private int level20;
    private int level30;
    private int level40;
    private int level50;
    private int level50Up;

}
