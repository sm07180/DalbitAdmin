package com.dalbit.content.vo.procedure;

import lombok.Data;

import java.util.Date;

@Data
public class P_InviteStateOutputVo {
    private String the_date;            // 날짜
    private int invitation_mem_cnt;     // 초대회원
    private int invitation_rcv_mem_cnt; // 초대받은회원
    private int invitation_dal_cnt;     // 달
}
