package com.dalbit.content.vo.procedure;

import lombok.Data;

@Data
public class P_WelcomeStatusOutputVo {
    private String mem_gift_name;       // 경품이름 (청취자)
    private String dj_gift_name;        // 경품이름 (DJ)
    private String gift_name;           // 경품이름
    private int cnt;                    // 총수

    public void setMem_gift_name(String value) {
        this.mem_gift_name = value;
        this.gift_name = value;
    }
    public void setDj_gift_name(String value) {
        this.dj_gift_name = value;
        this.gift_name = value;
    }
}
