package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class P_noticeListOutputVo extends BaseVo {
    private int noticeIdx;
    private int slctType;
    private String title;
    private int topFix;
    private int viewOn;
    private String writerName;
    private int writerNo;
    private Date writeDate;
}
