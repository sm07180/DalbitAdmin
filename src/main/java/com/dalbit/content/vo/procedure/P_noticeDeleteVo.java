package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class P_noticeDeleteVo extends BaseVo {

    public P_noticeDeleteVo(){}

    public P_noticeDeleteVo(String noticeIdx){
        this.noticeIdx = Integer.valueOf(noticeIdx);
    }

    private int noticeIdx;
    private String noticeIdxs;
}
