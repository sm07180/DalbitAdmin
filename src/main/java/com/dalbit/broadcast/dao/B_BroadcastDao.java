package com.dalbit.broadcast.dao;

import com.dalbit.broadcast.vo.BroadcastInfoVo;
import com.dalbit.broadcast.vo.BroadcastListVo;
import com.dalbit.broadcast.vo.BroadcastTypeListVo;
import com.dalbit.broadcast.vo.procedure.P_BroadcastDetailOutputVo;
import com.dalbit.broadcast.vo.procedure.P_BroadcastEditHistOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface B_BroadcastDao {

    List<BroadcastTypeListVo> callBroadcastTypeList(BroadcastTypeListVo broadcastTypeListVo);
    List<BroadcastListVo> callBroadcastList(BroadcastListVo broadcastListVo);
    int callBroadcastList_cnt(BroadcastListVo broadcastListVo);

    P_BroadcastDetailOutputVo callBroadcastInfo(ProcedureVo procedureVo);
    ArrayList<P_BroadcastEditHistOutputVo> callBroadcastEditHistory(ProcedureVo procedureVo);
}
