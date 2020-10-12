package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class P_noticeListOutputVo extends BaseVo {
    private int noticeIdx;
    private int slctType;
    private String platform;
    private int gender;
    private String title;
    private int topFix;
    private int viewOn;
    private int viewCnt;
    private Date offDate;
    private Date writeDate;
    private String writeDateFormat;
    private int iosJudgeViewOn;

    public void setWriteDate(Date writeDate){
        this.writeDate = writeDate;
        this.writeDateFormat = DalbitUtil.convertDateFormat(writeDate, "yyyy.MM.dd HH:mm:ss");
    }
}
