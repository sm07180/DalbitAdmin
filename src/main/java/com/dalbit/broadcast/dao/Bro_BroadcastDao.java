package com.dalbit.broadcast.dao;

import com.dalbit.broadcast.vo.procedure.P_BroadcastDetailOutputVo;
import com.dalbit.broadcast.vo.procedure.P_BroadcastEditHistOutputVo;
import com.dalbit.broadcast.vo.procedure.P_BroadcastListOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface Bro_BroadcastDao {

    ArrayList<P_BroadcastListOutputVo> callBroadcastList(ProcedureVo procedureVo);

    P_BroadcastDetailOutputVo callBroadcastInfo(ProcedureVo procedureVo);
    ArrayList<P_BroadcastEditHistOutputVo> callBroadcastEditHistory(ProcedureVo procedureVo);
    ProcedureVo callBroadcastEdit(ProcedureVo procedureVo);
}
