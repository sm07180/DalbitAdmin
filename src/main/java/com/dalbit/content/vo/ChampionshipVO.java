package com.dalbit.content.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChampionshipVO {

    private String mem_no; //회원 번호
    private String memNick; //회원 닉네임
    private String memPhone; //       회원 폰번호
    private String memSex; //성별
    private String profileImage;//        회원 프로필
    private String totalPoint;//	        받은별
    private String winPoint;//	        승점
    private String qupid_mem_no;//    	    회원 번호(왕큐피트)
    private String qupid_memNick;//	    회원 닉네임(왕큐피트)
    private String qupid_memSex;//        성별(왕큐피트)
    private String qupid_profileImage; //   회원 프로필(왕큐피트)

}
