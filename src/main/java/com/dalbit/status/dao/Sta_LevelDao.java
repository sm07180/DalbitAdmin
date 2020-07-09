package com.dalbit.status.dao;

import com.dalbit.status.vo.procedure.P_LevelInputVo;
import com.dalbit.status.vo.procedure.P_LevelOutputVo;
import com.dalbit.status.vo.procedure.P_LevelSummaryOutputVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Sta_LevelDao {

    @Transactional(readOnly = true)
    ArrayList<P_LevelOutputVo> getMemberLevelList(P_LevelInputVo pLevelInputVo);

    @Transactional(readOnly = true)
    int getLevelListCnt(P_LevelInputVo pLevelInputVo);

    @Transactional(readOnly = true)
    P_LevelOutputVo getLevelSummary(P_LevelInputVo pLevelInputVo);

    @Transactional(readOnly = true)
    P_LevelSummaryOutputVo getLevelSummary10(P_LevelInputVo pLevelInputVo);

    @Transactional(readOnly = true)
    P_LevelSummaryOutputVo getLevelSummary20(P_LevelInputVo pLevelInputVo);

    @Transactional(readOnly = true)
    P_LevelSummaryOutputVo getLevelSummary30(P_LevelInputVo pLevelInputVo);

    @Transactional(readOnly = true)
    P_LevelSummaryOutputVo getLevelSummary40(P_LevelInputVo pLevelInputVo);

    @Transactional(readOnly = true)
    P_LevelSummaryOutputVo getLevelSummary50(P_LevelInputVo pLevelInputVo);
}
