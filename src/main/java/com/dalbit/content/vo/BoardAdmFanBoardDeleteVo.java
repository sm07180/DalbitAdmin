package com.dalbit.content.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardAdmFanBoardDeleteVo extends PagingVo {

    /* 게시글 관리 > 팬보드 삭제 Vo*/

    /* input */
    private int idx;                    // 게시글 번호

    private int status;                  // 게시글 상태
    private String contents;                // 내용

}
