package com.dalbit.menu.vo.procedure;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_RoomListVo {

    /* Input */
    private int memLogin;                   //회원 로그인 상태(1: 회원, 0: 비회원)
    private String mem_no;                  //방리스트 요청 회원번호
    private Integer slctType;               //검색구분 -1 or 0: null, 1: 추천, 2:인기, 3:신입
    private String subjectType;             //방주제, 리스트 우선순위 설정
    private int pageNo;                     //현재 페이지 번호
    private int pageCnt;                    //페이지당 리스트 개수

    /* Output */
    private String roomNo;                  //방번호
    private String subject_type;            //방주제
    private String title;                   //방제목
    private Object image_background;        //방배경이미지
    private String msg_welcom;              //환영메시지
    private int type_entry;                 //입장제한
    private String notice;                  //공지사항
    private int state;                      //방상태
    private String code_link;               //방공유코드
    private int count_entry;                //참여자수
    private int count_good;                 //좋아요수
    private Date start_date;                //방송시작시간
    private String bj_mem_no;               //bj 회원번호
    private String bj_nickName;             //bj 닉네임
    private String bj_memSex;               //bj 성별
    private int bj_birthYear;               //bj 생년
    private int bj_age;                     //bj 나이대
    private Object bj_profileImage;         //bj 프로필이미지
    private String guest_mem_no;            //게스트회원번호
    private String guest_nickName;          //게스트닉네임
    private String guest_memSex;            //게스트성별
    private int guest_birthYear;            //게스트생년
    private int guest_age;                  //게스트 나이대
    private Object guest_profileImage;      //게스트프로필이미지

    private String bj_streamid;            //bj 스트림아이디
    private String bj_publish_tokenid;     //bj 토큰아이디
    private String bj_play_tokenid;        //bj play토큰
    private String guest_streamid;         //guest 스트림아이디
    private String guest_publish_tokenid;  //guest 토큰아이디
    private String guest_play_tokenid;     //guest play토큰

    private int badge_recomm;                   //추천뱃지
    private int badge_popular;                  //인기뱃지
    private int badge_newdj;                    //신입뱃지

}
