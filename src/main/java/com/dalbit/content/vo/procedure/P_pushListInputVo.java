package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_pushListInputVo extends SearchVo {
    private int push_idx;                //푸시번호
    private String send_type;           //발송 구분 (11: 전체, 10: 푸시, 01: 알림)

}
