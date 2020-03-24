package com.dalbit.broadcast.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class P_BroadcastEditHistOutputVo extends BaseVo {
    private Date editDate;
    private String editContents;
}
