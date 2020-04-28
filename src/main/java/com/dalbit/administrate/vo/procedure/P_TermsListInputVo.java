package com.dalbit.administrate.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_TermsListInputVo extends SearchVo {
    private int pageNo;
    private int terms_type;
}
