package com.dalbit.administrate.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class P_FaqListOutputVo extends BaseVo {

    private int faqIdx;
    private int slctType;
    private String question;
    private int viewOn;
    private int viewCnt;
    private Date writeDate;
    private String writeDateFormat;
    private Date lastUpdateDate;
    private String lastUpdateDateFormat;

    public void setWriteDate(Date writeDate){
        this.writeDate = writeDate;
        this.writeDateFormat = DalbitUtil.convertDateFormat(writeDate, "yyyy-MM-dd HH.mm.ss");
    }

    public void setLastUpdateDate(Date lastUpdateDate) {
        this.lastUpdateDate = lastUpdateDate;
        this.lastUpdateDateFormat = DalbitUtil.convertDateFormat(lastUpdateDate, "yyyy-MM-dd HH.mm.ss");
    }
}
