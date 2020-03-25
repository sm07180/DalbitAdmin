package com.dalbit.broadcast.dao;

import com.dalbit.broadcast.vo.procedure.P_ListenListOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface Bro_ListenerDao {
    ArrayList<P_ListenListOutputVo> callListener_detail(ProcedureVo procedureVo);
    ProcedureVo callForceLeave(ProcedureVo procedureVo);
}
