package com.dalbit.status.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
public class P_ItemBroadTTSOutVo {
    private int auto_no;            // 고유번호
    private String send_mem_no;     // 회원번호(보낸이)
    private String send_mem_nick;   // 회원닉네임(보낸이)
    private String item_code;       // 아이템코드
    private String item_name;       // 아이템이름
    private int send_item_cnt;      // 보낸아이템수
    private int send_dal_cnt;       // 보낸달수
    private String rcv_mem_no;		// 회원번호(받은이)
    private String rcv_mem_nick;    // 회원닉네임(받은이)
    private String tts_crt_slct;    // TTS 캐릭터 구분 (a:빠다가이, b:하나)
    private String tts_msg_yn;      // 메세지작성여부
    private String tts_msg;	        // 메세지내용
    private Date ins_date;          // 선물일자
}