package com.dalbit.common.code;

import lombok.Getter;

@Getter
public enum EventCode {
    인증샷(2, "2020.08 PC인증샷 이벤트"),

    ;
    final private int eventIdx;
    final private String desc;

    EventCode(int eventIdx, String desc){
        this.eventIdx = eventIdx;
        this.desc = desc;
    }
}
