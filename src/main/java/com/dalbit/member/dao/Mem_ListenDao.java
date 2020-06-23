package com.dalbit.member.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.member.vo.procedure.P_MemberListenOutputVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface Mem_ListenDao {

    @Transactional(readOnly = true)
    ArrayList<P_MemberListenOutputVo> callListenHistory(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_MemberListenOutputVo> callListenList(MemberVo MemberVo);

}
