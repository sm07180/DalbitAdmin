package com.dalbit.administrate.dao;

import com.dalbit.administrate.vo.procedure.*;
import com.dalbit.common.vo.ProcedureVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;

@Repository
public interface Adm_AlarmTalkDao {
    @Transactional(readOnly = true)
    ProcedureVo callSpStatGetData(ProcedureVo procedureVo);

    int callAlarmTalkLogAdd(P_AlarmTalkLogInsertVo pAlarmTalkLogInsertVo);
    
    @Transactional(readOnly = true)
    List<P_AlarmTalkTargetListOutputVo> callAlarmTalkTarget();

    @Transactional(readOnly = true)
    int callAlarmTalkLogList_total(P_AlarmTalkLogListInputVo pAlarmTalkLogListInputVo);
    @Transactional(readOnly = true)
    List<P_AlarmTalkLogListOutputVo> callAlarmTalkLogList(P_AlarmTalkLogListInputVo pAlarmTalkLogListInputVo);

    int alarmTalkTargetAdd(HashMap<String,Object> targets);
    int alarmTalkTargetRemove(HashMap<String,Object> targets);

    int callAlarmTalkLogUpdate(P_AlarmTalkLogUpdateVo resultLog);


}
