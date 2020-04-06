package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_itemExchangeDeleteVo extends BaseVo {

    public P_itemExchangeDeleteVo(){}
    public P_itemExchangeDeleteVo(String item_code){
        this.item_code = item_code;
    }

    private String item_code;					// 아이템 코드
}
