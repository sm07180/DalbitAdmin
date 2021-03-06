package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public class P_MessageListOutputVo extends BaseVo {
    private String message_idx;          //번호
    private String title;                //제목
    private String send_cont;       //메시지 내용
    private String target_rooms;       //발송 방송방번호 ('|' 구분자 사용)
    private String send_cnt;        //발송건수
    private Date reg_date;            //등록일
    private String reg_dateFormat;
    private String op_name;             //등록자

    public void setReg_date(java.sql.Date reg_date){
        this.reg_date = reg_date;
        this.reg_dateFormat = DalbitUtil.convertDateFormat(reg_date, "yyyy.MM.dd HH:mm:ss");
    }
}
