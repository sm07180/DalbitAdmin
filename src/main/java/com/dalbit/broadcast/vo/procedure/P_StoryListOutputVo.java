package com.dalbit.broadcast.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_StoryListOutputVo extends PagingVo {

    /* return result */
    private int storyIdx;
    private String mem_no;
    private String userId;
    private String nickName;
    private String mem_sex;
    private String mem_birth_year;
    private String mem_birth_month;
    private String mem_birth_day;
    private int level;
    private String grade;
    private Date writeDate;
    private String writeDateFormat;
    private String contents;
    private int inner;
    
    /* summry */
    private int storyCnt;
    private int male;
    private int female;
    private int none;
    
    public void setWriteDate(Date writeDate){
        this.writeDate = writeDate;
        this.writeDateFormat = DalbitUtil.convertDateFormat(writeDate, "yyyy.MM.dd HH:mm:ss");
    }
}


