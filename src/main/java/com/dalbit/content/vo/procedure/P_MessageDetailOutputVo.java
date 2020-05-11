package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_MessageDetailOutputVo extends BaseVo {
    private String message_idx;          //번호
    private String send_cont;       //메세지 내용
    private String reg_date;            //등록일
    private String op_name;             //등록자
}
