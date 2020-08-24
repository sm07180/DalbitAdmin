package com.dalbit.menu.vo;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class SpecialDjContentVo {

    private String select_year;
    private String select_month;

    private String content_type; //이미지 or 버튼
    private int content_order; //이미지 or 버튼

    //content_type이 이미지일 경우
    private String image_pc_url;
    private String image_mobile_url;
    
    //content_type이 버튼일 경우
    private String button_type; //새창 or 레이어
    private String button_name;
    private String button_name_color;
    private String button_color;
    private String button_pc_link;
    private String button_mobile_link;

}
