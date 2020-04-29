package com.dalbit.administrate.vo.procedure;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_TermsDetailInputVo {
    private int idx;
    private int platform;
    private int view_on;
    private int terms_type;
    private String terms_title;
    private String terms_content;
    private String version;
    private String op_name;
    private String last_op_name;
    private String memo;

}
