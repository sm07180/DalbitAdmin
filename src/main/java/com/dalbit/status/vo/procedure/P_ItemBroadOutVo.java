package com.dalbit.status.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_ItemBroadOutVo extends SearchVo {

    private int sum_itemCnt;
    private int sum_itemAmt;
    private int sum_totalItemCnt;
    private int sum_totalItemAmt;

}