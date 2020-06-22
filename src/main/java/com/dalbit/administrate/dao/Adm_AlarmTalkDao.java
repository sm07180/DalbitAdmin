package com.dalbit.administrate.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.administrate.vo.procedure.P_AlarmTalkLogInsertVo;
import com.dalbit.administrate.vo.procedure.P_AlarmTalkLogUpdateVo;
import com.dalbit.administrate.vo.procedure.P_AlarmTalkTargetListOutputVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface AlarmTalkDao {
    @Transactional(readOnly = true)
    ProcedureVo callSpStatGetData(ProcedureVo procedureVo);

    int callAlarmTalkLogAdd(P_AlarmTalkLogInsertVo pAlarmTalkLogInsertVo);
    
    @Transactional(readOnly = true)
    List<P_AlarmTalkTargetListOutputVo> callAlarmTalkTarget();

    int callAlarmTalkLogUpdate(P_AlarmTalkLogUpdateVo resultLog);
}
