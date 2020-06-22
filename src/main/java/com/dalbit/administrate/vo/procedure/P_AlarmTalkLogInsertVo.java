package com.dalbit.content.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class P_AlarmTalkLogInsertVo extends BaseVo {
    private String group_idx;
    private String op_name;

    private List<P_AlarmTalkInsertVo> sendList;
}

