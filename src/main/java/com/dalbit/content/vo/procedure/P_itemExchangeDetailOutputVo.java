package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_itemExchangeDetailOutputVo extends BaseVo {
    private String item_code;               //아이템코드
    private String item_name;               //상품명
    private String item_image;              //아이템이미지경로
    private String item_thumbnail;              //썸네일이미지경로
    private String item_price;              //아이템 가격
    private String item_type;               //아이템 타입( 신규,인기,한정)
    private String discount_rate;               //인율(0~100)
    private String sale_price;              //실제 판매 가격
    private String dal;             //지급 달 수량
    private String platform;                //플랫폼(PC(Web포함)/Mobile-Android/Mobile-IOS)
    private String desc;                //상품설명
    private String view_yn;             //게시상태(0: OFF, 1: ON)
    private String regDate;             //등록일자
    private String lastupdDate;             //최종변경일자
}
