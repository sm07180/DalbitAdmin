package com.dalbit.content.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BannerOrderVo{

    public BannerOrderVo(){}
    public BannerOrderVo(int banner_idx, int order){
        this.banner_idx = banner_idx;
        this.order = order;
    }

    private String jsonParam;
    private int banner_idx;
    private int order;
}
