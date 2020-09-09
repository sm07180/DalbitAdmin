package com.dalbit.content.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AppVo extends PagingVo {

    /* 앱버전 Vo*/
    private int idx;
    private Integer os;         // 1:안드로이드, 2:IOS
    private String version;     // 버전
    private Integer build_no;   // 빌드번호
    private Integer upBuild_no; // 최소 업데이트 빌드번호
    private int is_use;         // 0: 사용안함, 1: 사용
    private String reg_date;    // 등록일
    private String memo;        // 운영자 메모

    private String iosVersion;
    private String aosVersion;

}
