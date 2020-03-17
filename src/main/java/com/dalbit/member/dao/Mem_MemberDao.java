package com.dalbit.member.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.member.vo.procedure.*;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface Mem_MemberDao {

    ProcedureVo callMemberLogin(ProcedureVo procedureVo);
    ArrayList<P_MemberListOutputVo> callMemberList(ProcedureVo procedureVo);
    P_MemberInfoOutputVo callMemberInfo(ProcedureVo procedureVo);
    ProcedureVo callNickNameCheck(ProcedureVo procedureVo);
    ProcedureVo callMemberEditor(ProcedureVo procedureVo);


    ProcedureVo callMemAdminMemoAdd(ProcedureVo procedureVo);
    ArrayList<P_MemberAdminMemoListOutputVo> callMemAdminMemoList(ProcedureVo procedureVo);
    ArrayList<P_MemberConnectOutputVo> callMemConnect(ProcedureVo procedureVo);
    ArrayList<P_MemberManagerListOutputVo> callMemManagerList(ProcedureVo procedureVo);
    ArrayList<P_MemberBlackListOutputVo> callMemBlackList(ProcedureVo procedureVo);

}
