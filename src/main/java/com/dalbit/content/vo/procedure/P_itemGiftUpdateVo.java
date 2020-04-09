package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_itemGiftUpdateVo extends BaseVo {
    private String item_code;			//아이템코드
    private String platform;			// 플랫폼(PC(Web포함)/Mobile-Android/Mobile-IOS)
    private int item_slct;				// 아이템구분(1: 방송방선물, 2: 방송방사용, 3: 달 선물)
    private String item_name;			// 상품명
    private int byeol;					// 지급 별 수량(사용후획득점수)
    private int item_price;				// 아이템 가격(달)
    private int item_price_ios;			// ios아이템 가격(달)
    private int discount_rate;			// 할인율(0~100)
    private String item_type;			// 아이템 타입( 신규,인기,한정)
    private int view_yn;				// 게시상태(0: OFF, 1: ON)
    private String item_image;			// 아이템이미지경로
    private String item_thumbnail;		// 썸네일이미지경로
    private int use_area;				// 사용영역구분
    private String file_slct;			// 파일구분
    private int play_time;				// 애니플레이타임
    private String webp_image;			// webp이미지경로
    private String jason_image;			// jason이미지경로
    private String desc;				// 상품설명
}
