package com.dalbit.status.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.status.vo.procedure.*;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface Sta_LevelDao {

/*    @Transactional(readOnly = true)
    ArrayList<P_LevelOutputVo> getMemberLevelList(P_LevelInputVo pLevelInputVo);*/

    @Transactional(readOnly = true)
    ArrayList<P_LevelOutputVo> callMemberLevelList(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    List<Object> callMemberLevelListV2(P_LevelSearchInputVo pLevelSearchInputVo);

    @Transactional(readOnly = true)
    P_LevelOutputVo getTopFanInfo(String mem_no);

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

    @Transactional(readOnly = true)
    P_LevelSummaryOutputVo getLevelSummary60(P_LevelInputVo pLevelInputVo);

    @Transactional(readOnly = true)
    P_LevelSummaryOutputVo getLevelSummary70(P_LevelInputVo pLevelInputVo);

    @Transactional(readOnly = true)
    P_LevelSummaryOutputVo getLevelSummary80(P_LevelInputVo pLevelInputVo);

    @Transactional(readOnly = true)
    P_LevelSummaryOutputVo getLevelSummary90(P_LevelInputVo pLevelInputVo);

    @Transactional(readOnly = true)
    P_LevelSummaryOutputVo getLevelSummary100(P_LevelInputVo pLevelInputVo);

    @Transactional(readOnly = true)
    ArrayList<P_LevelListOutputVo> getLevelList(P_LevelInputVo pLevelInputVo);
}
