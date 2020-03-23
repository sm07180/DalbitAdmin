package com.dalbit.common.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CookieVo {
    String key;
    String value;
    String path;
    String domain;
}
