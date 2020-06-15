package com.dalbit.customer.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class P_QuestionAdminMemoListOutputVo extends BaseVo {

    private int qnaIdx;
    private String reg_date;
    private String op_name;
    private String memo;

}
