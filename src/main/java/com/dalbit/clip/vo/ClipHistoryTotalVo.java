package com.dalbit.clip.vo;

import com.dalbit.common.vo.PagingVo;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ClipHistoryTotalVo extends PagingVo {

    /* input */

    /* output */
    private int manTotalCnt;
    private int femaleTotalCnt;
    private int unknownTotalCnt;


}
