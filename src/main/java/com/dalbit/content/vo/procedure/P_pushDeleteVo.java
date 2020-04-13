package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_pushDeleteVo extends BaseVo {

    public P_pushDeleteVo(){}
    public P_pushDeleteVo(String push_idx){
        this.push_idx = push_idx;
    }

    private String push_idx;					// 아이템 코드
}
