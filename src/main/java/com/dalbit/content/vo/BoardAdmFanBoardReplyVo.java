package com.dalbit.content.vo;

import com.dalbit.common.vo.PagingVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class BoardAdmFanBoardReplyVo extends PagingVo {

    /* 게시글 관리 > 팬보드 대댓글 조회 Vo*/

    /* input */
    private int pageNo;
    private String mem_no;
    private String board_no;
    private String depth;
    private String idx;
    private String writer_mem_no;
    private String withdrawal;

    /* output */
    private String board_idx;
    private String profileImage;
    private String userId;
    private String nickName;
    private Date writeDate;
    private String writeDateFormat;
    private String contents;
    private String STATUS;
    private String memSex;
    private int replyCnt;   // 팬보드 댓글수
    private String mem_birth_year;
    private String view_yn;

    public void setWriteDate(Date writeDate){
        this.writeDate = writeDate;
        this.writeDateFormat = DalbitUtil.convertDateFormat(writeDate, "yyyy.MM.dd HH:mm:ss");
    }

}
