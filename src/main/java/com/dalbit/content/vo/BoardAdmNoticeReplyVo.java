package com.dalbit.content.vo;

import com.dalbit.common.vo.PagingVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class BoardAdmNoticeReplyVo extends PagingVo {

    /* 게시글 관리 > 회원공지 댓글 조회 Vo*/

    /* input */
    private String memNo;
    private int idx;

    /* output */
    private int depthType;
    private String memNick;
    private String memSex;
    private String memUserId;
    private String contents;
    private String profileImage;
    private Date writeDate;
    private String writeDateFormat;

    public void setWriteDate(Date writeDate){
        this.writeDate = writeDate;
        this.writeDateFormat = DalbitUtil.convertDateFormat(writeDate, "yyyy.MM.dd HH:mm:ss");
    }

}
