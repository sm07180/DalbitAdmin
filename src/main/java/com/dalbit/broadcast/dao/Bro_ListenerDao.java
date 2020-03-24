package com.dalbit.broadcast.dao;

import com.dalbit.broadcast.vo.procedure.P_BroadcastListenListOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface Bro_ListenerDao {
    ArrayList<P_BroadcastListenListOutputVo> callListener_detail(ProcedureVo procedureVo);
}
