package com.dalbit.clip.dao;

import com.dalbit.clip.vo.procedure.*;
import com.dalbit.common.vo.ProcedureVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Cli_ClipStatusDao {

    @Transactional(readOnly = true)
    ArrayList<P_ClipStatusGiftOutputVo> callClipStatusGift(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_ClipStatusTimeOutputVo> callClipStatusTime(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_ClipStatusSubjectOutputVo> callClipStatusType(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_ClipStatusPlatformOutputVo> callClipStatusPlatform(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_ClipStatusAgeOutputVo> callClipStatusAge(ProcedureVo procedureVo);
}
