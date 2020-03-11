package com.dalbit.customer.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
public class P_DeclarationListOutputVo extends BaseVo {
    private int reportIdx;
    private String mem_no;
    private String mem_id;
    private String mem_nick;
    private String reported_mem_no;
    private String reported_mem_id;
    private String reported_mem_nick;
    private String room_no;
    private int reason;
    private String etc;
    private int status;
    private int op_code;
    private String platform;
    private String browser;
    private String ip;
    private Date opDate;
    private Date regDate;
}
