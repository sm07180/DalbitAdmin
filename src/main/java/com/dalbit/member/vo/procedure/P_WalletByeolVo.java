package com.dalbit.member.vo.procedure;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class P_WalletByeolVo extends PagingVo {

    /* Input */
    private String mem_no;
    private String walletType;            //(0: 전체, 1:구매, 2:선물, 3:교환)
    private int slct_type;                  //사용 구분(1: 루비교환, 2: 선물, 3: 환전, 7: 이벤트 받기)
    private int pageNo;
}
