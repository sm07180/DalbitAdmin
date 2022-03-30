package com.dalbit.menu.vo.procedure;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_PartnerSearchListOutputVo {
    private String mem_no;		            // 회원 번호
    private String mem_id;		            // 회원 아이디
    private String mem_userid;	            // 회원 유저아이디
    private String mem_nick;                // 회원 닉네임
    private String mem_sex;                 // 회원 성별
    private int inner;                      // 회원 1, 비회원 0
    private String image_profile;           // 회원 프로필
    private String mem_name;                // 회원 이름
    private String mem_phone;               // 회원 폰번호
    private String partnerDjYn;             // 파트너DJ 여부
    private String partner_benefit;         // 파트너DJ 혜택
}
