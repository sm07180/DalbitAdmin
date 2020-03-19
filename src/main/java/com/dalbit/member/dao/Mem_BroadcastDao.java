package com.dalbit.member.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.member.vo.procedure.P_MemberBroadcastOutputVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface Mem_BroadcastDao {

    ArrayList<P_MemberBroadcastOutputVo> callBroadHistory(ProcedureVo procedureVo);

}
