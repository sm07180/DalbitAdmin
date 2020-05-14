package com.dalbit.status.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.status.vo.procedure.*;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Sta_BroadcastDao {

    @Transactional(readOnly = true)
    ArrayList<P_BroadcastTotalOutDetailVo> callBroadcastTotal(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_BroadcastPlatformOutDetailVo> callBroadcastPlatform(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_BroadcastSubjectCreateOutDetailVo> callBroadcastSubjectCreate(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_BroadcastSubjectTimeOutDetailVo> callBroadcastSubjectTime(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_BroadcastDjOutDetailVo> callBroadcastDj(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_BroadcastListenerSubjectOutDetailVo> callBroadcastListenerSubject(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_BroadcastLiveOutputVo> callBroadcastLive(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_BroadcastGiftOutputVo> callBroadcastGift(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_BroadcastGiftHistoryOutputDetailVo> callBroadcastGiftHistory(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_BroadcastStatusOutputVo> callBroadcastSumStatus(ProcedureVo procedureVo);
}
