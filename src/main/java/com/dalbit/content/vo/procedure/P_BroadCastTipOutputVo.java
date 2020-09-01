package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_BroadCastTipOutputVo extends BaseVo {
    private int idx;
    private int viewTarget;
    private String tipDesc;
    private int viewOn;
    private Date updateDate;
}
