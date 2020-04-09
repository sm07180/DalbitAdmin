package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_bannerDeleteVo extends BaseVo {

    public P_bannerDeleteVo(){}
    public P_bannerDeleteVo(String banner_idx){
        this.banner_idx = banner_idx;
    }

    private String banner_idx;					// 아이템 코드
}
