package com.dalbit.member.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.member.vo.procedure.P_MemberAdminMemoListOutputVo;
import com.dalbit.member.vo.procedure.P_MemberInfoOutputVo;
import com.dalbit.member.vo.procedure.P_MemberListOutputVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface Mem_MemberDao {

    ProcedureVo callMemberLogin(ProcedureVo procedureVo);
    ArrayList<P_MemberListOutputVo> callMemberList(ProcedureVo procedureVo);
    P_MemberInfoOutputVo callMemberInfo(ProcedureVo procedureVo);
    ProcedureVo callMemAdminMemoAdd(ProcedureVo procedureVo);
    ArrayList<P_MemberAdminMemoListOutputVo> callMemAdminMemoList(ProcedureVo procedureVo);
    ProcedureVo callNickNameCheck(ProcedureVo procedureVo);
    ProcedureVo callMemberEditor(ProcedureVo procedureVo);

}
