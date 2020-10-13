package com.dalbit.administrate.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TestDalByeolListVo extends PagingVo {

    private String type;
    private String emp_name;

    private int dalSend;
    private int dalRecv;
    private int byeolSend;
    private int byeolRecv;


    private int send;
    private int recv;
    private String op_name;
    private String memNo;
    private int dal;
    private int byeol;
    private String last_upd_date;
    private String lastUpdDate;

    // summary
    private int sendDalMem;
    private int recvDalMem;
    private int dalTotalMem;
    private int sendByeolMem;
    private int recvByeolMem;
    private int byeolTotalMem;

    private int totalDal;
    private int totalByeol;



}
