package com.dalbit.content.vo.procedure;

import lombok.Data;

@Data
public class P_WelcomeStatusOutputVo {
    private String mem_gift_name;       // 경품이름 (청취자)
    private String dj_gift_name;        // 경품이름 (DJ)
    private int step_no;                // 총수
}
