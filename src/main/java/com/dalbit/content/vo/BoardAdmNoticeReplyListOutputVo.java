package com.dalbit.content.vo;

import com.dalbit.common.vo.PagingVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class BoardAdmNoticeReplyListOutputVo extends PagingVo {

    /* 게시글 관리 > 회원공지댓글 리스트 조회 Vo*/

    /* output */

    /* 공지 vo */
    private int idx;
    private String memNo;
    private String memNick;
    private String memSex;
    private String memBirthYear;
    private String memUserId;
    private String contents;
    private int status;

    /* 공지 댓글 vo */
    private int replyIdx;
    private String replyMemNo;
    private String replyMemNick;
    private String replyMemSex;
    private String replyMemBirthYear;
    private String replyMemUserId;
    private String replyContents;
    private int replyStatus;
    private int replyInner;
    private Date writeDate;
    private String writeDateFormat;

    /* summary vo*/
    private int summaryTotalCnt;
    private int maleCnt;
    private int femaleCnt;
    private int noneCnt;

    public void setWriteDate(Date writeDate){
        this.writeDate = writeDate;
        this.writeDateFormat = DalbitUtil.convertDateFormat(writeDate, "yyyy.MM.dd HH:mm:ss");
    }

}
