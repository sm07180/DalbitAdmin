package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_itemExchangeUpdateVo extends BaseVo {
    private String item_code;           //아이템코드
    private String platform;            //플랫폼(PC(Web포함)/Mobile-Android/Mobile-IOS)
    private String item_name;           //상품명
    private int dal;            //지급 달 수량
    private int item_price;         //아이템 가격
    private int discount_rate;          //할인율(0~100)
    private String item_type;          //아이템 타입( 신규,인기,한정)
    private String view_yn;         //게시상태(0: OFF, 1: ON)
    private String item_image;         //아이템이미지경로
    private String item_thumbnail;         //썸네일이미지경로
    private String desc;            //상품설명
}
