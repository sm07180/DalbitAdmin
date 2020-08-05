package com.dalbit.customer.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_QuestionOperateVo extends SearchVo {
    private int pageNo;
    private int qnaIdx;
    private String answer;
    private String memo;
    private String mem_no;

    private String title;
    private int noticeType;
    private String phone;
    private String email;
}
