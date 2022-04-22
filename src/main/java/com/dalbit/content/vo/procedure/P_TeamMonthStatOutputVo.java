package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_TeamMonthStatOutputVo {
    private Date the_date;          // 월요일로 시작하는 일자
    private int tot_team_cnt;       // 전체팀수
    private int team_create_cnt;    // 팀 생성수
    private int team_del_cnt;       // 팀 삭제수
    private int team_mem_ins_cnt;   // 팀 가입수
    private int team_mem_del_cnt;   // 팀 탈퇴수
}
