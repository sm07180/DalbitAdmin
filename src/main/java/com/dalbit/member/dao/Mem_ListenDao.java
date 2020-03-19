package com.dalbit.member.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.member.vo.procedure.P_MemberListenOutputVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface Mem_ListenDao {

    ArrayList<P_MemberListenOutputVo> callListenHistory(ProcedureVo procedureVo);

}
