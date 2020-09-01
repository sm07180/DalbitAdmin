package com.dalbit.connect.vo.procedure;

import com.dalbit.common.vo.SearchVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_UserCurrentInputVo extends SearchVo {
    private int pageNo;
    private String inner;
    private String broad;   // 접속회원중 청취자/청취 아닌사람
}
