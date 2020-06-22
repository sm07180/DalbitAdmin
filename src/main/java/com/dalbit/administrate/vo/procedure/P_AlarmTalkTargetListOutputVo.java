package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_AlarmTalkTargetListOutputVo extends BaseVo {
    private String emp_no;
    private String mem_phone;
    private String type;
    private String op_name;
    private String reg_date;
}

