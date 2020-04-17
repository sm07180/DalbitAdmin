package com.dalbit.content.vo;

import com.dalbit.common.vo.BaseVo;
import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AppInsertVo extends BaseVo {

    /* 앱버전 insert Vo*/
    private String os;         // 1:안드로이드, 2:IOS
    private String version;     // 버전
    private int is_force;       // 강제업데이트 여부
    private int is_use;         // 0: 사용안함, 1: 사용

}
