package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class P_EventAnnouncementEditVo extends BaseVo {
    private int eventIdx;
    private String winnerContents;
}
