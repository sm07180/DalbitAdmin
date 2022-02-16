package com.dalbit.content.vo.procedure;

import lombok.Data;

import java.util.Date;

@Data
public class P_InviteRecvListOutputVo {
    private String invitation_code;	        // 추천코드
    private String send_mem_no;	            // 회원 번호(보낸)
    private String send_mem_id;	            // 회원 아이디(보낸)
    private String send_mem_sex;	        // 회원성별(보낸)
    private int send_mem_age;	            // 나이(보낸)
    private int send_mem_dal_cnt;	        // 지급달(보낸)
    private String rcv_mem_no;	            // 회원 번호(받은)
    private String rcv_mem_id;	            // 회원 아이디(받은)
    private String rcv_send_mem_sex;	    // 회원성별(받은)
    private int rcv_mem_age;                // 나이(받은)
    private int rcv_mem_dal_cnt;	        // 지급달(받은)
    private String rcv_mem_nick;	        // 회원 닉네임(받은)
    private String rcv_image_profile;       // 프로필(받은)
    private int rcv_mem_level;              // 레벨(받은)
    private int rcv_mem_state;              // 회원상태(1:정상3:블럭, 4:탈퇴, 5:영구정지...)  (받은)
    private Date rcv_mem_join_date;         // 가입일자(받은)
    private String rcv_mem_phone;           // 폰번호
    private String rcv_ip;                  // ip
    private String rcv_last_device_uuid;    // 디바이스아이디
}
