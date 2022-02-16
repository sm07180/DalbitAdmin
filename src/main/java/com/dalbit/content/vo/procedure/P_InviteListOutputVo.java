package com.dalbit.content.vo.procedure;

import lombok.Data;

import java.util.Date;

@Data
public class P_InviteListOutputVo {
    private String mem_no;          // 회원 번호
    private String invitation_code; // 추천코드
    private int invitation_cnt;	    // 초대회원수
    private int invitation_dal_cnt;	// 초대 지급달
    private Date ins_date;		    // 등록일자
    private Date upd_date;		    // 수정일자
    private String mem_userid;	    // 회원 아이디
    private String mem_nick;	    // 회원 닉네임
    private String mem_sex;		    // 회원성별
    private String image_profile;	// 프로필 이미지
    private int mem_level;	        // 레벨
    private int mem_state;	        // 회원상태(1:정상3:블럭, 4:탈퇴, 5:영구정지...)
    private String mem_phone;	    // 폰번호
    private String ip;		        // ip
    private String last_device_uuid;// 디바이스아이디
}
