package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_MessageInsertVo extends BaseVo {
    private String send_cont;       //메세지 내용
    private String reg_date;            //등록일
    private String op_name;             //등록자

    private String target_rooms;       //발송 방송방번호
}

