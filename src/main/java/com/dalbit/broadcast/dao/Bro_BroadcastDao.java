package com.dalbit.broadcast.dao;

import com.dalbit.broadcast.vo.procedure.*;
import com.dalbit.common.vo.ProcedureVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;

@Repository
public interface Bro_BroadcastDao {

    @Transactional(readOnly = true)
    ArrayList<P_BroadcastListOutputVo> callBroadcastList(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    P_BroadcastDetailOutputVo callBroadcastInfo(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_BroadcastEditHistOutputVo> callBroadcastEditHistory(ProcedureVo procedureVo);

    ProcedureVo callBroadcastEdit(ProcedureVo procedureVo);
    HashMap<P_BroadcastDetailOutputVo,String> callBroadcastInfo_withdrawal(String mem_no);

    int callBroadcastMemberExit(P_BroadcastEditInputVo pBroadcastEditInputVo);
    int callBroadcastExit(P_BroadcastEditInputVo pBroadcastEditInputVo);
}
