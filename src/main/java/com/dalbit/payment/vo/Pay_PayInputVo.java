package com.dalbit.payment.vo;

import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Pay_PayInputVo extends SearchVo {

    private int pageNo;
    private int period;
    private String sDate;
    private String eDate;
    private int searchPayStatus;
    private int ostype;

}
