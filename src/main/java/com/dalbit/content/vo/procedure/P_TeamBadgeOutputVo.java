package com.dalbit.content.vo.procedure;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_TeamBadgeOutputVo {
    private int auto_no;            // 배지고유번호
    private int team_no;            // 팀번호
    private String bg_code;         // 배지코드
    private String bg_name;         // 배지이름
    private int bg_objective;       // 목표수치(활동배지용)
    private int bg_achieve;         // 달성수치(활동배지용)
    private String bg_achieve_yn;   // 획득여부
    private String bg_represent_yn; // 대표설정여부
    private Date ins_date;          // 등록일자
    private Date upd_date;          // 수정일자

    private String del_chrgr_name;  // 삭제관리자명
    private Date del_date;          // 삭제일자
}
