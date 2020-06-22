package com.dalbit.administrate.vo.procedure;

import com.dalbit.common.vo.BaseVo;
import lombok.Getter;
import lombok.Setter;

import java.util.HashMap;
import java.util.List;

@Getter
@Setter
public class P_AlarmTalkTargetEditVo extends BaseVo {
    private List<HashMap> insertTargets;
    private List<HashMap> deleteTargets;

}

