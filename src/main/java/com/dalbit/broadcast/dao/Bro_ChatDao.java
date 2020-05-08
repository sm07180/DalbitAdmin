package com.dalbit.broadcast.dao;

import com.dalbit.broadcast.vo.procedure.P_ChatListOutputVo;
import com.dalbit.broadcast.vo.procedure.P_ChatTargetListOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Bro_ChatDao {

    @Transactional(readOnly = true)
    ArrayList<P_ChatListOutputVo> callChatList(ProcedureVo procedureVo);
    @Transactional(readOnly = true)
    ArrayList<P_ChatTargetListOutputVo> callChatTargetList(ProcedureVo procedureVo);
}
