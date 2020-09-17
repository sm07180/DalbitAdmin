package com.dalbit.money.vo.procedure;

import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@Getter
@Setter
@ToString
public class P_LiveResourceDataOutVo {

    private long total_Dal;
    private long havecount_Dal;
    private long total_Byeol;
    private long havecount_Byeol;

}
