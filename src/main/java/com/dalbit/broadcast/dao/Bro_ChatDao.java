package com.dalbit.broadcast.dao;

import com.dalbit.broadcast.vo.procedure.P_ChatListOutputVo;
import com.dalbit.broadcast.vo.procedure.P_ChatTargetListOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface Bro_ChatDao {
    ArrayList<P_ChatListOutputVo> callChatList(ProcedureVo procedureVo);
    ArrayList<P_ChatTargetListOutputVo> callChatTargetList(ProcedureVo procedureVo);
}
