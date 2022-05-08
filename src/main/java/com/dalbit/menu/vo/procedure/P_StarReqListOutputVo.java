package com.dalbit.menu.vo.procedure;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_StarReqListOutputVo {
    private int idx;                    // 접수기간 번호
    private String mem_no;              // 회원 번호
    private String mem_name;            // 회원 이름
    private String mem_phone;           // 회원 전화번호
    private String op_name;             //
    private Date last_upd_date;         // 최근 수정일
    private int specialdj_badge;        // 스타DJ 뱃지
    private int specialdj_cnt;          // 스타DJ 횟수
    private String mem_id;              // 회원 아이디
    private String mem_nick;            // 회원 닉네임
    private String mem_sex;             // 회원 번호
    private String mem_birth_year;      // 회원 생년
    private String mem_birth_month;     // 회원 생월
    private String mem_birth_day;       // 회원 생일
    private int inner;                  // 내부직원여부(0:일반,1:내부)
    private int play_cnt;               // 방송시간
    private int like_cnt;               // 받은 좋아요수 (통합)
    private int boost_good_cnt;         // 부스터 좋아요 수 * 10
    private int byeol_cnt;              // 선물받은별수
    private int view_cnt;               // 평균 시청자수(시청자/방)
    private int warm_cnt;               // 경고
    private int block_cnt;              // 정지
    private Double time_rank_score_cnt; // 랭킹 가산점
    private int admin_score_cnt;        // 어드민 가산점
    private Double tot_score_cnt;       // 총 점수
}
