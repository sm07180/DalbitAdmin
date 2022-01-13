package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_XmasTreeDelStoryInputVo {
    private int storyNo;  //사연등록번호
    private String delChrgrName;  //삭제 관리자명
    private int delSlct = 2;  //[1:본인삭제 2:관리자 삭제]
}
