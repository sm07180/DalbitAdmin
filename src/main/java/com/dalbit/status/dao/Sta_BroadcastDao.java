package com.dalbit.status.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.status.vo.procedure.*;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface Sta_BroadcastDao {

    ArrayList<P_BroadcastTotalOutDetailVo> callBroadcastTotal(ProcedureVo procedureVo);
    ArrayList<P_BroadcastPlatformOutDetailVo> callBroadcastPlatform(ProcedureVo procedureVo);
    ArrayList<P_BroadcastSubjectCreateOutDetailVo> callBroadcastSubjectCreate(ProcedureVo procedureVo);
    ArrayList<P_BroadcastLiveOutputVo> callBroadcastLive(ProcedureVo procedureVo);
    ArrayList<P_BroadcastGiftOutputVo> callBroadcastGift(ProcedureVo procedureVo);


    ArrayList<P_BroadcastStatusOutputVo> callBroadcastSumStatus(ProcedureVo procedureVo);
}
