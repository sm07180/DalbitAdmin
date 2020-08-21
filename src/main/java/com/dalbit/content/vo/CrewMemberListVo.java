package com.dalbit.content.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CrewMemberListVo extends PagingVo {
    private int idx;
    private String mem_no;
    private int crewIdx;
    private String crewName;
    private String userId;
    private String memNick;
    private String memSex;
    private String birthYear;
    private String broadDate;
    private int broadCnt;
    private int broadTime;
    private int ranking;
    private int payCnt;
    private int payAmount;
    private int level;
    private int leader_yn;
}
