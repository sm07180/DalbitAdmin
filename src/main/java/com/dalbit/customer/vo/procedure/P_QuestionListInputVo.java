package com.dalbit.customer.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_QuestionListInputVo extends SearchVo {

    private String slctPlatform;
    private String slctBrowser;
    private int sortPlatform;
    private int sortBrowser;
    private int sortState;
    private int pageNo;
    
}
