package com.dalbit.status.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_LevelInputVo extends SearchVo {

    private int pageNo;
    private String sDate;
    private String eDate;
    private String level;

}
