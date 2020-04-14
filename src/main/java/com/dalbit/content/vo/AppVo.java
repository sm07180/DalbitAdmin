package com.dalbit.content.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AppVo {

    /* 앱버전 Vo*/
    private int idx;
    private int os;             // 1:안드로이드, 2:IOS
    private String version;     // 버전
    private int is_force;       // 강제업데이트 여부
    private int is_use;         // 0: 사용안함, 1: 사용
    private String reg_date;    // 등록일

}
