package com.dalbit.status.vo.procedure;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_LevelSearchOutputVo {
    private float expPro;		    // 경험치 비율
    private int memExp;		        // 경험치
    private Date levelUpDate;	    // 최근레벨업일시
    private int levelUpDay;	        // 레벨(몇일전)
    private int level;		        // 레벨
    private int exp;		        // 누적경험치
    private String grade;		    // 명칭
    private String mem_no;		    // 회원 번호
    private String mem_userid;	    // 회원 유저 아이디
    private String mem_nick;	    // 회원 닉네임
    private String mem_sex;		    // 회원 성별
    private int age;		        // 나이
    private int newdj_badge;	    // 태그(신입)
    private int specialdj_badge;	// 태그(스페셜)
    private Date mem_join_date;	    // 가입일시
    private int inner;		        // 테스트 아이디 구분 0:일반,1:테스트
    private int present;		    // 선물한 달/별
    private int receive;		    // 선물받은 달/별
    private String broadDate;	    // 최근방송일시
    private String listenDate;	    // 최근청취일시
    private String lastLoginDate;	// 최근접속기록
    private int loginDay;		    // 접속기록(며칠전)
    private int ruby;		        // 보유달
    private int gold;		        // 보류별
}
