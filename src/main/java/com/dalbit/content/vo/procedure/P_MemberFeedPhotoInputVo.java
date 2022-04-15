package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_MemberFeedPhotoInputVo {
    private int feedNo;       // 피드번호
    private int tailNo;       // 댓글번호
    private String delChrgrName; // 삭제자
}
