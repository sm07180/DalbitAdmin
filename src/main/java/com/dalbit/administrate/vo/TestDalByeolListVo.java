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

    private long dalSend;
    private long dalRecv;
    private long byeolSend;
    private long byeolRecv;


    private int send;
    private int recv;
    private String op_name;
    private String memNo;
    private int dal;
    private int byeol;
    private String last_upd_date;
    private String lastUpdDate;

    // summary
    private long sendDalMem;
    private long recvDalMem;
    private long dalTotalMem;
    private long sendByeolMem;
    private long recvByeolMem;
    private long byeolTotalMem;

    private long totalDal;
    private long totalByeol;



}
