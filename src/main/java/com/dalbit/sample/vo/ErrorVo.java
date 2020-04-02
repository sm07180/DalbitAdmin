package com.dalbit.sample.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ErrorVo {
    private int idx;
    private String mem_no;
    private String ostype;
    private String version;
    private String dtype;
    private String ctype;
    private String desc;
    private String upd_date;
}
