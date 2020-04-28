package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_bannerListInputVo extends SearchVo {
    private int pageNo;

    private String is_view;
    private String position;
    private String platformGroup;
}
