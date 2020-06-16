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
    private Date reg_date;
    private String regDateFormat;
    private String op_name;
    private String memo;

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
        this.regDateFormat = DalbitUtil.convertDateFormat(reg_date, "yyyy.MM.dd HH:mm:ss");
    }

}
