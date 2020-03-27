package com.dalbit.broadcast.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_ChatTargetListOutputVo extends PagingVo {

    /* return result */
    private Date writeDate;
    private String writeDateFormat;
    private String mem_no;
    private String auth;
    private String nickname;
    private String msg;

    public void setWriteDate(Date writeDate){
        this.writeDate = writeDate;
        this.writeDateFormat = DalbitUtil.convertDateFormat(writeDate, "yyyy.MM.dd HH.mm.ss");
    }
}


