package com.dalbit.member.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.member.vo.*;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public interface M_MemberDao {

//    ProcedureVo callNickNameCheck(ProcedureVo procedureVo);
    ProcedureVo callMemberLogin(ProcedureVo procedureVo);
//    ProcedureVo callMemberJoin(ProcedureVo procedureVo);
//    ProcedureVo callChangePassword(ProcedureVo procedureVo);
//    ProcedureVo callMemberInfoView(ProcedureVo procedureVo);

//    ProcedureVo callMemberInfo(ProcedureVo procedureVo);
    List<P_MemberInfoVo> callMemberInfo(P_MemberInfoVo pMemberInfo);
    List<MemberInfoLevelListVo> callMemberLevelList(MemberInfoLevelListVo memberInfoLevelListVo);
    List<MemberInfoLevelListVo> callMemberGradeList(MemberInfoLevelListVo memberInfoLevelListVo);

    /* 연습용 */
    List<MemberListVo> getMemberList(MemberListVo memberListVo);


}
