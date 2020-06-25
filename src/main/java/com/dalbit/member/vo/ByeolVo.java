package com.dalbit.member.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ByeolVo extends PagingVo {
    private String mem_no;
    private int walletType;
}
