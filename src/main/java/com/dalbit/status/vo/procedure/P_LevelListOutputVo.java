package com.dalbit.status.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_LevelListOutputVo extends PagingVo {

    // output
    private String level;
    private String grade;
    private String memCount;
    private String pro;
    private String memAllCount;
    private String levelExp;
    private String nextlevelExp;
    private String expRange;

}
