package com.dalbit.common.code;

import lombok.Getter;

@Getter
public enum Code {

    //포토 배경 이미지 PREFIX
    포토_배경_PREFIX("/bg_0", "포토서버 배경 이미지 실제 경로(done) prefix"),
    포토_배경_임시_PREFIX("/bg_1", "포토서버 배경 이미지 임시 경로 prefix "),
    포토_배경_썸네일_PREFIX("/bg_2", "포토서버 배경 이미지 썸네일 prefix"),
    포토_배경_디폴트_PREFIX("/bg_3", "포토서버 배경 이미지 배경 디폴트 prefix"),

    //포토 프로필 이미지 PREFIX
    포토_프로필_PREFIX("/profile_0", "포토서버 프로필 실제 경로 prefix"),
    포토_프로필_임시_PREFIX("/profile_1", "포토서버 프로필 임시 경로 prefix"),
    포토_프로필_썸네일_PREFIX("/profile_2", "포토서버 프로필 이미지 썸네일 prefix"),
    포토_프로필_디폴트_PREFIX("/profile_3", "포토서버 배경 이미지 배경 디폴트 prefix"),

    배경이미지_파일명_PREFIX("roombg_", "배경이미지 파일명"),
    프로필이미지_파일명_PREFIX("profile_", "배경이미지 파일명"),

    포토_이미지_경로("_0/", "실제 파일이 올라갈 경로 -done 이후 경로"),
    포토_이미지_임시경로("_1/", "이미지가 올라가는 임시 경로"),

    인포렉스_메뉴("inforex.menu.key", "inforex.api.menu.url"),
    인포렉스_직급코드("inforex.posCode.key", "inforex.api.posCode.url"),
    인포렉스_부서코드("inforex.deptCode.key", "inforex.api.deptCode.url"),
    인포렉스_직책코드("inforex.dutyCode.key", "inforex.api.dutyCode.url"),
    인포렉스_임직원목록("inforex.memberList.key", "inforex.api.memberList.url"),
    
    
    SMS발송_회원가입("0", "회원가입"),
    SMS발송_비밀번호변경("1", "비밀번호변경"),
    SMS발송_환전완료("2", "환전완료"),
    SMS발송_환전불가("3", "환전취소"),
    SMS발송_가상계좌("4", "가상계좌"),
    SMS발송_운영자발송("7", "운영자발송"),

    

   ;

    final private String code;
    final private String desc;

    Code(String code, String desc){
        this.code = code;
        this.desc = desc;
    }
}
