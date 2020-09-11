package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_EventAnnouncementInfoExtVo extends BaseVo {

    private String winnerContents;

    /* 기본 경품 목록 */
    private int prizeRank;
    private int prizeCnt;
    private String prizeName;
    private String nickName;
}
