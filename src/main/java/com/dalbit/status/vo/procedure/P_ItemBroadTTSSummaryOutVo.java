package com.dalbit.status.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_ItemBroadTTSSummaryOutVo {
    private String the_date;            // 집계일자
    private String tts_crt_slct;        // TTS 캐릭터 구분 (a:빠다가이, b:하나)
    private int tts_send_cnt;           // TTS 선물건수(메시지미기입)
    private int tts_msg_send_cnt;       // TTS 사용달수(메세지기입)
    private int tot_tts_send_cnt;       // TTS 총선물건수
    private int tts_dal_cnt;            // TTS 사용달수(메세지미기입)
    private int tts_msg_dal_cnt;        // TTS 사용달수(메세지기입)
    private int tot_tts_dal_cnt;        // TTS 총사용달수
    private int tot_send_cnt;           // 선물 총건수(일반아이템 포함)
    private int tot_send_dal_cnt;       // 선물 총달수(일반아이템 포함)
}