package com.dalbit.administrate.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_FaqListDetailOutputVo extends BaseVo {
    private int faqIdx;
    private int slctType;
    private String question;
    private String answer;
    private int viewOn;
    private int viewCnt;
    private String writeDate;
//    private String writeDateFormat;

//    public void setWriteDate(java.sql.Date writeDate){
//        this.writeDate = writeDate;
//        this.writeDateFormat = DalbitUtil.convertDateFormat(writeDate, "yyyy-MM-dd HH.mm.ss");
//    }
}
